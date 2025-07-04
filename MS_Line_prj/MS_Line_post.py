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

project_name = "Chebyshev_Transformer"


def write_touchstone(filename, freq, S11, S21, S12, S22, comments=None):
    """
    Write S-parameters to a Touchstone v1.0 .s2p file with optional header comments.
    freq: Frequency array (Hz)
    Sxx: S-parameter arrays, complex values
    comments: List of strings, each will be written as a comment line starting with '!'
    """
    with open(filename, 'w') as f:
        # Write comments if provided
        if comments:
            for line in comments:
                f.write(f"! {line}\n")
        # Write Touchstone header
        f.write("# Hz S RI R 50\n")
        for i in range(len(freq)):
            f.write(f"{freq[i]:.6e} "
                    f"{S11[i].real:.6e} {S11[i].imag:.6e} "
                    f"{S21[i].real:.6e} {S21[i].imag:.6e} "
                    f"{S12[i].real:.6e} {S12[i].imag:.6e} "
                    f"{S22[i].real:.6e} {S22[i].imag:.6e}\n")
                    
import numpy as np

def renormalize_snp(f, S, z_old, z_new):
    """
    Renormalize N-port S-parameters from old reference impedances to new ones.
    
    Parameters:
        f     : array_like, shape (Nf,)
            Frequency vector (Hz)
        S     : array_like, shape (Nf, N, N)
            Original S-parameters (complex arrays)
        z_old : array_like, shape (N,)
            Old reference impedances for each port
        z_new : array_like, shape (N,)
            New reference impedances for each port
    
    Returns:
        S_new : array, shape (Nf, N, N)
            Renormalized S-parameters at new reference impedances
    """
    z_old = np.array(z_old, dtype=complex)
    z_new = np.array(z_new, dtype=complex)
    Nf, N, N2 = S.shape
    assert N == N2, "S-parameter matrix must be square for each frequency point."
    assert len(z_old) == N and len(z_new) == N, "Impedance arrays must match number of ports."

    # Reflection coefficients for each port
    gamma = (z_new - z_old) / (z_new + z_old)
    gamma_star = np.conj(gamma)

    # Precompute diagonal matrices
    Gamma = np.diag(gamma)
    Gamma_star = np.diag(gamma_star)
    I = np.eye(N, dtype=complex)

    # Prepare output array
    S_new = np.zeros_like(S, dtype=complex)

    for i in range(Nf):
        S_i = S[i, :, :]
        denom = I - Gamma @ S_i
        num = S_i - Gamma_star
        S_new[i, :, :] = num @ np.linalg.inv(denom)

    return S_new
                  
                    

with em.Simulation3D("Transformer", PVDisplay, load_file=True) as m:
    
    fdata = m.physics.freq_data
    
    from emerge.plot import smith, plot_sp

    f, S11 = fdata.ax('freq').S(1,1)
    f, S21 = fdata.ax('freq').S(2,1)
    f, S12 = fdata.ax('freq').S(1,2)
    f, S22 = fdata.ax('freq').S(2,2)
    
    # Renormalize to 50 Ohm
    Nf = len(f)
    S = np.zeros((Nf, 2, 2), dtype=complex)
    z_old = [50, 15]
    z_new = [50, 50]
    
    S[:, 0, 0] = S11  # S11: port 1 to port 1
    S[:, 0, 1] = S12  # S12: port 2 to port 1
    S[:, 1, 0] = S21  # S21: port 1 to port 2
    S[:, 1, 1] = S22  # S22: port 2 to port 2
    
    S = renormalize_snp(f, S, z_old, z_new)
    S11 = S[:, 0, 0]
    S12 = S[:, 0, 1]
    S21 = S[:, 1, 0]
    S22 = S[:, 1, 1]
    
    spar_file = project_name + '_EMerge' + '.s2p'
    
    comments = [
    f"Generated on: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}",
   # f"Simulation execution time: {m.run_time:.2f} minutes",
    "Project: {project_name}",
    "Simulation software: EMerge"]

    print ("Writing ", spar_file)
    #write_touchstone(spar_file, f, S11, S21, S12, S22, comments)
    fdata.export_touchstone(spar_file, 50, 'MA')
    #print(f"Total simulation time: {m.run_time:.2f} seconds") 
   
   
    smith(f,S11)

    plot_sp(f/1e9, [S11, S21, S12, S22], labels=['S11','S21','S12','S22'], dblim=[-40,6])
    
