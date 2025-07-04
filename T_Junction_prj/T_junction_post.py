import emerge as em
from emerge.pyvista import PVDisplay
import emerge.plot as plt
import numpy as np
import time
from datetime import datetime

# Constants
cm = 0.01
mm = 0.001
mil = 0.0254
um = 0.000001
PI = np.pi

project_name = "T_junction"
                                 
                   
with em.Simulation3D("T_junction", PVDisplay, load_file=True) as m:
    
    fdata = m.physics.freq_data
    
    from emerge.plot import smith, plot_sp

    # Extract S-parameters
    f, S11 = fdata.ax('freq').S(1,1)  # Input reflection
    f, S21 = fdata.ax('freq').S(2,1)  # Output 1 transmission
    f, S31 = fdata.ax('freq').S(3,1)  # Output 2 transmission

    
    # Interpolation
    S11 = fdata.model_S(1, 1, f, Npoles = 10)
    S21 = fdata.model_S(2, 1, f, Npoles = 10)
    S31 = fdata.model_S(3, 1, f, Npoles = 10)

    
    # Plot S-parameters
    plot_sp(f/1e9, [S11, S21, S31], 
            labels=['S11 (Input Reflection)', 'S21 (Output 1)', 'S31 (Output 2)'])
    
    
    N = 3  # Number of ports
    spar_file = project_name + '_EMerge' + '.s' + str(N) + 'p'
    
    comments = [
    f"Generated on: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}",
    f"Project: {project_name}",
    "Simulation software: EMerge"]
    
    print ("Writing ", spar_file)
    fdata.export_touchstone(spar_file, 50, 'MA')

    
