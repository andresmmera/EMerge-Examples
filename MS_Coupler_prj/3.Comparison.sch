<Qucs Schematic 25.1.2>
<Properties>
  <View=-3995,-957,4751,4013,0.683013,2647,579>
  <Grid=10,10,1>
  <DataSet=3.Comparison.dat>
  <DataDisplay=3.Comparison.dpl>
  <OpenDisplay=0>
  <Script=3.Comparison.m>
  <RunScript=0>
  <showFrame=3>
  <FrameText0=15 dB MS coupler: EMerge vs MS models>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
</Symbol>
<Components>
</Components>
<Wires>
</Wires>
<Diagrams>
  <Rect 140 421 414 331 3 #c0c0c0 1 00 1 0 1e+09 5e+09 0 -3 0.5 1 1 -1 0.5 1 315 0 225 1 0 0 "" "" "">
	<"1.MS_models:through" #0000ff 1 3 0 0 0>
	<"2.EMerge_Simulation:through" #ff0000 1 3 0 0 0>
  </Rect>
  <Rect 740 431 414 331 3 #c0c0c0 1 00 1 0 1e+09 5e+09 0 -40 5 0 1 -1 0.5 1 315 0 225 1 0 0 "" "" "">
	<"1.MS_models:coupled" #0000ff 1 3 0 0 0>
	  <Mkr 2.04523e+09 39 -317 3 0 0>
	<"2.EMerge_Simulation:coupled" #ff0000 1 3 0 0 0>
	  <Mkr 2.09447e+09 233 -318 3 0 0>
  </Rect>
  <Rect 130 881 414 331 3 #c0c0c0 1 00 1 0 1e+09 5e+09 0 -50 5 0 1 -1 0.5 1 315 0 225 1 0 0 "" "" "">
	<"1.MS_models:isolated" #0000ff 1 3 0 0 0>
	<"2.EMerge_Simulation:isolated" #ff0000 1 3 0 0 0>
  </Rect>
  <Rect 750 891 414 331 3 #c0c0c0 1 00 1 0 1e+09 5e+09 0 -40 5 0 1 -1 0.5 1 315 0 225 1 0 0 "" "" "">
	<"1.MS_models:RL" #0000ff 1 3 0 0 0>
	<"2.EMerge_Simulation:RL" #ff0000 1 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
  <Text 270 50 20 #000000 0 "Through">
  <Text 870 60 20 #000000 0 "Coupling">
  <Text 270 510 20 #000000 0 "Isolation">
  <Text 930 520 20 #000000 0 "RL">
  <Text 1310 120 20 #ff0000 0 "EMerge">
  <Text 1310 160 20 #0000ff 0 "MS models">
</Paintings>
