<Qucs Schematic 25.2.0>
<Properties>
  <View=-614,40,1644,1271,0.694557,0,0>
  <Grid=10,10,1>
  <DataSet=1.README.dat>
  <DataDisplay=1.README.dpl>
  <OpenDisplay=0>
  <Script=README.m>
  <RunScript=0>
  <showFrame=4>
  <FrameText0=Design of a 15 dB MS coupler>
  <FrameText1=Drawn By: Andrés Martínez Mera>
  <FrameText2=Date: June 26, 2025>
  <FrameText3=Revision:>
</Properties>
<Symbol>
</Symbol>
<Components>
  <Sub SUB6 5 130 420 260 -16 0 0 "Sonnet_Simulation.sch" 0>
  <Sub SUB7 5 130 520 240 -16 0 0 "EMerge_Simulation.sch" 0>
  <Sub SUB8 5 590 400 180 -16 0 0 "Results.sch" 0>
  <Sub SUB5 5 160 320 230 -16 0 0 "MS_models.sch" 0>
</Components>
<Wires>
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
  <Text 60 80 20 #000000 0 "Microstrip Coupler Design">
  <Text 50 150 14 #000000 0 "The aim of this project is to design a microstrip coupler and compare the MS models with the results">
  <Text 50 180 14 #000000 0 "of different EM solvers">
  <Text 180 250 11 #000000 0 "(Push into the components)">
  <Text 60 640 15 #000000 0 "EMerge installation">
  <Text 110 690 11 #000000 0 "1) Get the source code">
  <Text 110 750 11 #000000 0 "2) Create a virtual environment">
  <Text 110 810 11 #000000 0 "3) Install from source">
  <Text 110 860 11 #000000 0 "4) Go to this project folder and run the simulation script">
  <Text 110 920 11 #000000 0 "5) Post-process (create Touchstone)">
  <Text 170 720 11 #000000 0 "git clone https://github.com/FennisRobert/EMerge">
  <Text 80 1040 15 #000000 0 "Sonnet Lite">
  <Text 90 1090 11 #000000 0 "Sonnet Lite is free of charge and it can run on Linux using Wine.">
  <Text 90 1120 11 #000000 0 "Along with this project Qucs-S project you'll find a Sonnet project file attached.">
  <Text 90 1150 11 #000000 0 "It automatically creates a s2p file. You can tweak the simulation variables and compare the results with the other simulators">
  <Text 110 980 11 #000000 0 "It creates a s2p file automatically. You can tweak the simulation variables and compare the results with the other simulators">
  <Text 90 1180 11 #000000 0 "Download Sonnet Lite:">
  <Text 180 890 11 #000000 0 "(emerge-venv) python Coupler_sim.py">
  <Text 180 950 11 #000000 0 "(emerge-venv) python Coupler_post.py">
  <Text 180 830 11 #000000 0 "pip install .">
  <Text 180 780 11 #000000 0 "python -m venv emerge-venv\n">
  <Text 230 1210 11 #000000 0 "https://www.sonnetsoftware.com/products/lite/">
  <Line 420 260 20 20 #000000 1 1>
  <Line 440 280 0 260 #000000 1 1>
  <Line 440 540 -20 20 #000000 1 1>
  <Arrow 460 410 60 0 20 8 #000000 1 1 0>
</Paintings>
