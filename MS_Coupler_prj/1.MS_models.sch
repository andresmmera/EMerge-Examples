<Qucs Schematic 25.1.2>
<Properties>
  <View=-836,-725,4129,1681,0.679176,573,357>
  <Grid=10,10,1>
  <DataSet=1.MS_models.dat>
  <DataDisplay=1.MS_models.dpl>
  <OpenDisplay=0>
  <Script=MS_Coupler_15dB.m>
  <RunScript=0>
  <showFrame=3>
  <FrameText0=15 dB Coupler: MS models>
  <FrameText1=Drawn By: Andrés Martínez Mera>
  <FrameText2=Date: Jun 25th, 2025>
  <FrameText3=Revision:>
</Properties>
<Symbol>
</Symbol>
<Components>
  <Pac P1 1 280 240 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 MHz" 0 "26.85" 0 "true" 0>
  <GND * 1 280 280 0 0 0 0>
  <Pac P2 1 280 440 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 MHz" 0 "26.85" 0 "true" 0>
  <GND * 1 280 480 0 0 0 0>
  <Pac P3 1 1260 240 18 -26 0 1 "3" 1 "50 Ohm" 1 "0 dBm" 0 "1 MHz" 0 "26.85" 0 "true" 0>
  <GND * 1 1260 280 0 0 0 0>
  <Pac P4 1 1260 410 18 -26 0 1 "4" 1 "50 Ohm" 1 "0 dBm" 0 "1 MHz" 0 "26.85" 0 "true" 0>
  <GND * 1 1260 450 0 0 0 0>
  <SUBST Substrate 1 1260 590 -30 24 0 0 "3.55" 1 "0.508 mm" 1 "35 um" 1 "2e-4" 1 "0.022e-6" 1 "0.15e-6" 1>
  <.SP SP1 1 1080 580 0 60 0 0 "lin" 1 "100 MHz" 1 "5000 MHz" 1 "200" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn1 1 1150 770 -31 16 0 0 "RL=dB(S[1,1])" 1 "through=dB(S[2,1])" 1 "coupled=dB(S[3,1])" 1 "isolated=dB(S[4,1])" 1 "yes" 0>
  <Eqn Eqn2 1 130 580 -31 16 0 0 "L_coupled=22.750" 1 "W_coupled=1" 1 "S_coupled=0.300" 1 "W0=1.08" 1 "L_feed=10.0" 1 "L_trans=L_feed/20" 1 "yes" 0>
  <Eqn Eqn3 1 130 770 -31 16 0 0 "mm=1e-3" 1 "L_coupled_mm=L_coupled*mm" 1 "W_coupled_mm=W_coupled*mm" 1 "S_coupled_mm=S_coupled*mm" 1 "W0_mm=W0*mm" 1 "L_feed_mm=L_feed*mm" 1 "L_trans_mm=L_trans*mm" 1 "yes" 0>
  <MLIN MS6 1 370 180 -26 -66 1 0 "Substrate" 0 "W0_mm" 1 "L_feed_mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MSTEP MS7 1 500 180 -26 -68 1 0 "Substrate" 0 "W0_mm" 1 "W_coupled_mm" 1 "Hammerstad" 0 "Kirschning" 0>
  <MLIN MS8 1 620 180 -26 -66 1 0 "Substrate" 0 "W_coupled_mm" 1 "L_trans_mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS12 1 920 180 -26 -66 0 2 "Substrate" 0 "W_coupled_mm" 1 "L_trans_mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MSTEP MS11 1 1040 180 -26 -68 0 2 "Substrate" 0 "W0_mm" 1 "W_coupled_mm" 1 "Hammerstad" 0 "Kirschning" 0>
  <MLIN MS10 1 1170 180 -26 -66 0 2 "Substrate" 0 "W0_mm" 1 "L_feed_mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS14 1 1170 350 -26 15 1 2 "Substrate" 0 "W0_mm" 1 "L_feed_mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MSTEP MS15 1 1040 350 -26 17 1 2 "Substrate" 0 "W0_mm" 1 "W_coupled_mm" 1 "Hammerstad" 0 "Kirschning" 0>
  <MLIN MS16 1 920 350 -26 15 1 2 "Substrate" 0 "W_coupled_mm" 1 "L_trans_mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MCOUPLED MS18 1 770 270 41 -33 0 1 "Substrate" 0 "W_coupled_mm" 1 "L_coupled_mm" 1 "S_coupled_mm" 1 "Kirschning" 0 "Kirschning" 0 "26.85" 0>
  <MMBEND MS13 1 800 180 -7 -49 0 1 "Substrate" 0 "W_coupled_mm" 0>
  <MMBEND MS9 1 740 180 -26 -49 1 1 "Substrate" 0 "W_coupled_mm" 0>
  <MMBEND MS17 1 800 350 -7 32 1 3 "Substrate" 0 "W_coupled_mm" 0>
  <MMBEND MS5 1 740 350 -26 15 0 3 "Substrate" 0 "W_coupled_mm" 0>
  <MLIN MS4 1 620 350 -26 15 0 0 "Substrate" 0 "W_coupled_mm" 1 "L_trans_mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MSTEP MS3 1 500 350 -26 17 0 0 "Substrate" 0 "W0_mm" 1 "W_coupled_mm" 1 "Hammerstad" 0 "Kirschning" 0>
  <MLIN MS2 1 370 350 -26 15 0 0 "Substrate" 0 "W0_mm" 1 "L_feed_mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
</Components>
<Wires>
  <740 300 740 320 "" 0 0 0 "">
  <530 350 590 350 "" 0 0 0 "">
  <400 350 470 350 "" 0 0 0 "">
  <650 350 710 350 "" 0 0 0 "">
  <530 180 590 180 "" 0 0 0 "">
  <400 180 470 180 "" 0 0 0 "">
  <650 180 710 180 "" 0 0 0 "">
  <740 210 740 240 "" 0 0 0 "">
  <950 180 1010 180 "" 0 0 0 "">
  <1070 180 1140 180 "" 0 0 0 "">
  <830 180 890 180 "" 0 0 0 "">
  <800 210 800 240 "" 0 0 0 "">
  <950 350 1010 350 "" 0 0 0 "">
  <1070 350 1140 350 "" 0 0 0 "">
  <830 350 890 350 "" 0 0 0 "">
  <800 300 800 320 "" 0 0 0 "">
  <280 270 280 280 "" 0 0 0 "">
  <280 180 280 210 "" 0 0 0 "">
  <280 180 340 180 "" 0 0 0 "">
  <280 470 280 480 "" 0 0 0 "">
  <280 350 280 410 "" 0 0 0 "">
  <280 350 340 350 "" 0 0 0 "">
  <1260 270 1260 280 "" 0 0 0 "">
  <1260 180 1260 210 "" 0 0 0 "">
  <1200 180 1260 180 "" 0 0 0 "">
  <1260 440 1260 450 "" 0 0 0 "">
  <1260 350 1260 380 "" 0 0 0 "">
  <1200 350 1260 350 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Rect 590 799 416 329 3 #c0c0c0 1 00 1 0 1e+09 5e+09 0 -40 5 5 1 -1 0.5 1 315 0 225 1 0 0 "" "" "">
	<"through" #ff0000 1 3 0 0 0>
	<"RL" #0000ff 1 3 0 0 0>
	<"isolated" #000000 1 3 0 0 0>
	<"coupled" #aa00ff 2 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
</Paintings>
