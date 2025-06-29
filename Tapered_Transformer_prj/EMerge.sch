<Qucs Schematic 25.1.2>
<Properties>
  <View=422,127,787,332,4.32143,0,0>
  <Grid=10,10,1>
  <DataSet=EMerge.dat>
  <DataDisplay=EMerge.dpl>
  <OpenDisplay=0>
  <Script=EMerge.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
  <.ID 110 54 SUB>
  <.PortSym -110 0 1 0 P1>
  <.PortSym 370 0 2 180 P2>
  <Rectangle 0 -10 80 20 #000000 1 1 #ffaa00 1 1>
  <Rectangle 80 -20 80 40 #000000 1 1 #ffaa00 1 1>
  <Rectangle 160 -40 90 70 #000000 1 1 #ffaa00 1 1>
  <Line -110 0 30 0 #000000 1 1>
  <Line 340 0 30 0 #000000 1 1>
  <Text 70 -70 11 #000000 0 "EMerge (S-par file)">
  <Text 10 -10 15 #000000 0 "41.3 Ω">
  <Text 90 -10 15 #000000 0 "27.4 Ω">
  <Text 180 -10 15 #000000 0 "18.2 Ω">
  <Rectangle 250 -60 90 100 #000000 1 1 #ffaa00 1 1>
  <Text 270 -20 15 #000000 0 "15 Ω">
  <Rectangle -80 -10 80 20 #000000 1 1 #ffaa00 1 1>
  <Text -60 -10 15 #000000 0 "50 Ω">
</Symbol>
<Components>
  <GND * 1 570 260 0 0 0 0>
  <Port P1 1 490 230 -23 12 0 0 "1" 1 "analog" 0>
  <Port P2 1 650 230 4 -46 0 2 "2" 1 "analog" 0>
  <SPfile X1 1 570 230 -26 -55 0 0 "Chebyshev_Transformer_EMerge.s2p" 1 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
</Components>
<Wires>
  <490 230 540 230 "" 0 0 0 "">
  <600 230 650 230 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
