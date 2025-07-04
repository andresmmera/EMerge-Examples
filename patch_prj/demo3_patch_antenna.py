import emerge as em
import numpy as np
from emerge.pyvista import PVDisplay
from emerge.plot import plot_sp, smith, plot_ff_polar, plot_ff
import time
from datetime import datetime

mm = 0.001
margin = 5*mm
Nmodes = 1
f1 = 0.5e9
f2 = 3e9

Wpatch = 53*mm
Lpatch = 52*mm
wline = 3.2*mm
wstub = 7*mm
lstub = 15.5*mm
wsub = 100*mm
hsub = 100*mm
th = 1.524*mm

Hair = 40*mm

er = 3.38

f1 = 1.54e9
f2 = 1.6e9

project_name = "patch"

model = em.Simulation3D('MySimulation', PVDisplay, loglevel='DEBUG')

dielectric = em.geo.Box(wsub, hsub, th, position=(-wsub/2, -hsub/2, -th))

air = em.geo.Box(wsub, hsub, Hair, position=(-wsub/2, -hsub/2, 0))

rpatch = em.geo.XYPlate(Wpatch, Lpatch, position=(-Wpatch/2, -Lpatch/2, 0))

cutout1 = em.geo.XYPlate(wstub, lstub, position=(-wline/2-wstub, -Lpatch/2, 0))
cutout2 = em.geo.XYPlate(wstub, lstub, position=(wline/2, -Lpatch/2, 0))

line = em.geo.XYPlate(wline, lstub, position=(-wline/2, -Lpatch/2, 0))

port = em.geo.Plate(np.array([-wline/2, -Lpatch/2, -th]), np.array([wline, 0, 0]), np.array([0, 0, th]))

rpatch = em.geo.remove(rpatch, cutout1)
rpatch = em.geo.remove(rpatch, cutout2)
rpatch = em.geo.add(rpatch, line)

rpatch.material = em.lib.COPPER # Only for viewing

dielectric.material = em.Material(er, tand=0.0, color="#207020", opacity=0.6)
model.physics.resolution = 0.2

model.physics.set_frequency_range(1.5e9, 1.7e9, 11)

model.define_geometry([dielectric, air, rpatch, port])

model.mesher.set_boundary_size(rpatch, 5*mm, 1.1)
model.mesher.set_boundary_size(port, 0.5*mm, 1.1)

model.generate_mesh()

model.view(selections=[port,])

port = em.bc.LumpedPort(port, 1, width=wline, height=th, direction=em.ZAX, active=True, Z0=50)

boundary_selection = air.outside('bottom')

abc = em.bc.AbsorbingBoundary(boundary_selection)

pec = em.bc.PEC(rpatch)

model.physics.assign(port, pec, abc)


start_time = time.time()
data = model.physics.frequency_domain()
stop_time = time.time()
run_time = (stop_time - start_time)/60 # in minutes

xs, ys, zs = em.YAX.pair(em.ZAX).span(wsub, Hair, 31, (0, -wsub/2, -th))

freqs, S11 = data.ax('freq').S(1,1)

plot_sp(freqs/1e9, S11)
smith(freqs, S11)


theta, E, H = data.find(freq=1.6324e9).farfield_2d((0,0,1),(1,0,0), boundary_selection)
plot_ff(theta, em.norm(E))
plot_ff_polar(theta, em.norm(E))



# Save Touchstone data
comments = [
f"er: {er}",
f"h = {th} mm",
f"Design parameters:",
f"Wpatch = {Wpatch} mm",
f"Lpatch = {Lpatch} mm",
f"wline = {wline} mm",
f"wstub = {wstub} mm",
f"Air box height = {Hair} mm",
f"Run time = {run_time} min"]

timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
file_name = project_name + "_EMerge_" + timestamp
model.physics.freq_data.export_touchstone(file_name, None, 'MA', comments)
