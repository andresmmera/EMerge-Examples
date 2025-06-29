<Qucs Schematic 25.1.2>
<Properties>
  <View=152,141,573,377,3.74524,0,0>
  <Grid=10,10,1>
  <DataSet=ADS.dat>
  <DataDisplay=ADS.dpl>
  <OpenDisplay=0>
  <Script=ADS.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
  <.ID -20 44 SUB>
  <.PortSym -150 0 1 0 P1>
  <.PortSym 160 0 2 180 P2>
  <Text -50 -60 11 #000000 0 "ADS (S-par file)">
  <Rectangle -120 -10 80 20 #000000 1 1 #ffaa00 1 1>
  <Rectangle -40 -20 80 40 #000000 1 1 #ffaa00 1 1>
  <Rectangle 40 -40 90 70 #000000 1 1 #ffaa00 1 1>
  <Line -150 0 30 0 #000000 1 1>
  <Line 130 0 30 0 #000000 1 1>
  <Text -110 -10 15 #000000 0 "41.3 Ω">
  <Text -30 -10 15 #000000 0 "27.4 Ω">
  <Text 60 -10 15 #000000 0 "18.2 Ω">
  <Text -170 -50 15 #000000 0 "50 Ω">
  <Text 140 -50 15 #000000 0 "15 Ω">
</Symbol>
<Components>
  <GND * 1 300 290 0 0 0 0>
  <Port P1 1 220 260 -23 12 0 0 "1" 1 "analog" 0>
  <Port P2 1 380 260 4 -46 0 2 "2" 1 "analog" 0>
  <SPfile X1 1 300 260 -26 -55 0 0 "Chebyshev_Transformer_ADS.s2p" 1 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
</Components>
<Wires>
  <220 260 270 260 "" 0 0 0 "">
  <330 260 380 260 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
