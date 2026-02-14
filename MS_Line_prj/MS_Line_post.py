import numpy as np
from emerge.plot import smith, plot_sp
from datetime import datetime

# Constants
mm = 0.001

project_name = "MS_Line"

# --- Renormalization helper ----------------------------------------------
def renormalize_snp(f, S, z_old, z_new):
    """
    Renormalize N-port S-parameters from old reference impedances to new ones.

    Parameters
    ----------
    f     : array_like, shape (Nf,)       Frequency vector (Hz)
    S     : array_like, shape (Nf, N, N)  Original S-parameters (complex)
    z_old : array_like, shape (N,)        Old reference impedances per port
    z_new : array_like, shape (N,)        New reference impedances per port

    Returns
    -------
    S_new : ndarray, shape (Nf, N, N)     Renormalized S-parameters
    """
    z_old = np.array(z_old, dtype=complex)
    z_new = np.array(z_new, dtype=complex)
    Nf, N, N2 = S.shape
    assert N == N2, "S-parameter matrix must be square."
    assert len(z_old) == N and len(z_new) == N, "Impedance arrays must match number of ports."

    gamma      = (z_new - z_old) / (z_new + z_old)
    gamma_star = np.conj(gamma)
    Gamma      = np.diag(gamma)
    I          = np.eye(N, dtype=complex)

    S_new = np.zeros_like(S, dtype=complex)
    for i in range(Nf):
        S_i            = S[i, :, :]
        S_new[i, :, :] = (S_i - np.diag(gamma_star)) @ np.linalg.inv(I - Gamma @ S_i)
    return S_new


# --- Load S-parameters saved by MS_Line_sim.py --------------------------
# MS_Line_sim.py saves a .npz file; load it here for post-processing.
# The current EMerge API has no load_file / load_sweep mechanism —
# the recommended pattern is to save raw data from the sim script and
# reload it here with numpy.
npz_file = project_name + "_data.npz"
print(f"Loading {npz_file} ...")
d = np.load(npz_file)

f   = d['f']
S11 = d['S11']
S21 = d['S21']
S12 = d['S12']
S22 = d['S22']

# --- Renormalize port 2 from 15 Ohm to 50 Ohm ---------------------------
Nf             = len(f)
S_mat          = np.zeros((Nf, 2, 2), dtype=complex)
S_mat[:, 0, 0] = S11
S_mat[:, 0, 1] = S12
S_mat[:, 1, 0] = S21
S_mat[:, 1, 1] = S22

S_mat = renormalize_snp(f, S_mat, z_old=[50, 15], z_new=[50, 50])

S11 = S_mat[:, 0, 0]
S12 = S_mat[:, 0, 1]
S21 = S_mat[:, 1, 0]
S22 = S_mat[:, 1, 1]

# --- Plots ---------------------------------------------------------------
smith(S11, f=f, labels='S11')
plot_sp(f, [S11, S21, S12, S22], labels=['S11', 'S21', 'S12', 'S22'], dblim=[-40, 6])
