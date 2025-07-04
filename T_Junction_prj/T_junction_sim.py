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
W0 = 1.13  # mm. Width for 50 ohm line
L0 = 45 # mm. Length of the 50 Ohm line

W_high = 0.272 # mm. Width of the high impedance lines
L_high = 47.3 # mm. Length of the high impedance lines

W_match = 0.61 # mm
L_match = 46 # mm


Hair = 10 # mm. Air box height

project_name = "T_junction"

# We can define the material using the Material class. Just supply the dielectric properties and you are done!
pcbmat = em.Material(er=er, tand=tand)

with em.Simulation3D(project_name, save_file=True) as m:
    mat = em.Material(3.55, color="#217627", opacity=0.1)
    pcb = em.geo.PCBLayouter(th, unit=mm)

    # 50 Ohm line
    pcb.new(0, 0, W0, (1,0)).straight(L0) # [0]
    
    # Upper branch
    pcb.new(L0, W0/2, W_high, (0,1)).straight(L_high).straight(L_match, W_match) # [1]
    
    # Lower branch
    pcb.new(L0, W0/2, W_high, (0,-1)).straight(L_high).straight(L_match, W_match) # [2]
        
    

    stripline = pcb.compile_paths(merge=True)
    
    # Set PCB bounds with some margin
    pcb.determine_bounds(topmargin=0, bottommargin=0, leftmargin=0, rightmargin=20)

    diel = pcb.gen_pcb()
    air = pcb.gen_air(Hair)

    diel.material = mat

    # Define ports
    p1 = pcb.modal_port(pcb.paths[0].start, width_multiplier=3, height=2*th)  # Input
    p2 = pcb.modal_port(pcb.paths[1].end, width_multiplier=3, height=2*th)    # Output 1
    p3 = pcb.modal_port(pcb.paths[2].end, width_multiplier=3, height=2*th)  # Output 2


    m.physics.resolution = 1  # Mesh resolution

    # Set frequency range around 2.5 GHz center frequency
    m.physics.set_frequency_range(0.1e9, 5.0e9, 40)

    m.define_geometry(stripline, diel, p1, p2, p3, air)

    m.mesher.set_boundary_size(stripline, 0.75*mm)

    m.generate_mesh()

    #m.view(use_gmsh=True)
    m.view()
    
    # Define boundary conditions
    port1 = em.bc.ModalPort(p1, 1, True)   # Input
    port2 = em.bc.ModalPort(p2, 2, False)  # Output 1
    port3 = em.bc.ModalPort(p3, 3, False)  # Output 2
    pec = em.bc.PEC(stripline)

    m.physics.assign(port1, port2, port3, pec)
    
    # Modal analysis for each port
    m.physics.modal_analysis(port1, 1, direct=True, TEM=True, freq=2.5e9)
    m.physics.modal_analysis(port2, 1, direct=True, TEM=True, freq=2.5e9)
    m.physics.modal_analysis(port3, 1, direct=True, TEM=True, freq=2.5e9)


    # Visualization
    d = PVDisplay(m.mesh)
    d.add_object(diel, color='green', opacity=0.5)
    d.add_object(stripline, color='red')
    d.add_object(p1, color='blue', opacity=0.3)
    d.add_object(p2, color='blue', opacity=0.3)
    d.add_object(p3, color='cyan', opacity=0.3)
    d.add_portmode(port1, 21)
    d.add_portmode(port2, 21)
    d.add_portmode(port3, 21)
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
    f"W0 = {W0} mm # Width of the 50 ohm line",
    f"L0 = {L0} mm # Length of the 50 ohm line",
    f"W_high = {W_high} mm # Width of the high impedance line",
    f"L_high = {L_high} mm # Length of the high impedance line",
    f"W_match = {W_match} mm # Width of the lambda/4 matching line",
    f"L_match = {L_match} mm # Length of the lambda/4 matching line",
    f"Air box height = {Hair} mm",
    f"Run time = {run_time} min"]
    
    timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
    file_name = project_name + "_EMerge_" + timestamp
    m.physics.freq_data.export_touchstone(file_name, None, 'MA', comments)
    
    
