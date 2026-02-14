<Qucs Schematic 25.2.0>
<Properties>
  <View=-13,93,702,484,2.19231,0,0>
  <Grid=10,10,1>
  <DataSet=Coupler_EMerge.dat>
  <DataDisplay=Coupler_EMerge.dpl>
  <OpenDisplay=0>
  <Script=Coupler_EMerge.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
  <.ID -40 74 SUB>
  <.PortSym -100 -50 1 0 P1>
  <.PortSym 90 -50 2 180 P2>
  <.PortSym -100 60 3 0 P3>
  <.PortSym 90 60 4 180 P4>
  <Rectangle -80 -60 70 20 #000000 1 1 #ffaa00 1 1>
  <Rectangle -80 50 70 20 #000000 1 1 #ffaa00 1 1>
  <Rectangle -30 -60 20 130 #000000 1 1 #ffaa00 1 1>
  <Rectangle 0 -60 70 20 #000000 1 1 #ffaa00 1 1>
  <Rectangle 0 50 70 20 #000000 1 1 #ffaa00 1 1>
  <Rectangle 0 -60 20 130 #000000 1 1 #ffaa00 1 1>
  <Line -100 -50 20 0 #000000 1 1>
  <Line -100 60 20 0 #000000 1 1>
  <Line 70 -50 20 0 #000000 1 1>
  <Line 70 60 20 0 #000000 1 1>
  <Text -30 -90 11 #000000 0 "EMerge">
</Symbol>
<Components>
  <GND * 1 430 280 0 0 1 2>
  <Port P1 1 190 180 -23 12 0 0 "1" 1 "analog" 0>
  <Port P2 1 480 180 4 -46 0 2 "2" 1 "analog" 0>
  <Port P3 1 250 390 -23 10 0 0 "3" 1 "analog" 0>
  <Port P4 1 520 390 4 -46 0 2 "4" 1 "analog" 0>
  <SPfile X1 1 370 280 -260 -26 1 3 "Coupler_15dB_EMerge.s4p" 1 "rectangular" 0 "linear" 0 "open" 0 "4" 0>
</Components>
<Wires>
  <400 310 400 390 "" 0 0 0 "">
  <400 180 400 250 "" 0 0 0 "">
  <340 180 340 250 "" 0 0 0 "">
  <340 310 340 390 "" 0 0 0 "">
  <190 180 340 180 "" 0 0 0 "">
  <400 390 520 390 "" 0 0 0 "">
  <400 180 480 180 "" 0 0 0 "">
  <250 390 340 390 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
