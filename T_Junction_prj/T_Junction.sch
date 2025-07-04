<Qucs Schematic 25.1.2>
<Properties>
  <View=-296,-133,1805,1114,0.710075,323,61>
  <Grid=10,10,1>
  <DataSet=T_Junction.dat>
  <DataDisplay=T_Junction.dpl>
  <OpenDisplay=0>
  <Script=T_Junction.m>
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
  <Pac P1 1 120 230 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0 "true" 0>
  <GND * 1 120 260 0 0 0 0>
  <GND * 1 790 110 0 0 0 0>
  <GND * 1 790 390 0 0 0 0>
  <Eqn Eqn1 1 210 520 -28 15 0 0 "S11_dB=dB(S[1,1])" 1 "S21_dB=dB(S[2,1])" 1 "S31_dB=dB(S[3,1])" 1 "S22_dB=dB(S[2,2])" 1 "S33_dB=dB(S[3,3])" 1 "yes" 0>
  <SUBST Sub1 1 560 520 -30 24 0 0 "3.55" 1 "0.508mm" 1 "12.5um" 1 "0.0125" 1 "2.43902e-08" 1 "1.5e-07" 1>
  <MLIN MS1 1 240 200 -26 20 0 0 "Sub1" 0 "1.13 mm" 1 "45.0 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS2 1 510 50 -26 20 0 0 "Sub1" 0 "272 um" 1 "47.3 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS3 1 510 330 -26 20 0 0 "Sub1" 0 "272 um" 1 "47.3 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MTEE MS4 1 350 200 34 -45 0 3 "Sub1" 0 "272 um" 1 "272 um" 1 "1.13 m" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0 "showNumbers" 0>
  <.SP SP1 1 340 490 0 60 0 0 "lin" 1 "0.5GHz" 1 "2.5GHz" 1 "300" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <SUBST Sub2 1 1050 550 -30 24 0 0 "3.55" 1 "0.508mm" 1 "12.5um" 1 "0.0125" 1 "2.43902e-08" 1 "0" 1>
  <MLIN MS5 1 650 50 -26 20 0 0 "Sub1" 0 "0.61 mm" 1 "46 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS6 1 650 330 -26 20 0 0 "Sub1" 0 "0.61 mm" 1 "46 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <Pac P2 1 790 80 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0 "true" 0>
  <Pac P3 1 790 360 18 -26 0 1 "3" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0 "true" 0>
</Components>
<Wires>
  <120 200 210 200 "" 0 0 0 "">
  <270 200 320 200 "" 0 0 0 "">
  <540 330 620 330 "" 0 0 0 "">
  <540 50 620 50 "" 0 0 0 "">
  <350 50 350 170 "" 0 0 0 "">
  <350 50 480 50 "" 0 0 0 "">
  <350 230 350 330 "" 0 0 0 "">
  <350 330 480 330 "" 0 0 0 "">
  <680 50 790 50 "" 0 0 0 "">
  <680 330 790 330 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Rect 1000 290 240 160 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 1 0 0 "" "" "">
	<"S21_dB" #0000ff 1 3 0 0 0>
	<"S11_dB" #ff0000 1 3 0 0 0>
	<"S22_dB" #ff00ff 1 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
</Paintings>
