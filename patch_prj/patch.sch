<Qucs Schematic 25.1.2>
<Properties>
  <View=-102,-119,2254,1206,0.667722,0,0>
  <Grid=10,10,1>
  <DataSet=patch.dat>
  <DataDisplay=patch.dpl>
  <OpenDisplay=0>
  <Script=patch.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
</Symbol>
<Components>
  <Pac P1 1 290 330 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0 "true" 0>
  <GND * 1 290 360 0 0 0 0>
  <Eqn Eqn1 1 520 430 -31 16 0 0 "S11_dB=dB(S[1,1])" 1 "yes" 0>
  <.SP SP1 1 300 430 0 60 0 0 "lin" 1 "1500MHz" 1 "1700MHz" 1 "201" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Sub SUB1 5 430 250 30 94 0 0 "Patch_EMerge.sch" 0>
</Components>
<Wires>
  <290 250 290 300 "" 0 0 0 "">
  <290 250 400 250 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Smith 790 370 200 200 3 #c0c0c0 1 00 1 0 1 1 0 0 4 1 1 0 1 1 315 0 225 1 0 0 "" "" "">
	<"S[1,1]" #0000ff 1 3 0 0 0>
  </Smith>
  <Rect 810 600 240 160 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 1 0 0 "" "" "">
	<"S11_dB" #0000ff 1 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
</Paintings>
