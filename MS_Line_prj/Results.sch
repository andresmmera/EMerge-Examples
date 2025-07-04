<Qucs Schematic 25.1.2>
<Properties>
  <View=-202,-54,1698,1015,0.827877,0,0>
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
  <GND * 1 80 310 0 0 0 0>
  <SUBST RO4003C 1 510 230 -30 24 0 0 "3.55" 1 "0.508mm" 1 "12.5um" 1 "0.0125" 1 "2.43902e-08" 1 "0" 1>
  <.SP SP1 1 1340 50 0 60 0 0 "lin" 1 "100MHz" 1 "2.000GHz" 1 "300" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Pac P1 1 80 280 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0 "true" 0>
  <GND * 1 100 780 0 0 0 0>
  <GND * 1 360 310 0 0 0 0>
  <Pac P2 1 360 280 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0 "true" 0>
  <GND * 1 70 560 0 0 0 0>
  <Pac P3 1 70 530 18 -26 0 1 "3" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0 "true" 0>
  <GND * 1 470 570 0 0 0 0>
  <Pac P4 1 470 540 18 -26 0 1 "4" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0 "true" 0>
  <Pac P5 1 100 750 18 -26 0 1 "5" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0 "true" 0>
  <GND * 1 470 790 0 0 0 0>
  <Pac P6 1 470 760 18 -26 0 1 "6" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0 "true" 0>
  <MLIN MS10 1 230 190 -26 20 0 0 "RO4003C" 0 "1.1 mm" 1 "20 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <Eqn MS 1 700 200 -31 16 0 0 "S11_MS=dB(S[1,1])" 1 "S21_MS=dB(S[2,1])" 1 "yes" 0>
  <Eqn EMerge 1 860 200 -31 16 0 0 "S11_EMerge=dB(S[3,3])" 1 "S21_EMerge=dB(S[4,3])" 1 "yes" 0>
  <Eqn Sonnet 1 690 290 -31 16 0 0 "S11_Sonnet=dB(S[5,5])" 1 "S21_Sonnet=dB(S[6,5])" 1 "yes" 0>
  <Sub SUB4 5 280 690 -20 14 0 0 "Sonnet.sch" 0>
  <Sub SUB1 5 230 490 110 34 0 0 "EMerge.sch" 0>
</Components>
<Wires>
  <80 190 80 250 "" 0 0 0 "">
  <100 690 100 720 "" 0 0 0 "">
  <100 690 130 690 "" 0 0 0 "">
  <200 190 80 190 "" 0 0 0 "">
  <360 250 360 190 "" 0 0 0 "">
  <360 190 260 190 "" 0 0 0 "">
  <70 490 120 490 "" 0 0 0 "">
  <70 500 70 490 "" 0 0 0 "">
  <470 510 470 490 "" 0 0 0 "">
  <470 490 430 490 "" 0 0 0 "">
  <470 730 470 690 "" 0 0 0 "">
  <470 690 440 690 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Rect 770 650 240 160 3 #c0c0c0 1 00 1 0 5e+08 2e+09 0 -0.5 0.1 0 1 -1 1 1 315 0 225 1 0 0 "" "" "">
	<"S21_MS" #0000ff 1 3 0 0 0>
	<"S21_EMerge" #ff0000 1 3 0 0 0>
	<"S21_Sonnet" #ff00ff 1 3 0 0 0>
  </Rect>
  <Smith 1150 670 200 200 3 #c0c0c0 1 00 1 0 1 1 1 0 4 1 1 0 1 1 315 0 225 1 0 0 "" "" "">
	<"S[1,1]" #0000ff 1 3 0 0 0>
	<"S[3,3]" #ff0000 1 3 0 0 0>
	<"S[5,5]" #ff00ff 1 3 0 0 0>
  </Smith>
</Diagrams>
<Paintings>
  <Text 60 50 20 #000000 0 "MS Line">
  <Text 210 140 15 #000000 0 "50 Ω">
</Paintings>
