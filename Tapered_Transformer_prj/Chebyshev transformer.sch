<Qucs Schematic 25.1.2>
<Properties>
  <View=-202,-54,1698,1015,0.827877,0,0>
  <Grid=10,10,1>
  <DataSet=Chebyshev transformer.dat>
  <DataDisplay=Chebyshev transformer.dpl>
  <OpenDisplay=0>
  <Script=Transformer.m>
  <RunScript=0>
  <showFrame=3>
  <FrameText0=Chebyshev Tapered Transformer>
  <FrameText1=Drawn By: Andrés Martínez Mera>
  <FrameText2=Date: June 26, 2025>
  <FrameText3=Revision:>
</Properties>
<Symbol>
  <.ID 540 -16 SUB>
  <.PortSym 0 0 1 0 P5>
  <Text 10 -10 11 #000000 0 "Comparison between MS models, Momentum, Sonnet Lite and EMerge">
  <Rectangle -40 -30 550 60 #000000 1 1 #c0c0c0 1 0>
</Symbol>
<Components>
  <GND * 1 80 310 0 0 0 0>
  <GND * 1 950 310 0 -1 0 0>
  <SUBST RO4003C 1 720 330 -30 24 0 0 "3.55" 1 "0.508mm" 1 "12.5um" 1 "0.0125" 1 "2.43902e-08" 1 "0" 1>
  <.SP SP1 1 1340 50 0 60 0 0 "lin" 1 "100MHz" 1 "2.000GHz" 1 "300" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <GND * 1 70 570 0 0 0 0>
  <Pac P2 1 70 540 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0 "true" 0>
  <GND * 1 680 610 0 -1 0 0>
  <MLIN MS1 1 350 190 -26 20 0 0 "RO4003C" 0 "W1" 1 "L1" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS2 1 520 190 -26 20 0 0 "RO4003C" 0 "W2" 1 "L2" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS3 1 690 190 -26 20 0 0 "RO4003C" 0 "W3" 1 "L3" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MSTEP MS6 1 430 190 -26 17 0 0 "RO4003C" 0 "W1" 1 "W2" 1 "Hammerstad" 0 "Kirschning" 0>
  <MSTEP MS7 1 600 190 -26 17 0 0 "RO4003C" 0 "W2" 1 "W3" 1 "Hammerstad" 0 "Kirschning" 0>
  <R R1 1 950 280 15 -26 0 3 "15 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <Eqn Eqn2 1 410 310 -31 16 0 0 "mm=1e-3" 1 "W1=1.57*mm" 1 "W2=2.7*mm" 1 "W3=4.4*mm" 1 "yes" 0>
  <Eqn Eqn3 1 530 310 -31 16 0 0 "L1=44.38*mm" 1 "L2=43.33*mm" 1 "L3=42.46*mm" 1 "yes" 0>
  <GND * 1 70 770 0 0 0 0>
  <GND * 1 450 780 0 -1 0 0>
  <R R4 1 450 750 15 -26 0 3 "15 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <Pac P3 1 70 740 18 -26 0 1 "3" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0 "true" 0>
  <MLIN MS8 1 880 190 -26 20 0 0 "RO4003C" 0 "W_15Ohm" 1 "L_feed" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MSTEP MS9 1 760 190 -26 17 0 0 "RO4003C" 0 "W3" 1 "W_15Ohm" 1 "Hammerstad" 0 "Kirschning" 0>
  <MLIN MS10 1 140 190 -26 20 0 0 "RO4003C" 0 "W_50Ohm" 1 "L_feed" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <Eqn Eqn4 1 230 310 -31 16 0 0 "W_50Ohm=1.10*mm" 1 "W_15Ohm=5.59*mm" 1 "L_feed=25*mm" 1 "yes" 0>
  <Pac P1 1 80 280 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0 "true" 0>
  <GND * 1 70 940 0 0 0 0>
  <GND * 1 450 950 0 -1 0 0>
  <R R5 1 450 920 15 -26 0 3 "15 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <Pac P4 1 70 910 18 -26 0 1 "4" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0 "true" 0>
  <Eqn Eqn1 1 1340 230 -28 15 0 0 "S11_dB_MS=dB(S[1,1])" 1 "S11_dB_EMerge=dB(S[2,2])" 1 "S11_dB_ADS=dB(S[3,3])" 1 "S11_dB_Sonnet=dB(S[4,4])" 1 "yes" 0>
  <MSTEP MS11 1 240 190 -26 17 0 0 "RO4003C" 0 "W_50Ohm" 1 "W1" 1 "Hammerstad" 0 "Kirschning" 0>
  <Sub SUB1 5 230 490 110 64 0 0 "EMerge.sch" 0>
  <Sub SUB3 5 260 680 -20 44 0 0 "ADS.sch" 0>
  <Sub SUB4 5 250 850 -20 14 0 0 "Sonnet.sch" 0>
  <Port P5 1 1270 50 -23 12 0 0 "1" 1 "analog" 0>
  <R R2 1 680 580 15 -26 0 3 "15 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
</Components>
<Wires>
  <80 190 80 250 "" 0 0 0 "">
  <80 190 110 190 "" 0 0 0 "">
  <950 190 950 250 "" 0 0 0 "">
  <720 190 730 190 "" 0 0 0 "">
  <380 190 400 190 "" 0 0 0 "">
  <460 190 490 190 "" 0 0 0 "">
  <550 190 570 190 "" 0 0 0 "">
  <630 190 660 190 "" 0 0 0 "">
  <70 680 70 710 "" 0 0 0 "">
  <450 680 450 720 "" 0 0 0 "">
  <420 680 450 680 "" 0 0 0 "">
  <70 680 110 680 "" 0 0 0 "">
  <910 190 950 190 "" 0 0 0 "">
  <790 190 850 190 "" 0 0 0 "">
  <170 190 210 190 "" 0 0 0 "">
  <270 190 320 190 "" 0 0 0 "">
  <70 850 70 880 "" 0 0 0 "">
  <450 850 450 890 "" 0 0 0 "">
  <410 850 450 850 "" 0 0 0 "">
  <70 850 100 850 "" 0 0 0 "">
  <680 490 680 550 "" 0 0 0 "">
  <600 490 680 490 "" 0 0 0 "">
  <70 490 70 510 "" 0 0 0 "">
  <70 490 120 490 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Rect 920 827 567 347 3 #c0c0c0 1 00 1 1e+08 2e+08 2e+09 0 -50 5 0 1 -1 0.5 1 315 0 225 1 0 0 "" "" "">
	<"S11_dB_MS" #0000ff 0 3 0 0 0>
	<"S11_dB_EMerge" #ff0000 0 3 0 0 0>
	<"S11_dB_ADS" #aa00ff 1 3 0 0 0>
	<"S11_dB_Sonnet" #000000 1 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
  <Text 60 50 20 #000000 0 "Chebyshev transformer 50 Ω to 15 Ω @ 1 GHz">
  <Text 1190 590 14 #000000 0 "EMerge">
  <Arrow 1210 620 -20 50 20 8 #000000 1 1 0>
  <Text 1230 800 14 #000000 0 "ADS Momentum">
  <Text 1350 710 14 #000000 0 "MS models">
  <Arrow 1340 730 -40 40 20 8 #000000 1 1 0>
  <Arrow 1260 790 -60 -20 20 8 #000000 1 1 0>
  <Text 320 140 15 #000000 0 "41.3 Ω">
  <Text 490 140 15 #000000 0 "27.4 Ω">
  <Text 660 140 15 #000000 0 "18.2 Ω">
  <Text 860 140 15 #000000 0 "15 Ω">
  <Text 120 150 15 #000000 0 "50 Ω">
  <Text 730 60 14 #000000 0 "(Synthesized using the Qucs-S matching tool)">
  <Text 930 770 14 #000000 0 "Sonnet Lite">
  <Arrow 1030 790 40 20 20 8 #000000 1 1 0>
  <Arrow 820 100 -40 40 20 8 #000000 1 1 0>
</Paintings>
