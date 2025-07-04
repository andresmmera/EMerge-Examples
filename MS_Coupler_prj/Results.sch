<Qucs Schematic 25.1.2>
<Properties>
  <View=-441,-407,1939,932,0.660941,0,0>
  <Grid=10,10,1>
  <DataSet=Results.dat>
  <DataDisplay=Results.dpl>
  <OpenDisplay=0>
  <Script=3.Comparison.m>
  <RunScript=0>
  <showFrame=3>
  <FrameText0=Comparison between MS models and EM results>
  <FrameText1=Drawn By: Andrés Martínez Mera>
  <FrameText2=Date: Jun 26, 2025>
  <FrameText3=Revision:>
</Properties>
<Symbol>
  <.ID 180 -16 SUB>
  <.PortSym 0 0 1 0 P1>
  <Text 30 -10 15 #000000 0 "Results">
  <Rectangle -30 -40 190 80 #000000 1 1 #c0c0c0 1 0>
</Symbol>
<Components>
  <Port P1 1 1470 40 -23 12 0 0 "1" 1 "analog" 0>
</Components>
<Wires>
</Wires>
<Diagrams>
  <Rect 140 421 414 331 3 #c0c0c0 1 00 1 0 1e+09 5e+09 0 -3 0.5 1 1 -1 0.5 1 315 0 225 1 0 0 "" "" "">
	<"1.MS_models:through" #0000ff 2 3 0 0 0>
	<"2.EMerge_Simulation:through" #ff0000 2 3 0 0 0>
	<"3.Sonnet_Simulation:through" #005500 2 3 0 0 0>
  </Rect>
  <Rect 740 431 414 331 3 #c0c0c0 1 00 1 0 1e+09 5e+09 0 -40 5 0 1 -1 0.5 1 315 0 225 1 0 0 "" "" "">
	<"1.MS_models:coupled" #0000ff 2 3 0 0 0>
	  <Mkr 2.04523e+09 279 -367 3 0 0>
	<"2.EMerge_Simulation:coupled" #ff0000 2 3 0 0 0>
	  <Mkr 2.09447e+09 273 -318 3 0 0>
	<"3.Sonnet_Simulation:coupled" #005500 2 3 0 0 0>
	  <Mkr 1.7005e+09 271 -270 3 0 0>
  </Rect>
  <Rect 130 881 414 331 3 #c0c0c0 1 00 1 0 1e+09 5e+09 0 -50 5 0 1 -1 0.5 1 315 0 225 1 0 0 "" "" "">
	<"1.MS_models:isolated" #0000ff 2 3 0 0 0>
	<"2.EMerge_Simulation:isolated" #ff0000 2 3 0 0 0>
	<"3.Sonnet_Simulation:isolated" #005500 2 3 0 0 0>
  </Rect>
  <Rect 750 891 414 331 3 #c0c0c0 1 00 1 0 1e+09 5e+09 0 -40 5 0 1 -1 0.5 1 315 0 225 1 0 0 "" "" "">
	<"1.MS_models:RL" #0000ff 2 3 0 0 0>
	<"2.EMerge_Simulation:RL" #ff0000 2 3 0 0 0>
	<"3.Sonnet_Simulation:RL" #005500 2 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
  <Text 270 50 20 #000000 0 "Through">
  <Text 870 60 20 #000000 0 "Coupling">
  <Text 270 510 20 #000000 0 "Isolation">
  <Text 930 520 20 #000000 0 "RL">
  <Text 1310 120 20 #ff0000 0 "EMerge">
  <Text 1310 160 20 #0000ff 0 "MS models">
  <Text 1310 210 20 #005500 0 "Sonnet Lite">
</Paintings>
