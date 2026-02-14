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
MHz = 1e6
GHz = 1e9

# Microstrip line dimmensions
L0 = 20   # mm
W0 = 1.1  # mm

# Substrate properties
th   = 0.508   # mm = 20 mils, PCB thickness
er   = 3.55    # dielectric constant
tand = 0.0029

# Air box
Hair = 10 * th  # mm, air box height
PCB_width = 40

# Frequency sweep
fstart = 100 * MHz
fstop = 5 * GHz
n_points = 40

project_name = "MS_Line"

# --- Create simulation object -------------------------------------------
model = em.Simulation(project_name)
model.check_version("2.3.0")

# --- Material and PCB layouter ------------------------------------------
pcbmat = em.Material(er=er, tand=tand)

# PCBNew replaces PCBLayouter
layouter = em.geo.PCBNew(th, unit=mm, material=pcbmat)

# --- Route trace ---------------------------------------------------------
layouter.new(0, 0, W0, (1, 0))['p1'].straight(L0)['p2']

# --- Wave ports ----------------------------------------------------------
p1 = layouter.modal_port(layouter['p1'], height=Hair)
p2 = layouter.modal_port(layouter['p2'], height=Hair)

# --- Compile traces ------------------------------------------------------
polies = layouter.compile_paths(merge=True)

# --- PCB bounding box and volumes ----------------------------------------
layouter.determine_bounds(leftmargin=0, topmargin=20, rightmargin=0, bottommargin=20)

# generate_pcb / generate_air replace gen_pcb / gen_air
pcb = layouter.generate_pcb(merge=True)
air = layouter.generate_air(Hair)

# --- Solver settings -----------------------------------------------------
model.mw.set_resolution(0.1)
model.mw.set_frequency_range(fstart, fstop, n_points)

# --- Assemble geometry ---------------------------------------------------
model.commit_geometry()

# --- Mesh refinement -----------------------------------------------------
model.mesher.set_boundary_size(polies, 1 * mm, growth_rate=1.2)
model.mesher.set_face_size(p1, 2 * mm)
model.mesher.set_face_size(p2, 2 * mm)

# --- Mesh and preview ----------------------------------------------------
model.generate_mesh()
model.view()

# --- Boundary conditions -------------------------------------------------
port1 = model.mw.bc.ModalPort(p1, 1, modetype='TEM')
port2 = model.mw.bc.ModalPort(p2, 2, modetype='TEM')

# --- Run frequency-domain solver ----------------------------------------
start_time = time.time()
data = model.mw.run_sweep(parallel=True, n_workers=3)
run_time = (time.time() - start_time) / 60  # minutes

# --- Post-solve visualisation -------------------------------------------
# add_portmode must come after run_sweep so modes are available
field_mid = data.field.find(freq=1e9)
model.display.add_object(pcb, opacity=0.2)
model.display.add_object(polies)
model.display.add_portmode(port1, k0=field_mid.k0)
model.display.add_portmode(port2, k0=field_mid.k0)
model.display.animate().add_field(
    field_mid.cutplane(0.5 * mm, z=-0.5 * th * mm).scalar('Ez', 'complex'),
    symmetrize=True,
)
model.display.show()

# --- Export Touchstone ---------------------------------------------------
grid = data.scalar.grid

comments = [
    "Substrate: RO4003C",
    f"h = {th} mm",
    "Design parameters:",
    f"W0 = {W0} mm",
    f"L0 = {L0} mm",
    f"Air box height = {Hair} mm",
    f"Run time = {run_time:.2f} min",
]

timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
file_name = project_name + "_EMerge_" + timestamp
grid.export_touchstone(file_name, custom_comments=comments)
