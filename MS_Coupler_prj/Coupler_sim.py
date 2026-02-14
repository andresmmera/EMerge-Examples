import emerge as em
import numpy as np
import time
from datetime import datetime

# Constants
cm = 0.01
mm = 0.001
mil = 0.0254 * mm
um = 0.000001
PI = np.pi

er = 3.55
th = 0.508      # mm. 20 mils
tand = 0.0029

# 50 ohm line parameters for RO4003C
W0 = 1.08       # mm. Width for 50 ohm line

# Coupled line parameters for 15 dB coupler
L_coupled = 22.75   # mm. Quarter wavelength at center frequency (2.5 GHz)
W_coupled = 1.0     # mm. Line width for coupled section
S_coupled = 0.3     # mm. Gap between coupled lines (tight coupling for 15 dB)

# Feed line lengths
L_feed = 10.0       # mm. Input/output feed lines
L_trans = L_feed / 10  # mm. Length of the transition

Hair = 10  # mm. Air box height

project_name = "Coupler_15dB"

# --- Create simulation object -------------------------------------------
model = em.Simulation(project_name)
model.check_version("2.3.0")

# --- Material and PCB layouter ------------------------------------------
mat = em.Material(er=er, tand=tand, color="#217627", opacity=0.1)

# PCBNew replaces PCBLayouter; unit is passed as a scaling factor (mm = 0.001)
pcb = em.geo.PCBNew(th, unit=mm, material=mat)

# --- Route coupled-line traces ------------------------------------------
# Port labelling uses dict-key syntax ['name'] instead of .paths[n].start/.end

# Upper trace: left feed → taper → 1st coupled stub entry
pcb.new(0, 0, W0, (1, 0))['p1'] \
    .straight(L_feed) \
    .straight(L_trans, W_coupled)

x_1st = L_feed + L_trans + W_coupled / 2
x_2nd = x_1st + W_coupled + S_coupled
y_top = W_coupled / 2
y_bot = y_top - L_coupled

# Parallel coupled lines (vertical)
pcb.new(x_1st, y_top, W_coupled, (0, -1)).straight(L_coupled)
pcb.new(x_2nd, y_top, W_coupled, (0, -1)).straight(L_coupled)

# Lower trace: left exit → taper → output feed  (Port 2 – Through)
pcb.new(x_1st, y_bot + W_coupled / 2, W_coupled, (-1, 0)) \
    .straight(W_coupled / 2) \
    .straight(L_trans, W_coupled) \
    .straight(L_feed, W0)['p2']

# Lower trace: right exit → taper → output feed  (Port 4 – Isolated)
pcb.new(x_2nd, y_bot + W_coupled / 2, W_coupled, (1, 0)) \
    .straight(W_coupled / 2) \
    .straight(L_trans, W_coupled) \
    .straight(L_feed, W0)['p4']

# Upper trace: right exit → taper → output feed  (Port 3 – Coupled)
pcb.new(x_2nd, 0, W_coupled, (1, 0)) \
    .straight(W_coupled / 2) \
    .straight(L_trans, W_coupled) \
    .straight(L_feed, W0)['p3']

# --- Compile traces ------------------------------------------------------
stripline = pcb.compile_paths(merge=True)

# --- PCB bounding box and substrate/air volumes -------------------------
pcb.determine_bounds(topmargin=15, bottommargin=15, leftmargin=0, rightmargin=0)

diel = pcb.generate_pcb(merge=True)    # generate_pcb replaces gen_pcb
air  = pcb.generate_air(Hair)          # generate_air replaces gen_air

# --- Define wave ports ---------------------------------------------------
# modal_port now references named path endpoints stored via ['label'] syntax
p1 = pcb.modal_port(pcb['p1'], width_multiplier=3, height=2 * th)   # Input
p2 = pcb.modal_port(pcb['p2'], width_multiplier=3, height=2 * th)   # Through
p3 = pcb.modal_port(pcb['p3'], width_multiplier=3, height=2 * th)   # Coupled
p4 = pcb.modal_port(pcb['p4'], width_multiplier=3, height=2 * th)   # Isolated

# --- Solver settings -----------------------------------------------------
model.mw.set_resolution(0.25)                       # replaces m.physics.resolution
model.mw.set_frequency_range(0.1e9, 5.0e9, 40)      # replaces m.physics.set_frequency_range

# --- Assemble geometry ---------------------------------------------------
model.commit_geometry()                              # replaces m.define_geometry(...)

# --- Mesh refinement and generation -------------------------------------
model.mesher.set_boundary_size(stripline, 0.75 * mm)
model.generate_mesh()
model.view()

# --- Boundary conditions -------------------------------------------------
# model.mw.bc.ModalPort replaces em.bc.ModalPort
# modetype='TEM' replaces the separate modal_analysis() calls
port1 = model.mw.bc.ModalPort(p1, 1, modetype='TEM')   # Input
port2 = model.mw.bc.ModalPort(p2, 2, modetype='TEM')   # Through
port3 = model.mw.bc.ModalPort(p3, 3, modetype='TEM')   # Coupled
port4 = model.mw.bc.ModalPort(p4, 4, modetype='TEM')   # Isolated

# --- Run frequency-domain solver ----------------------------------------
start_time = time.time()
data = model.mw.run_sweep(parallel=True, n_workers=4, frequency_groups=8)
run_time = (time.time() - start_time) / 60          # minutes

# --- Post-solve visualisation -------------------------------------------
# add_portmode requires solved modes, so it must come after run_sweep.
# We use the k0 from the mid-band field solution.
field_mid = data.field.find(freq=2.5e9)
model.display.add_object(diel, opacity=0.2)
model.display.add_object(stripline)
model.display.add_portmode(port1, k0=field_mid.k0)
model.display.add_portmode(port2, k0=field_mid.k0)
model.display.add_portmode(port3, k0=field_mid.k0)
model.display.add_portmode(port4, k0=field_mid.k0)
model.display.animate().add_field(
    field_mid.cutplane(0.5 * mm, z=-0.5 * th * mm).scalar('Ez', 'complex'),
    symmetrize=True,
)
model.display.show()

# --- Post-process and export Touchstone ----------------------------------
grid = data.scalar.grid

comments = [
    "Substrate: RO4003C",
    f"h = {th} mm",
    "Design parameters:",
    f"W0 = {W0} mm",
    f"L_coupled = {L_coupled} mm",
    f"W_coupled = {W_coupled} mm",
    f"S_coupled = {S_coupled} mm",
    f"L_feed = {L_feed} mm",
    f"L_trans = {L_trans} mm",
    f"Air box height = {Hair} mm",
    f"Run time = {run_time:.2f} min",
]

timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
file_name = project_name + "_EMerge_" + timestamp
grid.export_touchstone(file_name, custom_comments=comments)
