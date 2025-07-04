<Qucs Schematic 25.1.2>
<Properties>
  <View=0,0,1573,885,1,0,0>
  <Grid=10,10,1>
  <DataSet=T_Junction_Sonnet.dat>
  <DataDisplay=T_Junction_Sonnet.dpl>
  <OpenDisplay=0>
  <Script=T_Junction_Sonnet.m>
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
  <Pac P1 1 100 360 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0 "true" 0>
  <GND * 1 100 390 0 0 0 0>
  <Pac P2 1 670 210 18 -26 0 1 "2" 1 "100 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0 "true" 0>
  <GND * 1 670 240 0 0 0 0>
  <Pac P3 1 670 490 18 -26 0 1 "3" 1 "100 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0 "true" 0>
  <GND * 1 670 520 0 0 0 0>
  <Eqn Eqn1 1 190 650 -28 15 0 0 "S11_dB=dB(S[1,1])" 1 "S21_dB=dB(S[2,1])" 1 "S31_dB=dB(S[3,1])" 1 "S22_dB=dB(S[2,2])" 1 "S33_dB=dB(S[3,3])" 1 "yes" 0>
  <SPfile X1 1 350 330 -26 -85 0 0 "T_Junction.s3p" 1 "rectangular" 0 "linear" 0 "open" 0 "3" 0>
  <GND * 1 350 390 0 0 0 0>
  <.SP SP1 1 340 650 0 60 0 0 "lin" 1 "0.5GHz" 1 "2.5GHz" 1 "300" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
</Components>
<Wires>
  <100 300 320 300 "" 0 0 0 "">
  <100 300 100 330 "" 0 0 0 "">
  <380 300 480 300 "" 0 0 0 "">
  <480 180 480 300 "" 0 0 0 "">
  <480 180 670 180 "" 0 0 0 "">
  <260 360 320 360 "" 0 0 0 "">
  <260 360 260 460 "" 0 0 0 "">
  <260 460 670 460 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Rect 840 434 351 254 3 #c0c0c0 1 00 1 5e+08 5e+08 2.5e+09 0 -5 0.5 -2 1 -1 0.5 1 315 0 225 1 0 0 "" "" "">
	<"S21_dB" #0000ff 1 3 0 0 0>
	<"S31_dB" #ff0000 1 3 0 0 0>
	<"T_Junction:S21_dB" #ff00ff 1 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
</Paintings>
