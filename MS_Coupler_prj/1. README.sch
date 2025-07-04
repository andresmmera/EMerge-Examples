<Qucs Schematic 25.1.2>
<Properties>
  <View=-350,-55,1362,1196,1.11156,187,468>
  <Grid=10,10,1>
  <DataSet=1. README.dat>
  <DataDisplay=1. README.dpl>
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
  <Sub SUB5 5 160 320 230 -16 0 0 "MS_models.sch" 0>
  <Sub SUB6 5 130 420 260 -16 0 0 "Sonnet_Simulation.sch" 0>
  <Sub SUB7 5 130 520 240 -16 0 0 "EMerge_Simulation.sch" 0>
  <Sub SUB8 5 590 400 180 -16 0 0 "Results.sch" 0>
</Components>
<Wires>
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
  <Text 70 80 20 #000000 0 "Microstrip Coupler Design">
  <Text 50 150 14 #000000 0 "The aim of this project is to design a microstrip coupler and compare the MS models with the results">
  <Text 50 180 14 #000000 0 "of different EM solvers">
  <Text 180 250 11 #000000 0 "(Push into the components)">
  <Text 120 630 15 #000000 0 "EMerge installation">
  <Text 170 680 11 #000000 0 "1) Get the source code">
  <Text 170 740 11 #000000 0 "2) Create a virtual environment">
  <Text 170 800 11 #000000 0 "3) Install from source">
  <Text 170 850 11 #000000 0 "4) Go to this project folder and run the simulation script">
  <Text 170 910 11 #000000 0 "5) Post-process (create Touchstone)">
  <Text 230 710 11 #000000 0 "git clone https://github.com/FennisRobert/EMerge">
  <Text 140 1030 15 #000000 0 "Sonnet Lite">
  <Text 150 1080 11 #000000 0 "Sonnet Lite is free of charge and it can run on Linux using Wine.">
  <Text 150 1110 11 #000000 0 "Along with this project Qucs-S project you'll find a Sonnet project file attached.">
  <Text 150 1140 11 #000000 0 "It automatically creates a s2p file. You can tweak the simulation variables and compare the results with the other simulators">
  <Text 170 970 11 #000000 0 "It creates a s2p file automatically. You can tweak the simulation variables and compare the results with the other simulators">
  <Text 150 1170 11 #000000 0 "Download Sonnet Lite:">
  <Text 240 880 11 #000000 0 "(emerge-venv) python Coupler_sim.py">
  <Text 240 940 11 #000000 0 "(emerge-venv) python Coupler_post.py">
  <Text 240 820 11 #000000 0 "pip install .">
  <Text 240 770 11 #000000 0 "python -m venv emerge-venv\n">
  <Text 290 1200 11 #000000 0 "https://www.sonnetsoftware.com/products/lite/">
  <Line 420 260 20 20 #000000 1 1>
  <Line 440 280 0 260 #000000 1 1>
  <Line 440 540 -20 20 #000000 1 1>
  <Arrow 460 410 60 0 20 8 #000000 1 1 0>
</Paintings>
