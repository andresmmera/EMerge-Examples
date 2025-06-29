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

L1, L2, L3 = 44.38, 43.33, 42.46 # The lengths of the sections in mm
W1, W2, W3 = 1.57, 2.70, 4.4 # The widths of the sections in mm

W_50 = 1.1 # mm
W_15 = 5.59 # mm
L_feed = 1 # mm

th = 0.508 # mm = 20 mils The PCB Thickness
er = 3.55 # The Dielectric constant
tand = 0.0029

Hair = 10*th

# We can define the material using the Material class. Just supply the dielectric properties and you are done!
pcbmat = em.Material(er=er, tand=tand)

with em.Simulation3D("Transformer", save_file=True) as m:
  
    
    # To accomodate PCB routing we make use of the PCBLayouter class. To use it we need to 
    # supply it with a thickness, the desired air-box height, the units at which we supply
    # the dimensions and the PCB material.

    layouter = em.geo.PCBLayouter(th, unit=mm, material=pcbmat)

    # We will route our PCB using the "method chaining" syntax. First we call the .new() method
    # to start a new trace. This will returna StripPath object on which we may call methods that
    # sequentially constructs our stripline trace. In this case, it is sipmly a sequence of straight
    # sections.

    layouter.new(0,0, W_50, (1,0)).name('p1').straight(L_feed).straight(L1, W1).straight(L2, W2).straight(L3, W3).straight(L_feed, W_15).name('p2')
    
    # Next we generate a wave port surface to use for our simulation. A wave port can be automatically
    # generated for a given stripoline section. To easily reference it we use the .ref() method to 
    # recall the sections we created earlier.
    p1 = layouter.modal_port(layouter.ref('p1'), height=Hair)
    p2 = layouter.modal_port(layouter.ref('p2'), height=Hair)
    
    # Finally we compile the stirpline into a polygon. The compile_paths function will return
    # GeoSurface objects that form the polygon. Additionally, we may turn on the Merge feature
    # which will then return a single GeoSurface type object that we can use later.
    polies = layouter.compile_paths(True)

    # We can manually define blocks for the dielectric or air or let the PCBLayouter do it for us.
    # First we must determine the bounds of our PCB. This function by default will make a PCB
    # just large enough to contain all the coordinates in it (in the XY plane). By adding extra
    # margins we can make sure to add sufficient space next to the trace. Just make sure that there
    # is no margin where the wave ports need to go.
    layouter.determine_bounds(leftmargin=0, topmargin=50, rightmargin=0, bottommargin=50)
    
    # We can now generate the PCB and air box. The material assignment is automatic!

    pcb = layouter.gen_pcb(True, merge=True)
    air = layouter.gen_air(Hair)

    # We now pass all the geometries we have created to the .define_geometry() method.
    m.define_geometry(pcb, polies, p1, p2, air)

    # We set our desired resolution (fraction of the wavelength)
    m.physics.set_resolution(0.1)
    
    # And we define our frequency range
    m.physics.set_frequency_range(0.1e9, 2e9, 40)

    # EMerge also has a convenient interface to improve surface meshing quality. 
    # With the set_boundary_size(method) we can define a meshing resolution for the edges of boundaries.
    # This is adviced for small stripline structures.
    # The growth_rate setting allows us to change how fast the mesh size will recover to the original size.
    m.mesher.set_boundary_size(polies, 1*mm, growth_rate=1.2)
    m.mesher.set_boundary_size(p1, 2*mm)
    m.mesher.set_boundary_size(p2, 2*mm)
    
    # Finally we generate our mesh and view it
    m.generate_mesh()

    m.view()

    # We can now define the modal ports for the in and outputs and set the conductor to PEC.
    port1 = em.bc.ModalPort(p1, 1, True)
    port2 = em.bc.ModalPort(p2, 2, False)
    pec = em.bc.PEC(polies)

    m.physics.assign(port1, port2, pec)

    # Next we execute our Modal analysis. Make sure to set the TEM property to True so that
    # EMerge knows to handle the port mode as a TEM boundary. This also includes the automatic
    # determination of a voltage integration line used for computing the port impedance.
    m.physics.modal_analysis(port1, 1, True, TEM=True)
    m.physics.modal_analysis(port2, 1, True, TEM=True)

    # Finally we import the display class to view the resultant modes
    from _emerge.plot.pyvista import PVDisplay

    d = PVDisplay(m.mesh)
    d.add_object(pcb)
    d.add_object(polies)
    d.add_portmode(port1, port1.modes[0].k0, 21)
    d.add_portmode(port2, port2.modes[0].k0, 21)
    d.show()

    # Finally we execute the frequency domain sweep and compute the Scattering Parameters.
    start_time = time.time()
    sol = m.physics.frequency_domain(parallel=True, njobs=3)
    stop_time = time.time()
    m.run_time = (start_time - start_time)/60 # in minutes
    
    f, S11 = sol.ax('freq').S(1,1)
    f, S21 = sol.ax('freq').S(2,1)
    f, S12 = sol.ax('freq').S(1,2)
    f, S22 = sol.ax('freq').S(2,2)
    
    
