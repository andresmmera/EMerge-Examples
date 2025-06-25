import emerge as em
from emerge.pyvista import PVDisplay
import numpy as np
import time
from datetime import datetime

mm = 0.001

# PCB dimensions. RO4003C 20 mils
W = 5
D = 5
er = 3.55 # 
th = 0.508 # mm. 20 mils

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

project_name = 'Coupler_15dB'

def write_touchstone(filename, freq, S, comments=None):
    """
    Write S-parameters to a Touchstone v1.0 .sNp file with optional header comments.

    Parameters:
        filename: Output filename (should end with .sNp, where N = number of ports)
        freq: 1D array of frequencies (Hz)
        S: 3D numpy array of S-parameters, shape (num_freqs, N, N), complex values
        comments: List of strings, each will be written as a comment line starting with '!'
    """
    num_freqs, N, N2 = S.shape
    assert N == N2, "S must be a square matrix for each frequency"
    assert len(freq) == num_freqs, "Frequency array length must match S-parameter data"

    with open(filename, 'w') as f:
        # Write comments if provided
        if comments:
            for line in comments:
                f.write(f"! {line}\n")
        # Write Touchstone header
        f.write("# Hz S RI R 50\n")
        for i in range(num_freqs):
            # Frequency
            f.write(f"{freq[i]:.6e} ")
            # Write S-parameters in order: S11 S21 ... SN1 S12 S22 ... SN2 ... S1N S2N ... SNN
            # Touchstone order: for each column (port2), write all rows (port1)
            for col in range(N):
                for row in range(N):
                    s = S[i, row, col]
                    f.write(f"{s.real:.6e} {s.imag:.6e} ")
                f.write("\n")
            f.write("\n")

with em.Simulation3D('Microstrip_15dB_Coupler', PVDisplay, loglevel='DEBUG') as m:
    mat = em.Material(3.55, color=(0.1,1.0,0.2), opacity=0.1)
    pcb = em.geo.PCBLayouter(th, unit=mm)

    # Port 1 (Input) to Port 2 (Through) - main line
    pcb.new(0, 0, W0, (1,0)).straight(L_feed).straight(L_trans, W_coupled).turn(90)\
        .straight(L_coupled, W_coupled).turn(90).straight(L_trans, W_coupled)\
        .straight(L_feed, W0)

    # Port 3 (Coupled) to Port 4 (Isolated) - coupled line
    pcb.new(2*L_feed+2*L_trans+2*W_coupled+S_coupled, 0, W0, (-1,0)).straight(L_feed).straight(L_trans, W_coupled).turn(-90)\
        .straight(L_coupled, W_coupled).turn(-90).straight(L_trans, W_coupled)\
        .straight(L_feed, W0)

    stripline = pcb.compile_paths(merge=True)
    
    # Set PCB bounds with some margin
    pcb.determine_bounds(topmargin=5, bottommargin=5, leftmargin=0, rightmargin=0)

    diel = pcb.gen_pcb()
    air = pcb.gen_air(Hair)

    diel.material = mat

    # Define ports
    p1 = pcb.modal_port(pcb.paths[0].start, width_multiplier=3, height=2*th)  # Input
    p2 = pcb.modal_port(pcb.paths[0].end, width_multiplier=3, height=2*th)    # Through
    p3 = pcb.modal_port(pcb.paths[1].start, width_multiplier=3, height=2*th)  # Coupled
    p4 = pcb.modal_port(pcb.paths[1].end, width_multiplier=3, height=2*th)    # Isolated

    m.physics.resolution = 0.75  # Mesh resolution

    # Set frequency range around 2.5 GHz center frequency
    m.physics.set_frequency_range(0.1e9, 5.0e9, 20)

    m.define_geometry(stripline, diel, p1, p2, p3, p4, air)

    m.mesher.set_boundary_size(stripline, 0.75*mm)

    m.generate_mesh()

    m.view(use_gmsh=True)
    
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
    d.add_portmode(port1, port1.modes[0].k0, 21)
    d.add_portmode(port2, port2.modes[0].k0, 21)
    d.add_portmode(port3, port3.modes[0].k0, 21)
    d.add_portmode(port4, port4.modes[0].k0, 21)
    d.show()

    # Run simulation
    start_time = time.time()
    data = m.physics.frequency_domain(parallel=True, njobs=2, frequency_groups=4 )
    stop_time = time.time()
    run_time = (start_time - start_time)/60 # in minutes
    
    # Extract S-parameters
    f, S11 = data.ax('freq').S(1,1)  # Input reflection
    f, S21 = data.ax('freq').S(2,1)  # Through transmission
    f, S31 = data.ax('freq').S(3,1)  # Coupled transmission
    f, S41 = data.ax('freq').S(4,1)  # Isolated port

    from emerge.plot import plot_sp
    import numpy as np

    # Plot S-parameters
    plot_sp(f/1e9, [S11, S21, S31, S41], 
            labels=['S11 (Input Reflection)', 'S21 (Through)', 'S31 (Coupled)', 'S41 (Isolated)'])
    
    # Calculate coupling in dB
    coupling_dB = 20 * np.log10(np.abs(S31))
    print(f"Coupling at center frequency: {coupling_dB[len(coupling_dB)//2]:.1f} dB")
    
    # Calculate isolation in dB
    isolation_dB = 20 * np.log10(np.abs(S41))
    print(f"Isolation at center frequency: {isolation_dB[len(isolation_dB)//2]:.1f} dB")
    
    N = 4  # Number of ports
    spar_file = project_name + '_EMerge' + '.s' + str(N) + 'p'
    
    comments = [
    f"Generated on: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}",
    f"Simulation execution time: {run_time:.2f} minutes",
    "Project: {project_name}",
    "Simulation software: EMerge"]

    
    f, _ = data.ax('freq').S(1, 1)  # Get frequency array
    num_freqs = len(f)
    S = np.zeros((num_freqs, N, N), dtype=complex)

    for i in range(N):
    	for j in range(N):
        	_, Sij = data.ax('freq').S(i+1, j+1)  # Port indices may be 1-based
        	S[:, i, j] = Sij
    
    print ("Writing ", spar_file)
    write_touchstone(spar_file, f, S, comments)
    print(f"Total simulation time: {stop_time - start_time:.2f} seconds") 
