import emerge as em
from emerge.pyvista import PVDisplay
import numpy as np
import time
from datetime import datetime

# Constants
cm = 0.01
mm = 0.001
mil = 0.0254
um = 0.000001
PI = np.pi

W = 5
D = 5
er = 3.55 # 
th = 0.508 # mm. 20 mils
tand = 0.0029

# 50 ohm line parameters for RO4003C
W0 = 1.08  # mm. Width for 50 ohm line

# Coupled line parameters for 15 dB coupler
L_coupled = 22.75  # mm. Quarter wavelength at center frequency (2.5 GHz)
W_coupled = 1  # mm. Line width for coupled section
S_coupled = 0.3  # mm. Gap between coupled lines (tight coupling for 15 dB)

# Feed line lengths
L_feed = 10.0  # mm. Input/output feed lines
L_trans = L_feed/10 # mm. Length of the transition

Hair = 10 # mm. Air box height

# We can define the material using the Material class. Just supply the dielectric properties and you are done!
pcbmat = em.Material(er=er, tand=tand)

project_name = "Coupler_15dB"

with em.Simulation3D(project_name, save_file=True) as m:
    mat = em.Material(3.55, color="#217627", opacity=0.1)
    pcb = em.geo.PCBLayouter(th, unit=mm)
    
    # Port 1 (Input) to Port 2 (Through) - main line
    
    # Upper trace. Left side of the coupler
    pcb.new(0, 0, W0, (1,0)).straight(L_feed).straight(L_trans, W_coupled) # [0]
        
    
    x_1st_coupled_line = L_feed + L_trans + W_coupled/2
    y_start_coupled_lines = W_coupled/2
    y_end_coupled_lines = y_start_coupled_lines-L_coupled
    
    x_2nd_coupled_line = x_1st_coupled_line + W_coupled + S_coupled
    
    # Parallel lines
    pcb.new(x_1st_coupled_line, y_start_coupled_lines, W_coupled, (0,-1)).straight(L_coupled) # [11
    pcb.new(x_2nd_coupled_line, y_start_coupled_lines, W_coupled, (0,-1)).straight(L_coupled) # [2]
    
    # Lower trace. Left side of the coupler
    pcb.new(x_1st_coupled_line, y_end_coupled_lines+W_coupled/2, W_coupled, (-1,0)).straight(W_coupled/2).straight(L_trans, W_coupled).straight(L_feed, W0) # [3]
    
    
    # Lower trace. Right side of the coupler
    pcb.new(x_2nd_coupled_line, y_end_coupled_lines+W_coupled/2, W_coupled, (1,0)).straight(W_coupled/2).straight(L_trans, W_coupled).straight(L_feed, W0) # [4]
    
    # Upper trace. Right side of the coupler
    pcb.new(x_2nd_coupled_line, 0, W_coupled, (1,0)).straight(W_coupled/2).straight(L_trans, W_coupled).straight(L_feed, W0) # [5]
    

    stripline = pcb.compile_paths(merge=True)
    
    # Set PCB bounds with some margin
    pcb.determine_bounds(topmargin=15, bottommargin=15, leftmargin=0, rightmargin=0)

    diel = pcb.gen_pcb()
    air = pcb.gen_air(Hair)

    diel.material = mat

    # Define ports
    p1 = pcb.modal_port(pcb.paths[0].start, width_multiplier=3, height=2*th)  # Input
    p2 = pcb.modal_port(pcb.paths[3].end, width_multiplier=3, height=2*th)    # Through
    p3 = pcb.modal_port(pcb.paths[5].end, width_multiplier=3, height=2*th)    # Coupled
    p4 = pcb.modal_port(pcb.paths[4].end, width_multiplier=3, height=2*th)    # Isolated

    m.physics.resolution = 1  # Mesh resolution

    # Set frequency range around 2.5 GHz center frequency
    m.physics.set_frequency_range(0.1e9, 5.0e9, 40)

    m.define_geometry(stripline, diel, p1, p2, p3, p4, air)

    m.mesher.set_boundary_size(stripline, 0.75*mm)

    m.generate_mesh()

    #m.view(use_gmsh=True)
    m.view()
    
    # Define boundary conditions
    port1 = em.bc.ModalPort(p1, 1, True)   # Input
    port2 = em.bc.ModalPort(p2, 2, False)  # Through
    port3 = em.bc.ModalPort(p3, 3, False)  # Coupled
    port4 = em.bc.ModalPort(p4, 4, False)  # Isolated
    pec = em.bc.PEC(stripline)

    m.physics.assign(port1, port2, port3, port4, pec)
    
    # Modal analysis for each port
    m.physics.modal_analysis(port1, 1, direct=True, TEM=True, freq=2.5e9)
    m.physics.modal_analysis(port2, 1, direct=True, TEM=True, freq=2.5e9)
    m.physics.modal_analysis(port3, 1, direct=True, TEM=True, freq=2.5e9)
    m.physics.modal_analysis(port4, 1, direct=True, TEM=True, freq=2.5e9)

    # Visualization
    d = PVDisplay(m.mesh)
    d.add_object(diel, color='green', opacity=0.5)
    d.add_object(stripline, color='red')
    d.add_object(p1, color='blue', opacity=0.3)
    d.add_object(p2, color='blue', opacity=0.3)
    d.add_object(p3, color='cyan', opacity=0.3)
    d.add_object(p4, color='magenta', opacity=0.3)
    d.add_portmode(port1, 21)
    d.add_portmode(port2, 21)
    d.add_portmode(port3, 21)
    d.add_portmode(port4, 21)
    d.show()

    # Run simulation
    start_time = time.time()
    data = m.physics.frequency_domain(parallel=True, njobs=2, frequency_groups=4 )
    stop_time = time.time()
    run_time = (stop_time - start_time)/60 # in minutes
    
    # Save Touchstone data
    comments = [
    f"Substrate: RO4003C",
    f"h = {th} mm",
    f"Design parameters:",
    f"W0 = {W0} mm",
    f"L_coupled = {L_coupled} mm",
    f"W_coupled = {W_coupled} mm",
    f"S_coupled = {S_coupled} mm",
    f"L_feed = {L_feed} mm",
    f"L_trans = {L_trans} mm",
    f"Air box height = {Hair} mm",
    f"Run time = {run_time} min"]
    
    timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
    file_name = project_name + "_EMerge_" + timestamp
    m.physics.freq_data.export_touchstone(file_name, None, 'MA', comments)
    
    
