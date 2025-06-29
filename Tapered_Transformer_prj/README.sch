<Qucs Schematic 25.1.2>
<Properties>
  <View=-1770,-2712,10392,3569,0.870147,1305,2680>
  <Grid=10,10,1>
  <DataSet=README.dat>
  <DataDisplay=README.dpl>
  <OpenDisplay=0>
  <Script=README.m>
  <RunScript=0>
  <showFrame=4>
  <FrameText0=50-to-15 Ohm MS transformer>
  <FrameText1=Drawn By: Andrés Martínez Mera>
  <FrameText2=Date: June 29, 2025>
  <FrameText3=Revision:>
</Properties>
<Symbol>
</Symbol>
<Components>
  <Sub SUB1 5 210 370 540 -16 0 0 "Chebyshev transformer.sch" 0>
</Components>
<Wires>
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
  <Text 180 50 25 #000000 0 "50-to-15 Ω Chebyshev Tapered Transformer">
  <Text 80 140 11 #000000 0 "In this project a Chebyshev tapered transformer is designed and simulated using different EM solvers:">
  <Text 150 190 11 #000000 0 "1) qucsator-RF MS models">
  <Text 150 220 11 #000000 0 "2) ADS Momentum">
  <Text 150 250 11 #000000 0 "3) Sonnet Lite">
  <Text 150 280 11 #000000 0 "4) EMerge (https://github.com/FennisRobert/EMerge)">
  <Text 60 500 15 #000000 0 "EMerge installation">
  <Text 110 550 11 #000000 0 "1) Get the source code">
  <Text 110 610 11 #000000 0 "2) Create a virtual environment">
  <Text 110 670 11 #000000 0 "3) Install from source">
  <Text 110 720 11 #000000 0 "4) Go to this project folder and run the simulation script">
  <Text 110 780 11 #000000 0 "5) Post-process (create Touchstone)">
  <Text 170 580 11 #000000 0 "git clone https://github.com/FennisRobert/EMerge">
  <Text 730 360 11 #000000 0 "(Push into the subcircuit)">
  <Text 80 900 15 #000000 0 "Sonnet Lite">
  <Text 90 950 11 #000000 0 "Sonnet Lite is free of charge and it can run on Linux using Wine.">
  <Text 90 980 11 #000000 0 "Along with this project Qucs-S project you'll find a Sonnet project file attached.">
  <Text 90 1010 11 #000000 0 "It automatically creates a s2p file. You can tweak the simulation variables and compare the results with the other simulators">
  <Text 110 840 11 #000000 0 "It creates a s2p file automatically. You can tweak the simulation variables and compare the results with the other simulators">
  <Text 90 1040 11 #000000 0 "Download Sonnet Lite:">
  <Text 180 750 11 #000000 0 "(emerge-venv) python Transformer_Sim.py">
  <Text 180 810 11 #000000 0 "(emerge-venv) python Transformer_post.py">
  <Text 180 690 11 #000000 0 "pip install .">
  <Text 180 640 11 #000000 0 "python -m venv emerge-venv\n">
  <Text 230 1070 11 #000000 0 "https://www.sonnetsoftware.com/products/lite/">
</Paintings>
