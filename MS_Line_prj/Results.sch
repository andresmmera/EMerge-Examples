<Qucs Schematic 25.2.0>
<Properties>
  <View=-679,-308,2655,1108,0.688652,324,120>
  <Grid=10,10,1>
  <DataSet=Results.dat>
  <DataDisplay=Results.dpl>
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
  <Text 10 -10 11 #000000 0 "Comparison between MS models, Momentum, Sonnet Lite and EMerge">
  <Rectangle -40 -30 550 60 #000000 1 1 #c0c0c0 1 0>
</Symbol>
<Components>
  <GND * 1 570 240 0 0 0 0>
  <SUBST RO4003C 1 90 800 -30 24 0 0 "3.55" 1 "0.508mm" 1 "12.5um" 1 "0.0125" 1 "2.43902e-08" 1 "0" 1>
  <.SP SP1 1 70 540 0 56 0 0 "lin" 1 "100MHz" 1 "2.000GHz" 1 "300" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Pac P1 1 570 210 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0 "true" 0>
  <GND * 1 1010 410 0 0 0 0>
  <GND * 1 850 240 0 0 0 0>
  <Pac P2 1 850 210 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0 "true" 0>
  <GND * 1 1000 200 0 0 0 0>
  <Pac P3 1 1000 170 18 -26 0 1 "3" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0 "true" 0>
  <GND * 1 1400 210 0 0 0 0>
  <Pac P4 1 1400 180 18 -26 0 1 "4" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0 "true" 0>
  <Pac P5 1 1010 380 18 -26 0 1 "5" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0 "true" 0>
  <GND * 1 1380 410 0 0 0 0>
  <Pac P6 1 1380 370 18 -26 0 1 "6" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0 "true" 0>
  <MLIN MS10 1 720 120 -26 20 0 0 "RO4003C" 0 "1.1 mm" 1 "20 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0 "DC" 0>
  <Eqn MS 1 300 900 -31 16 0 0 "S11_MS=dB(S[1,1])" 1 "S21_MS=dB(S[2,1])" 1 "yes" 0>
  <Eqn EMerge 1 510 860 -31 16 0 0 "S11_EMerge=dB(S[3,3])" 1 "S21_EMerge=dB(S[4,3])" 1 "yes" 0>
  <Eqn Sonnet 1 300 790 -31 16 0 0 "S11_Sonnet=dB(S[5,5])" 1 "S21_Sonnet=dB(S[6,5])" 1 "yes" 0>
  <Sub SUB4 5 1190 320 -20 14 0 0 "Sonnet.sch" 0>
  <Sub SUB1 5 1160 130 110 34 0 0 "EMerge.sch" 0>
</Components>
<Wires>
  <570 120 570 180 "" 0 0 0 "">
  <1010 320 1010 350 "" 0 0 0 "">
  <1010 320 1040 320 "" 0 0 0 "">
  <570 120 690 120 "" 0 0 0 "">
  <850 120 850 180 "" 0 0 0 "">
  <750 120 850 120 "" 0 0 0 "">
  <1000 130 1050 130 "" 0 0 0 "">
  <1000 130 1000 140 "" 0 0 0 "">
  <1400 130 1400 150 "" 0 0 0 "">
  <1360 130 1400 130 "" 0 0 0 "">
  <1380 320 1380 340 "" 0 0 0 "">
  <1350 320 1380 320 "" 0 0 0 "">
  <1380 400 1380 410 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Rect 540 738 414 278 3 #c0c0c0 1 00 1 0 5e+08 2e+09 0 -0.5 0.1 0 1 -1 1 1 315 0 225 1 0 0 "" "" "">
	<"S21_MS" #0000ff 1 3 0 0 0>
	<"S21_EMerge" #ff0000 1 3 0 0 0>
	<"S21_Sonnet" #ff00ff 1 3 0 0 0>
  </Rect>
  <Smith 1130 790 298 298 3 #c0c0c0 1 00 1 0 1 1 1 0 4 1 1 0 1 1 315 0 225 1 0 0 "" "" "">
	<"S[1,1]" #0000ff 1 3 0 0 0>
	<"S[3,3]" #ff0000 1 3 0 0 0>
	<"S[5,5]" #ff00ff 1 3 0 0 0>
  </Smith>
</Diagrams>
<Paintings>
  <Text 60 50 20 #000000 0 "MS Line">
  <Text 700 70 15 #000000 0 "50 Ω">
  <Text 50 120 12 #000000 0 "Simulation of a 50 Ohm microstrip line using models\nand EM simulation software (EMerge and Sonnet)">
  <Text 50 200 12 #000000 0 "This project includes the Sonnet file project and\nthe EMerge script.\n\nAfter running the EMerge script, the data is automatically\nsaved in a s2p file">
</Paintings>
