EESchema Schematic File Version 2
LIBS:Signalgenerator with DDS-rescue
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:Signalgenerator with DDS-cache
EELAYER 25 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title "Signalgenerator µC vers.1"
Date ""
Rev ""
Comp "FH Technikum Wien"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L R R2
U 1 1 57D7ECE6
P 4770 2900
F 0 "R2" V 4850 2900 50  0000 C CNN
F 1 "1.5k" V 4770 2900 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 4700 2900 50  0001 C CNN
F 3 "" H 4770 2900 50  0000 C CNN
	1    4770 2900
	-1   0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 57D7EEBC
P 4720 1500
F 0 "R1" V 4800 1500 50  0000 C CNN
F 1 "180R" V 4720 1500 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 4650 1500 50  0001 C CNN
F 3 "" H 4720 1500 50  0000 C CNN
	1    4720 1500
	0    1    -1   0   
$EndComp
$Comp
L R R3
U 1 1 57D7EF33
P 5420 2650
F 0 "R3" V 5500 2650 50  0000 C CNN
F 1 "13k" V 5420 2650 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 5350 2650 50  0001 C CNN
F 3 "" H 5420 2650 50  0000 C CNN
	1    5420 2650
	0    1    -1   0   
$EndComp
$Comp
L MC34063A U3
U 1 1 57D905BE
P 5620 1900
F 0 "U3" H 5320 2450 60  0000 L CNN
F 1 "MC34063A" H 5320 1350 60  0000 L CNN
F 2 "SMD_Packages:SOIC-8-N" H 5620 1400 60  0001 C CNN
F 3 "" H 5620 1400 60  0000 C CNN
	1    5620 1900
	-1   0    0    -1  
$EndComp
$Comp
L MC34063A U5
U 1 1 57D90657
P 10890 1780
F 0 "U5" H 10590 2330 60  0000 L CNN
F 1 "MC34063A" H 10590 1230 60  0000 L CNN
F 2 "SMD_Packages:SOIC-8-N" H 10890 1280 60  0001 C CNN
F 3 "" H 10890 1280 60  0000 C CNN
	1    10890 1780
	-1   0    0    -1  
$EndComp
Text Notes 4670 900  0    60   ~ 0
Step -Up converter (in 5V - out 12V)
$Comp
L GND #PWR01
U 1 1 57D909FE
P 4770 3150
F 0 "#PWR01" H 4770 2900 50  0001 C CNN
F 1 "GND" H 4770 3000 50  0000 C CNN
F 2 "" H 4770 3150 50  0000 C CNN
F 3 "" H 4770 3150 50  0000 C CNN
	1    4770 3150
	-1   0    0    -1  
$EndComp
$Comp
L R RSC2
U 1 1 57D90CB1
P 9790 1830
F 0 "RSC2" V 9870 1830 50  0000 C CNN
F 1 "0,220R" V 9790 1820 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 9720 1830 50  0001 C CNN
F 3 "" H 9790 1830 50  0000 C CNN
	1    9790 1830
	-1   0    0    -1  
$EndComp
$Comp
L CP C13
U 1 1 57D90D3C
P 9790 2280
F 0 "C13" H 9815 2380 50  0000 L CNN
F 1 "100uF" H 9815 2180 50  0000 L CNN
F 2 "Capacitors_SMD:c_elec_6.3x7.7" H 9828 2130 50  0001 C CNN
F 3 "" H 9790 2280 50  0000 C CNN
	1    9790 2280
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 57D90DB9
P 9790 2480
F 0 "#PWR02" H 9790 2230 50  0001 C CNN
F 1 "GND" H 9790 2330 50  0000 C CNN
F 2 "" H 9790 2480 50  0000 C CNN
F 3 "" H 9790 2480 50  0000 C CNN
	1    9790 2480
	-1   0    0    -1  
$EndComp
$Comp
L CP CO1
U 1 1 57D90F84
P 6720 2900
F 0 "CO1" H 6745 3000 50  0000 L CNN
F 1 "100uF" H 6745 2800 50  0000 L CNN
F 2 "Capacitors_SMD:c_elec_6.3x7.7" H 6758 2750 50  0001 C CNN
F 3 "" H 6720 2900 50  0000 C CNN
	1    6720 2900
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 57D91008
P 6170 2400
F 0 "#PWR03" H 6170 2150 50  0001 C CNN
F 1 "GND" H 6170 2250 50  0000 C CNN
F 2 "" H 6170 2400 50  0000 C CNN
F 3 "" H 6170 2400 50  0000 C CNN
	1    6170 2400
	-1   0    0    -1  
$EndComp
$Comp
L C CT1
U 1 1 57D91045
P 6420 2200
F 0 "CT1" H 6445 2300 50  0000 L CNN
F 1 "270pF" H 6445 2100 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 6458 2050 50  0001 C CNN
F 3 "" H 6420 2200 50  0000 C CNN
	1    6420 2200
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 57D9117C
P 6420 2400
F 0 "#PWR04" H 6420 2150 50  0001 C CNN
F 1 "GND" H 6420 2250 50  0000 C CNN
F 2 "" H 6420 2400 50  0000 C CNN
F 3 "" H 6420 2400 50  0000 C CNN
	1    6420 2400
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 57D91235
P 6170 1700
F 0 "#PWR05" H 6170 1450 50  0001 C CNN
F 1 "GND" H 6170 1550 50  0000 C CNN
F 2 "" H 6170 1700 50  0000 C CNN
F 3 "" H 6170 1700 50  0000 C CNN
	1    6170 1700
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 57D912AA
P 6720 3150
F 0 "#PWR06" H 6720 2900 50  0001 C CNN
F 1 "GND" H 6720 3000 50  0000 C CNN
F 2 "" H 6720 3150 50  0000 C CNN
F 3 "" H 6720 3150 50  0000 C CNN
	1    6720 3150
	-1   0    0    -1  
$EndComp
$Comp
L D_Schottky D1
U 1 1 57D91563
P 6720 1850
F 0 "D1" H 6720 1950 50  0000 C CNN
F 1 "1N5819" H 6720 1750 50  0000 C CNN
F 2 "Diodes_SMD:SOD-123" H 6720 1850 50  0001 C CNN
F 3 "" H 6720 1850 50  0000 C CNN
	1    6720 1850
	0    1    -1   0   
$EndComp
$Comp
L INDUCTOR L1
U 1 1 57D92BB8
P 5570 1250
F 0 "L1" V 5520 1250 50  0000 C CNN
F 1 "82uH" V 5670 1250 50  0000 C CNN
F 2 "SMD_inductors:ELLCTP_inductor" H 5570 1250 50  0001 C CNN
F 3 "" H 5570 1250 50  0000 C CNN
	1    5570 1250
	0    1    -1   0   
$EndComp
$Comp
L R R4
U 1 1 57D935BA
P 10040 2830
F 0 "R4" V 10120 2830 50  0000 C CNN
F 1 "8.2k" V 10040 2830 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 9970 2830 50  0001 C CNN
F 3 "" H 10040 2830 50  0000 C CNN
	1    10040 2830
	-1   0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 57D935C0
P 10690 2580
F 0 "R5" V 10770 2580 50  0000 C CNN
F 1 "953" V 10690 2580 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 10620 2580 50  0001 C CNN
F 3 "" H 10690 2580 50  0000 C CNN
	1    10690 2580
	0    1    -1   0   
$EndComp
$Comp
L GND #PWR07
U 1 1 57D935C6
P 10040 3080
F 0 "#PWR07" H 10040 2830 50  0001 C CNN
F 1 "GND" H 10040 2930 50  0000 C CNN
F 2 "" H 10040 3080 50  0000 C CNN
F 3 "" H 10040 3080 50  0000 C CNN
	1    10040 3080
	-1   0    0    -1  
$EndComp
$Comp
L CP CO2
U 1 1 57D935D0
P 12190 2830
F 0 "CO2" H 12215 2930 50  0000 L CNN
F 1 "100uF" H 12215 2730 50  0000 L CNN
F 2 "Capacitors_SMD:c_elec_6.3x7.7" H 12228 2680 50  0001 C CNN
F 3 "" H 12190 2830 50  0000 C CNN
	1    12190 2830
	1    0    0    1   
$EndComp
$Comp
L GND #PWR08
U 1 1 57D935E2
P 12190 3080
F 0 "#PWR08" H 12190 2830 50  0001 C CNN
F 1 "GND" H 12190 2930 50  0000 C CNN
F 2 "" H 12190 3080 50  0000 C CNN
F 3 "" H 12190 3080 50  0000 C CNN
	1    12190 3080
	-1   0    0    -1  
$EndComp
$Comp
L INDUCTOR L2
U 1 1 57D93812
P 12710 1510
F 0 "L2" V 12660 1510 50  0000 C CNN
F 1 "82uH" V 12810 1510 50  0000 C CNN
F 2 "SMD_inductors:ELLCTP_inductor" H 12710 1510 50  0001 C CNN
F 3 "" H 12710 1510 50  0000 C CNN
	1    12710 1510
	1    0    0    1   
$EndComp
$Comp
L GND #PWR09
U 1 1 57D93EFE
P 12710 1860
F 0 "#PWR09" H 12710 1610 50  0001 C CNN
F 1 "GND" H 12710 1710 50  0000 C CNN
F 2 "" H 12710 1860 50  0000 C CNN
F 3 "" H 12710 1860 50  0000 C CNN
	1    12710 1860
	-1   0    0    -1  
$EndComp
$Comp
L D_Schottky D2
U 1 1 57D95362
P 12190 1730
F 0 "D2" H 12190 1830 50  0000 C CNN
F 1 "1N5819" H 12190 1630 50  0000 C CNN
F 2 "Diodes_SMD:SOD-123" H 12190 1730 50  0001 C CNN
F 3 "" H 12190 1730 50  0000 C CNN
	1    12190 1730
	0    -1   1    0   
$EndComp
Text Notes 12040 910  2    60   ~ 0
Volatage Inverting Converter (in 5V - out -12V)\n
$Comp
L R RSC1
U 1 1 57D97B80
P 4520 1950
F 0 "RSC1" V 4600 1950 50  0000 C CNN
F 1 "0.47R" V 4520 1950 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 4450 1950 50  0001 C CNN
F 3 "" H 4520 1950 50  0000 C CNN
	1    4520 1950
	-1   0    0    -1  
$EndComp
$Comp
L CP C8
U 1 1 57D97B86
P 4520 2400
F 0 "C8" H 4545 2500 50  0000 L CNN
F 1 "100uF" H 4545 2300 50  0000 L CNN
F 2 "Capacitors_SMD:c_elec_6.3x7.7" H 4558 2250 50  0001 C CNN
F 3 "" H 4520 2400 50  0000 C CNN
	1    4520 2400
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 57D97B8C
P 4520 2600
F 0 "#PWR010" H 4520 2350 50  0001 C CNN
F 1 "GND" H 4520 2450 50  0000 C CNN
F 2 "" H 4520 2600 50  0000 C CNN
F 3 "" H 4520 2600 50  0000 C CNN
	1    4520 2600
	-1   0    0    -1  
$EndComp
Text GLabel 7470 2650 2    60   Output ~ 0
+12V
Text GLabel 12890 2580 2    60   Output ~ 0
-12V
$Comp
L R R10
U 1 1 57EB873E
P 13770 4430
F 0 "R10" V 13850 4430 50  0000 C CNN
F 1 "30k" V 13770 4430 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 13700 4430 50  0001 C CNN
F 3 "" H 13770 4430 50  0000 C CNN
	1    13770 4430
	0    1    1    0   
$EndComp
$Comp
L R R8
U 1 1 57EB89A7
P 13290 5160
F 0 "R8" V 13370 5160 50  0000 C CNN
F 1 "1k" V 13290 5160 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 13220 5160 50  0001 C CNN
F 3 "" H 13290 5160 50  0000 C CNN
	1    13290 5160
	0    1    1    0   
$EndComp
$Comp
L POT-RESCUE-Signalgenerator_with_DDS RV3
U 1 1 57EB8A8C
P 13230 6390
F 0 "RV3" H 13230 6290 50  0000 C CNN
F 1 "10k" H 13230 6390 50  0000 C CNN
F 2 "Eigene_Footprints:trim_murata_TS53YL" H 13230 6390 50  0001 C CNN
F 3 "" H 13230 6390 50  0000 C CNN
	1    13230 6390
	1    0    0    -1  
$EndComp
Text GLabel 1560 1440 1    60   Input ~ 0
+12V
Text GLabel 13750 5660 3    60   Input ~ 0
+Vs
$Comp
L C C1
U 1 1 57EBA774
P 1810 1890
F 0 "C1" H 1835 1990 50  0000 L CNN
F 1 "10nF" H 1835 1790 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 1848 1740 50  0001 C CNN
F 3 "" H 1810 1890 50  0000 C CNN
	1    1810 1890
	0    1    1    0   
$EndComp
$Comp
L C C3
U 1 1 57EBA90D
P 2110 2940
F 0 "C3" H 2135 3040 50  0000 L CNN
F 1 "10nF" H 2135 2840 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 2148 2790 50  0001 C CNN
F 3 "" H 2110 2940 50  0000 C CNN
	1    2110 2940
	0    1    1    0   
$EndComp
Text GLabel 1860 2490 1    60   Input ~ 0
-12V
$Comp
L GND #PWR011
U 1 1 57EBAD24
P 2210 1790
F 0 "#PWR011" H 2210 1540 50  0001 C CNN
F 1 "GND" H 2210 1640 50  0000 C CNN
F 2 "" H 2210 1790 50  0000 C CNN
F 3 "" H 2210 1790 50  0000 C CNN
	1    2210 1790
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 57EBAD62
P 2510 2840
F 0 "#PWR012" H 2510 2590 50  0001 C CNN
F 1 "GND" H 2510 2690 50  0000 C CNN
F 2 "" H 2510 2840 50  0000 C CNN
F 3 "" H 2510 2840 50  0000 C CNN
	1    2510 2840
	1    0    0    -1  
$EndComp
Text GLabel 1860 3140 3    60   Output ~ 0
-Vs
Text GLabel 1560 2090 3    60   Output ~ 0
+Vs
Text GLabel 13750 4860 1    60   Input ~ 0
-Vs
Text GLabel 13940 6390 2    60   Input ~ 0
+Vs
Text GLabel 12500 6390 0    60   Input ~ 0
-Vs
Text Notes 12780 4160 0    60   ~ 0
Amplifer A for channel 1
Text Notes 1210 890  0    60   ~ 0
Supply voltage for OPV +-12V
Text Notes 10950 7200 0    43   ~ 0
Pin connection X1 to signalgenerator PCB
$Comp
L BNC P10
U 1 1 57EBE81A
P 15430 5260
F 0 "P10" H 15440 5380 50  0000 C CNN
F 1 "BNC_CH0" V 15540 5200 50  0000 C CNN
F 2 "Sockets_BNC:BNC_Socket_TYCO-AMP_LargePads" H 15430 5260 50  0001 C CNN
F 3 "" H 15430 5260 50  0000 C CNN
	1    15430 5260
	1    0    0    -1  
$EndComp
$Comp
L R R9
U 1 1 57FF1C11
P 13720 6390
F 0 "R9" V 13800 6390 50  0000 C CNN
F 1 "820R" V 13720 6390 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 13650 6390 50  0001 C CNN
F 3 "" H 13720 6390 50  0000 C CNN
	1    13720 6390
	0    -1   -1   0   
$EndComp
$Comp
L R R6
U 1 1 57FF58D8
P 12750 6390
F 0 "R6" V 12830 6390 50  0000 C CNN
F 1 "820R" V 12750 6390 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 12680 6390 50  0001 C CNN
F 3 "" H 12750 6390 50  0000 C CNN
	1    12750 6390
	0    -1   -1   0   
$EndComp
$Comp
L C C7
U 1 1 57FFC17E
P 4020 2500
F 0 "C7" H 4045 2600 50  0000 L CNN
F 1 "10nF" H 4045 2400 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 4058 2350 50  0001 C CNN
F 3 "" H 4020 2500 50  0000 C CNN
	1    4020 2500
	1    0    0    -1  
$EndComp
$Comp
L C C12
U 1 1 57FFCD23
P 9290 2480
F 0 "C12" H 9315 2580 50  0000 L CNN
F 1 "10nF" H 9315 2380 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 9328 2330 50  0001 C CNN
F 3 "" H 9290 2480 50  0000 C CNN
	1    9290 2480
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR013
U 1 1 57FFCEF0
P 9290 3080
F 0 "#PWR013" H 9290 2830 50  0001 C CNN
F 1 "GND" H 9290 2930 50  0000 C CNN
F 2 "" H 9290 3080 50  0000 C CNN
F 3 "" H 9290 3080 50  0000 C CNN
	1    9290 3080
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 57FFD077
P 4020 3150
F 0 "#PWR014" H 4020 2900 50  0001 C CNN
F 1 "GND" H 4020 3000 50  0000 C CNN
F 2 "" H 4020 3150 50  0000 C CNN
F 3 "" H 4020 3150 50  0000 C CNN
	1    4020 3150
	1    0    0    -1  
$EndComp
Text Notes 15580 5260 0    39   ~ 0
50 Ohm
$Comp
L CONN_01X01 P11
U 1 1 58038F7D
P 15630 5660
F 0 "P11" H 15630 5760 50  0000 C CNN
F 1 "CONN_01X01" V 15730 5660 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 15630 5660 50  0001 C CNN
F 3 "" H 15630 5660 50  0000 C CNN
	1    15630 5660
	1    0    0    -1  
$EndComp
$Comp
L AD9837 U2
U 1 1 580516FD
P 3710 5320
F 0 "U2" H 3690 5710 60  0000 C TNN
F 1 "AD9837" H 3730 4940 60  0000 C CNN
F 2 "Housings_DFN_QFN:DFN-10-1EP_3x3mm_Pitch0.5mm" H 3750 4890 60  0001 C CNN
F 3 "" H 3750 4890 60  0000 C CNN
	1    3710 5320
	1    0    0    -1  
$EndComp
Text GLabel 4510 5420 2    43   Input ~ 0
P0.10
Text GLabel 4510 5520 2    43   Input ~ 0
P0.1
Text GLabel 4510 5320 2    43   Input ~ 0
P0.9
Text Notes 3060 6120 0    60   ~ 0
FSYNC  ->  Equivalent to Chip Select\nSDATA  ->  Input from the master device\nSCLK   ->  SPI clock input
$Comp
L C C6
U 1 1 58058B5D
P 2680 5020
F 0 "C6" V 2730 5100 50  0000 L CNN
F 1 "10nF" V 2730 4770 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 2718 4870 50  0001 C CNN
F 3 "" H 2680 5020 50  0000 C CNN
	1    2680 5020
	0    1    1    0   
$EndComp
Text GLabel 2210 4720 1    43   Input ~ 0
VDD3.3
$Comp
L OSCILLATOR_SMD U1
U 1 1 58065971
P 2200 6440
F 0 "U1" H 2190 6720 60  0000 C CNN
F 1 "OSCILLATOR_SMD_16MHz" H 2120 6330 60  0000 C CNN
F 2 "Eigene_Footprints:Oscillator_7_mal_5mm_SMD" H 2190 6720 60  0001 C CNN
F 3 "" H 2190 6720 60  0000 C CNN
	1    2200 6440
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR015
U 1 1 58068ABA
P 2700 6600
F 0 "#PWR015" H 2700 6350 50  0001 C CNN
F 1 "GND" H 2700 6450 50  0000 C CNN
F 2 "" H 2700 6600 50  0000 C CNN
F 3 "" H 2700 6600 50  0000 C CNN
	1    2700 6600
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 5806AE68
P 1250 6660
F 0 "C2" H 1275 6760 50  0000 L CNN
F 1 "0.1uF" H 1275 6560 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 1288 6510 50  0001 C CNN
F 3 "" H 1250 6660 50  0000 C CNN
	1    1250 6660
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR016
U 1 1 5806BA28
P 1250 6900
F 0 "#PWR016" H 1250 6650 50  0001 C CNN
F 1 "GND" H 1250 6750 50  0000 C CNN
F 2 "" H 1250 6900 50  0000 C CNN
F 3 "" H 1250 6900 50  0000 C CNN
	1    1250 6900
	1    0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 5806F527
P 2030 5570
F 0 "C5" H 2055 5670 50  0000 L CNN
F 1 "0.1uF" H 2055 5470 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 2068 5420 50  0001 C CNN
F 3 "" H 2030 5570 50  0000 C CNN
	1    2030 5570
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR017
U 1 1 5806F5BB
P 2030 5890
F 0 "#PWR017" H 2030 5640 50  0001 C CNN
F 1 "GND" H 2030 5740 50  0000 C CNN
F 2 "" H 2030 5890 50  0000 C CNN
F 3 "" H 2030 5890 50  0000 C CNN
	1    2030 5890
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR018
U 1 1 58072D69
P 5180 5400
F 0 "#PWR018" H 5180 5150 50  0001 C CNN
F 1 "GND" H 5180 5250 50  0000 C CNN
F 2 "" H 5180 5400 50  0000 C CNN
F 3 "" H 5180 5400 50  0000 C CNN
	1    5180 5400
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 5807450E
P 1650 5570
F 0 "C4" H 1675 5670 50  0000 L CNN
F 1 "0.1uF" H 1675 5470 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 1688 5420 50  0001 C CNN
F 3 "" H 1650 5570 50  0000 C CNN
	1    1650 5570
	1    0    0    -1  
$EndComp
Text Label 11020 5710 0    60   ~ 0
OPV_DDS_OUT_1
Text Notes 4350 4010 0    60   ~ 0
DDS IC AD9837 with OPV channel 1\n
$Comp
L JUMPER JP2
U 1 1 580DFEAC
P 12080 5710
F 0 "JP2" H 12080 5860 50  0000 C CNN
F 1 "JUMPER" H 12080 5630 50  0000 C CNN
F 2 "Eigene_Footprints:2_jumper_2.54mm" H 12080 5710 50  0001 C CNN
F 3 "" H 12080 5710 50  0000 C CNN
	1    12080 5710
	1    0    0    -1  
$EndComp
Text GLabel 1250 6100 1    43   Input ~ 0
VDD3.3
Text GLabel 11230 9100 0    39   Input ~ 0
P0.9
Text GLabel 11230 9200 0    43   Input ~ 0
P0.10
Text GLabel 12010 9000 2    43   Input ~ 0
P0.1
Text GLabel 12000 9300 2    43   Input ~ 0
VDD3.3
Text GLabel 3820 2200 0    43   Input ~ 0
VDD5
Text GLabel 9140 2080 0    43   Input ~ 0
VDD5
Text GLabel 12000 9400 2    43   Input ~ 0
VDD5
$Comp
L R R7
U 1 1 580CB3C8
P 12770 5360
F 0 "R7" V 12850 5360 50  0000 C CNN
F 1 "100R" V 12770 5360 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 12700 5360 50  0001 C CNN
F 3 "" H 12770 5360 50  0000 C CNN
	1    12770 5360
	0    1    1    0   
$EndComp
Text Notes 12690 8570 0    47   ~ 0
P 14.8 -> Pin_OUT for DAC channel 1\nP 14.9 -> Pin_OUT for DAC channel 2\n\nP 3.0  -> FSYNC/CS for DDS IC 2\nP 0.9  -> FSYNC/CS for DDS IC 1\nP 0.10 -> SCLK for both DDS IC's\nP 0.1  -> MOSI for both DDS IC's
Text GLabel 12000 7500 2    39   Input ~ 0
GND
$Comp
L TL071 U6
U 1 1 581065CB
P 13850 5260
F 0 "U6" H 13850 5510 50  0000 L CNN
F 1 "LM7171" H 13850 5410 50  0000 L CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 13900 5460 50  0001 C CNN
F 3 "" H 13850 5510 50  0000 C CNN
	1    13850 5260
	1    0    0    1   
$EndComp
Text GLabel 12010 8900 2    43   Input ~ 0
P3.0
Text Label 4390 5120 0    60   ~ 0
OPV_DDS_OUT_1
$Comp
L C CT2
U 1 1 58349C23
P 11590 2080
F 0 "CT2" H 11615 2180 50  0000 L CNN
F 1 "1500pF" H 11615 1980 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 11628 1930 50  0001 C CNN
F 3 "" H 11590 2080 50  0000 C CNN
	1    11590 2080
	1    0    0    -1  
$EndComp
$Comp
L AD9837 U4
U 1 1 5849CCA1
P 7800 5350
F 0 "U4" H 7780 5740 60  0000 C TNN
F 1 "AD9837" H 7820 4970 60  0000 C CNN
F 2 "Housings_DFN_QFN:DFN-10-1EP_3x3mm_Pitch0.5mm" H 7840 4920 60  0001 C CNN
F 3 "" H 7840 4920 60  0000 C CNN
	1    7800 5350
	1    0    0    -1  
$EndComp
Text GLabel 8600 5450 2    43   Input ~ 0
P0.10
Text GLabel 8600 5550 2    43   Input ~ 0
P0.1
Text GLabel 8600 5350 2    43   Input ~ 0
P3.0
$Comp
L C C11
U 1 1 5849CCAA
P 6770 5050
F 0 "C11" V 6820 5130 50  0000 L CNN
F 1 "10nF" V 6820 4800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 6808 4900 50  0001 C CNN
F 3 "" H 6770 5050 50  0000 C CNN
	1    6770 5050
	0    1    1    0   
$EndComp
Text GLabel 6300 4750 1    43   Input ~ 0
VDD3.3
$Comp
L C C10
U 1 1 5849CCB1
P 6120 5600
F 0 "C10" H 6145 5700 50  0000 L CNN
F 1 "0.1uF" H 6145 5500 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 6158 5450 50  0001 C CNN
F 3 "" H 6120 5600 50  0000 C CNN
	1    6120 5600
	1    0    0    -1  
$EndComp
$Comp
L C C9
U 1 1 5849CCB7
P 5740 5600
F 0 "C9" H 5765 5700 50  0000 L CNN
F 1 "0.1uF" H 5765 5500 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 5778 5450 50  0001 C CNN
F 3 "" H 5740 5600 50  0000 C CNN
	1    5740 5600
	1    0    0    -1  
$EndComp
Text Label 8480 5150 0    60   ~ 0
OPV_DDS_OUT_2
$Comp
L GND #PWR019
U 1 1 5849FC65
P 6120 5930
F 0 "#PWR019" H 6120 5680 50  0001 C CNN
F 1 "GND" H 6120 5780 50  0000 C CNN
F 2 "" H 6120 5930 50  0000 C CNN
F 3 "" H 6120 5930 50  0000 C CNN
	1    6120 5930
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR020
U 1 1 584A7CDC
P 9270 5300
F 0 "#PWR020" H 9270 5050 50  0001 C CNN
F 1 "GND" H 9270 5150 50  0000 C CNN
F 2 "" H 9270 5300 50  0000 C CNN
F 3 "" H 9270 5300 50  0000 C CNN
	1    9270 5300
	1    0    0    -1  
$EndComp
$Comp
L JUMPER JP1
U 1 1 58523DCB
P 12070 5250
F 0 "JP1" H 12070 5400 50  0000 C CNN
F 1 "JUMPER" H 12070 5170 50  0000 C CNN
F 2 "Eigene_Footprints:2_jumper_2.54mm" H 12070 5250 50  0001 C CNN
F 3 "" H 12070 5250 50  0000 C CNN
	1    12070 5250
	1    0    0    -1  
$EndComp
Text Label 11240 4970 0    60   ~ 0
DAC0
$Comp
L POT-RESCUE-Signalgenerator_with_DDS RV2
U 1 1 5852D137
P 12990 4740
F 0 "RV2" H 12990 4640 50  0000 C CNN
F 1 "1k" H 12990 4740 50  0000 C CNN
F 2 "SMD_resistor:trim_bourns_3214w" H 12990 4740 50  0001 C CNN
F 3 "" H 12990 4740 50  0000 C CNN
	1    12990 4740
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR021
U 1 1 57EBEA37
P 15430 5860
F 0 "#PWR021" H 15430 5610 50  0001 C CNN
F 1 "GND" H 15430 5710 50  0000 C CNN
F 2 "" H 15430 5860 50  0000 C CNN
F 3 "" H 15430 5860 50  0000 C CNN
	1    15430 5860
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR022
U 1 1 5852EF43
P 12710 4830
F 0 "#PWR022" H 12710 4580 50  0001 C CNN
F 1 "GND" H 12710 4680 50  0000 C CNN
F 2 "" H 12710 4830 50  0000 C CNN
F 3 "" H 12710 4830 50  0000 C CNN
	1    12710 4830
	1    0    0    -1  
$EndComp
Text Label 13260 4740 0    60   ~ 0
NC
Text Notes 12860 4530 0    39   ~ 0
Amplitude
Text Notes 13200 6600 0    39   ~ 0
Offset
$Comp
L R R11
U 1 1 58552539
P 14910 5260
F 0 "R11" V 14990 5260 50  0000 C CNN
F 1 "0R" V 14910 5260 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 14840 5260 50  0001 C CNN
F 3 "" H 14910 5260 50  0000 C CNN
	1    14910 5260
	0    1    1    0   
$EndComp
$Comp
L C C16
U 1 1 58556E8C
P 15120 5580
F 0 "C16" H 15145 5680 50  0000 L CNN
F 1 "0.1uF" H 15145 5480 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 15158 5430 50  0001 C CNN
F 3 "" H 15120 5580 50  0000 C CNN
	1    15120 5580
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR023
U 1 1 58557BB0
P 15120 5810
F 0 "#PWR023" H 15120 5560 50  0001 C CNN
F 1 "GND" H 15120 5660 50  0000 C CNN
F 2 "" H 15120 5810 50  0000 C CNN
F 3 "" H 15120 5810 50  0000 C CNN
	1    15120 5810
	1    0    0    -1  
$EndComp
Text Notes 14780 5170 0    28   ~ 0
       Dummy - \n(RC low-pass filter)
$Comp
L POT-RESCUE-Signalgenerator_with_DDS RV1
U 1 1 5856BC00
P 10960 4970
F 0 "RV1" H 10960 4870 50  0000 C CNN
F 1 "1k" H 10960 4970 50  0000 C CNN
F 2 "SMD_resistor:trim_bourns_3214w" H 10960 4970 50  0001 C CNN
F 3 "" H 10960 4970 50  0000 C CNN
	1    10960 4970
	0    1    1    0   
$EndComp
Text GLabel 11990 7900 2    39   Input ~ 0
P14.8
Text GLabel 10760 4720 0    39   Input ~ 0
P14.8
$Comp
L GND #PWR024
U 1 1 5857121C
P 10960 5260
F 0 "#PWR024" H 10960 5010 50  0001 C CNN
F 1 "GND" H 10960 5110 50  0000 C CNN
F 2 "" H 10960 5260 50  0000 C CNN
F 3 "" H 10960 5260 50  0000 C CNN
	1    10960 5260
	1    0    0    -1  
$EndComp
$Comp
L R R16
U 1 1 586EF89A
P 5750 8250
F 0 "R16" V 5830 8250 50  0000 C CNN
F 1 "30k" V 5750 8250 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 5680 8250 50  0001 C CNN
F 3 "" H 5750 8250 50  0000 C CNN
	1    5750 8250
	0    1    1    0   
$EndComp
$Comp
L R R14
U 1 1 586EF8A0
P 5270 8980
F 0 "R14" V 5350 8980 50  0000 C CNN
F 1 "1k" V 5270 8980 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 5200 8980 50  0001 C CNN
F 3 "" H 5270 8980 50  0000 C CNN
	1    5270 8980
	0    1    1    0   
$EndComp
$Comp
L POT-RESCUE-Signalgenerator_with_DDS RV6
U 1 1 586EF8A6
P 5210 10210
F 0 "RV6" H 5210 10110 50  0000 C CNN
F 1 "10k" H 5210 10210 50  0000 C CNN
F 2 "Eigene_Footprints:trim_murata_TS53YL" H 5210 10210 50  0001 C CNN
F 3 "" H 5210 10210 50  0000 C CNN
	1    5210 10210
	1    0    0    -1  
$EndComp
Text GLabel 5730 9480 3    60   Input ~ 0
+Vs
Text GLabel 5730 8680 1    60   Input ~ 0
-Vs
Text GLabel 5920 10210 2    60   Input ~ 0
+Vs
Text GLabel 4480 10210 0    60   Input ~ 0
-Vs
Text Notes 4760 7980 0    60   ~ 0
Amplifer A for channel 2\n
$Comp
L BNC P2
U 1 1 586EF8B1
P 7290 9080
F 0 "P2" H 7300 9200 50  0000 C CNN
F 1 "BNC_CH0" V 7400 9020 50  0000 C CNN
F 2 "Sockets_BNC:BNC_Socket_TYCO-AMP_LargePads" H 7290 9080 50  0001 C CNN
F 3 "" H 7290 9080 50  0000 C CNN
	1    7290 9080
	1    0    0    -1  
$EndComp
$Comp
L R R15
U 1 1 586EF8B7
P 5700 10210
F 0 "R15" V 5780 10210 50  0000 C CNN
F 1 "820R" V 5700 10210 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 5630 10210 50  0001 C CNN
F 3 "" H 5700 10210 50  0000 C CNN
	1    5700 10210
	0    -1   -1   0   
$EndComp
$Comp
L R R12
U 1 1 586EF8BD
P 4730 10210
F 0 "R12" V 4810 10210 50  0000 C CNN
F 1 "820R" V 4730 10210 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 4660 10210 50  0001 C CNN
F 3 "" H 4730 10210 50  0000 C CNN
	1    4730 10210
	0    -1   -1   0   
$EndComp
Text Notes 7440 9080 0    39   ~ 0
50 Ohm
$Comp
L CONN_01X01 P4
U 1 1 586EF8C4
P 7490 9480
F 0 "P4" H 7490 9580 50  0000 C CNN
F 1 "CONN_01X01" V 7590 9480 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 7490 9480 50  0001 C CNN
F 3 "" H 7490 9480 50  0000 C CNN
	1    7490 9480
	1    0    0    -1  
$EndComp
Text Label 3000 9530 0    60   ~ 0
OPV_DDS_OUT_2
$Comp
L JUMPER JP4
U 1 1 586EF8CB
P 4060 9530
F 0 "JP4" H 4060 9680 50  0000 C CNN
F 1 "JUMPER" H 4060 9450 50  0000 C CNN
F 2 "Eigene_Footprints:2_jumper_2.54mm" H 4060 9530 50  0001 C CNN
F 3 "" H 4060 9530 50  0000 C CNN
	1    4060 9530
	1    0    0    -1  
$EndComp
$Comp
L R R13
U 1 1 586EF8D1
P 4750 9180
F 0 "R13" V 4830 9180 50  0000 C CNN
F 1 "100R" V 4750 9180 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 4680 9180 50  0001 C CNN
F 3 "" H 4750 9180 50  0000 C CNN
	1    4750 9180
	0    1    1    0   
$EndComp
$Comp
L TL071 U7
U 1 1 586EF8D7
P 5830 9080
F 0 "U7" H 5830 9330 50  0000 L CNN
F 1 "LM7171" H 5830 9230 50  0000 L CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 5880 9280 50  0001 C CNN
F 3 "" H 5830 9330 50  0000 C CNN
	1    5830 9080
	1    0    0    1   
$EndComp
$Comp
L JUMPER JP3
U 1 1 586EF8DD
P 4050 9070
F 0 "JP3" H 4050 9220 50  0000 C CNN
F 1 "JUMPER" H 4050 8990 50  0000 C CNN
F 2 "Eigene_Footprints:2_jumper_2.54mm" H 4050 9070 50  0001 C CNN
F 3 "" H 4050 9070 50  0000 C CNN
	1    4050 9070
	1    0    0    -1  
$EndComp
Text Label 3220 8790 0    60   ~ 0
DAC1
$Comp
L POT-RESCUE-Signalgenerator_with_DDS RV5
U 1 1 586EF8E4
P 4970 8560
F 0 "RV5" H 4970 8460 50  0000 C CNN
F 1 "1k" H 4970 8560 50  0000 C CNN
F 2 "SMD_resistor:trim_bourns_3214w" H 4970 8560 50  0001 C CNN
F 3 "" H 4970 8560 50  0000 C CNN
	1    4970 8560
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR025
U 1 1 586EF8EA
P 7290 9680
F 0 "#PWR025" H 7290 9430 50  0001 C CNN
F 1 "GND" H 7290 9530 50  0000 C CNN
F 2 "" H 7290 9680 50  0000 C CNN
F 3 "" H 7290 9680 50  0000 C CNN
	1    7290 9680
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR026
U 1 1 586EF8F0
P 4690 8650
F 0 "#PWR026" H 4690 8400 50  0001 C CNN
F 1 "GND" H 4690 8500 50  0000 C CNN
F 2 "" H 4690 8650 50  0000 C CNN
F 3 "" H 4690 8650 50  0000 C CNN
	1    4690 8650
	1    0    0    -1  
$EndComp
Text Label 5240 8560 0    60   ~ 0
NC
Text Notes 4840 8350 0    39   ~ 0
Amplitude
Text Notes 5180 10420 0    39   ~ 0
Offset
$Comp
L R R17
U 1 1 586EF8F9
P 6770 9080
F 0 "R17" V 6850 9080 50  0000 C CNN
F 1 "0R" V 6770 9080 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 6700 9080 50  0001 C CNN
F 3 "" H 6770 9080 50  0000 C CNN
	1    6770 9080
	0    1    1    0   
$EndComp
$Comp
L C C14
U 1 1 586EF8FF
P 6980 9400
F 0 "C14" H 7005 9500 50  0000 L CNN
F 1 "0.1uF" H 7005 9300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 7018 9250 50  0001 C CNN
F 3 "" H 6980 9400 50  0000 C CNN
	1    6980 9400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR027
U 1 1 586EF905
P 6980 9630
F 0 "#PWR027" H 6980 9380 50  0001 C CNN
F 1 "GND" H 6980 9480 50  0000 C CNN
F 2 "" H 6980 9630 50  0000 C CNN
F 3 "" H 6980 9630 50  0000 C CNN
	1    6980 9630
	1    0    0    -1  
$EndComp
Text Notes 6640 8990 0    28   ~ 0
       Dummy - \n(RC low-pass filter)
$Comp
L POT-RESCUE-Signalgenerator_with_DDS RV4
U 1 1 586EF930
P 2940 8790
F 0 "RV4" H 2940 8690 50  0000 C CNN
F 1 "1k" H 2940 8790 50  0000 C CNN
F 2 "SMD_resistor:trim_bourns_3214w" H 2940 8790 50  0001 C CNN
F 3 "" H 2940 8790 50  0000 C CNN
	1    2940 8790
	0    1    1    0   
$EndComp
Text GLabel 2740 8540 0    39   Input ~ 0
P14.9
$Comp
L GND #PWR028
U 1 1 586EF93A
P 2940 9080
F 0 "#PWR028" H 2940 8830 50  0001 C CNN
F 1 "GND" H 2940 8930 50  0000 C CNN
F 2 "" H 2940 9080 50  0000 C CNN
F 3 "" H 2940 9080 50  0000 C CNN
	1    2940 9080
	1    0    0    -1  
$EndComp
$Comp
L CONN_02X20 P6
U 1 1 586F0E5F
P 11610 8450
F 0 "P6" H 11610 9500 50  0000 C CNN
F 1 "CONN_02X20" V 11610 8450 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x20" H 11610 7500 50  0001 C CNN
F 3 "" H 11610 7500 50  0000 C CNN
	1    11610 8450
	1    0    0    -1  
$EndComp
Text GLabel 11990 8000 2    39   Input ~ 0
P14.9
$Comp
L CONN_01X01 P7
U 1 1 58709A2F
P 12650 2360
F 0 "P7" H 12650 2460 50  0000 C CNN
F 1 "CONN_01X01" V 12750 2360 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 12650 2360 50  0001 C CNN
F 3 "" H 12650 2360 50  0000 C CNN
	1    12650 2360
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4770 2300 4770 2750
Wire Wire Line
	4770 2650 5270 2650
Wire Wire Line
	4770 3050 4770 3150
Wire Wire Line
	4870 1500 4920 1500
Wire Wire Line
	4520 1700 4920 1700
Wire Wire Line
	4520 1250 4520 1800
Wire Wire Line
	4520 1500 4570 1500
Connection ~ 4520 1700
Wire Wire Line
	9790 1980 9790 2130
Wire Wire Line
	9790 2480 9790 2430
Connection ~ 9790 2080
Wire Wire Line
	4920 2300 4770 2300
Connection ~ 4770 2650
Wire Wire Line
	6120 2300 6170 2300
Wire Wire Line
	6170 2300 6170 2400
Wire Wire Line
	6120 2000 6420 2000
Wire Wire Line
	6420 2000 6420 2050
Wire Wire Line
	6420 2400 6420 2350
Wire Wire Line
	6120 1600 6170 1600
Wire Wire Line
	6170 1600 6170 1700
Wire Wire Line
	6120 1500 6720 1500
Wire Wire Line
	6720 1250 6720 1700
Wire Wire Line
	6720 2000 6720 2750
Wire Wire Line
	6720 3050 6720 3150
Wire Wire Line
	5570 2650 7470 2650
Connection ~ 6720 2650
Connection ~ 4520 1500
Wire Wire Line
	9140 2080 10190 2080
Wire Wire Line
	5870 1250 6720 1250
Wire Wire Line
	5270 1250 4520 1250
Wire Notes Line
	3470 1000 7820 1000
Wire Notes Line
	7820 1000 7820 3450
Wire Notes Line
	7820 3450 3470 3450
Wire Notes Line
	3470 3450 3470 1000
Wire Wire Line
	10040 2180 10040 2680
Wire Wire Line
	10040 2580 10540 2580
Wire Wire Line
	10040 2980 10040 3080
Connection ~ 10040 2580
Wire Wire Line
	12190 2980 12190 3080
Wire Wire Line
	10840 2580 12890 2580
Connection ~ 12190 2580
Wire Wire Line
	11390 1480 12190 1480
Wire Wire Line
	12710 1860 12710 1810
Wire Wire Line
	11390 1880 11590 1880
Wire Wire Line
	11590 1880 11590 1930
Wire Wire Line
	9790 1380 10190 1380
Wire Wire Line
	9790 1130 11540 1130
Wire Wire Line
	11540 1130 11540 1380
Wire Wire Line
	11540 1380 11390 1380
Wire Wire Line
	10040 2180 10190 2180
Wire Wire Line
	9790 1130 9790 1680
Wire Wire Line
	12190 1150 12190 1580
Wire Wire Line
	12190 1880 12190 2680
Wire Wire Line
	4520 2100 4520 2250
Wire Wire Line
	4520 2600 4520 2550
Connection ~ 4520 2200
Wire Wire Line
	3820 2200 4920 2200
Wire Notes Line
	8840 1030 13240 1030
Wire Notes Line
	13240 1030 13240 3330
Wire Notes Line
	13240 3330 8840 3330
Wire Notes Line
	8840 3330 8840 1030
Wire Wire Line
	13750 4860 13750 4960
Wire Wire Line
	2060 1890 1960 1890
Wire Wire Line
	2210 1790 2210 1740
Wire Wire Line
	2210 1740 2060 1740
Wire Wire Line
	2360 2940 2260 2940
Wire Wire Line
	2510 2840 2510 2790
Wire Wire Line
	1560 1440 1560 2090
Wire Wire Line
	1660 1890 1560 1890
Connection ~ 1560 1890
Wire Wire Line
	1860 2490 1860 3140
Wire Wire Line
	1960 2940 1860 2940
Connection ~ 1860 2940
Wire Notes Line
	1160 990  1160 3490
Wire Notes Line
	1160 990  2660 990 
Wire Notes Line
	2660 990  2660 3490
Wire Notes Line
	2660 3490 1160 3490
Wire Notes Line
	10470 6860 15900 6860
Wire Wire Line
	4020 2350 4020 2200
Connection ~ 4020 2200
Wire Wire Line
	4020 2650 4020 3150
Wire Wire Line
	9290 2330 9290 2080
Connection ~ 9290 2080
Wire Wire Line
	9290 2630 9290 3080
Wire Wire Line
	11390 2180 11490 2180
Wire Wire Line
	11490 2180 11490 2580
Connection ~ 11490 2580
Wire Wire Line
	13750 5560 13750 5660
Wire Wire Line
	4290 5320 4510 5320
Wire Wire Line
	4290 5420 4510 5420
Wire Wire Line
	4290 5520 4510 5520
Wire Wire Line
	3140 5120 2990 5120
Wire Wire Line
	2990 5120 2990 5020
Wire Wire Line
	2990 5020 2830 5020
Wire Wire Line
	2210 5220 3140 5220
Wire Wire Line
	2210 4720 2210 5220
Wire Wire Line
	1650 5020 2530 5020
Connection ~ 2210 5020
Wire Wire Line
	2700 6410 2700 6600
Wire Wire Line
	2700 6410 2530 6410
Wire Wire Line
	1250 6310 1860 6310
Wire Wire Line
	1250 6100 1250 6510
Wire Wire Line
	1250 6810 1250 6900
Wire Wire Line
	1860 6410 1700 6410
Wire Wire Line
	1700 6410 1700 6310
Connection ~ 1700 6310
Wire Wire Line
	3140 5520 2740 5520
Wire Wire Line
	2740 5520 2740 6310
Wire Wire Line
	2030 5720 2030 5890
Wire Wire Line
	2030 5320 2030 5420
Wire Wire Line
	3140 5320 2030 5320
Wire Wire Line
	3140 5420 2330 5420
Wire Wire Line
	2330 5420 2330 5850
Wire Wire Line
	2330 5850 1650 5850
Connection ~ 2030 5850
Wire Wire Line
	5180 5400 5180 5220
Wire Wire Line
	5180 5220 4290 5220
Wire Wire Line
	1650 5420 1650 5020
Wire Wire Line
	1650 5850 1650 5720
Wire Wire Line
	11780 5710 10920 5710
Connection ~ 1250 6310
Connection ~ 2740 6310
Wire Wire Line
	15430 5460 15430 5860
Connection ~ 15430 5660
Wire Wire Line
	2510 2790 2360 2790
Connection ~ 2360 2790
Wire Wire Line
	2360 2790 2360 2940
Wire Wire Line
	2060 1740 2060 1890
Wire Wire Line
	4290 5120 5180 5120
Wire Wire Line
	5180 5120 5180 5110
Connection ~ 6720 1500
Wire Wire Line
	9790 1580 10190 1580
Connection ~ 9790 1380
Connection ~ 9790 1580
Wire Wire Line
	12710 1210 12710 1150
Wire Wire Line
	12710 1150 12190 1150
Connection ~ 12190 1480
Wire Wire Line
	11590 2230 11590 2580
Connection ~ 11590 2580
Wire Wire Line
	8380 5350 8600 5350
Wire Wire Line
	8380 5450 8600 5450
Wire Wire Line
	8380 5550 8600 5550
Wire Wire Line
	7230 5150 7080 5150
Wire Wire Line
	7080 5150 7080 5050
Wire Wire Line
	7080 5050 6920 5050
Wire Wire Line
	6300 5250 7230 5250
Wire Wire Line
	6300 4750 6300 5250
Wire Wire Line
	5740 5050 6620 5050
Connection ~ 6300 5050
Wire Wire Line
	7230 5550 6830 5550
Wire Wire Line
	6830 5550 6830 6310
Wire Wire Line
	6120 5750 6120 5930
Wire Wire Line
	6120 5350 6120 5450
Wire Wire Line
	7230 5350 6120 5350
Wire Wire Line
	7230 5450 6420 5450
Wire Wire Line
	6420 5450 6420 5880
Wire Wire Line
	9270 5250 8380 5250
Wire Wire Line
	5740 5450 5740 5050
Wire Wire Line
	5740 5880 5740 5750
Wire Wire Line
	8380 5150 9270 5150
Connection ~ 8410 5150
Wire Wire Line
	6420 5880 5740 5880
Connection ~ 6120 5880
Wire Wire Line
	6830 6310 2530 6310
Wire Wire Line
	9270 5250 9270 5300
Wire Wire Line
	11540 5250 11770 5250
Wire Wire Line
	12370 5250 12410 5250
Wire Wire Line
	12410 5250 12410 5710
Wire Wire Line
	12410 5710 12380 5710
Wire Wire Line
	13440 5160 13550 5160
Wire Wire Line
	12740 4740 12710 4740
Wire Wire Line
	12710 4740 12710 4830
Wire Wire Line
	12990 4890 12990 5160
Wire Wire Line
	12990 5160 13140 5160
Wire Wire Line
	13240 4740 13360 4740
Wire Wire Line
	14210 5260 14210 4430
Wire Wire Line
	14210 4430 13920 4430
Wire Wire Line
	13620 4430 13500 4430
Wire Wire Line
	13500 4430 13500 5160
Connection ~ 13500 5160
Wire Wire Line
	12920 5360 13550 5360
Wire Wire Line
	12620 5360 12410 5360
Connection ~ 12410 5360
Connection ~ 14210 5260
Wire Wire Line
	15060 5260 15280 5260
Wire Wire Line
	15120 5430 15120 5260
Connection ~ 15120 5260
Wire Notes Line
	790  7160 9470 7160
Wire Notes Line
	9470 7160 9470 4180
Wire Notes Line
	9470 4180 790  4180
Wire Notes Line
	790  4180 790  7160
Wire Wire Line
	13940 6390 13870 6390
Wire Wire Line
	13570 6390 13480 6390
Wire Wire Line
	12980 6390 12900 6390
Wire Wire Line
	12600 6390 12500 6390
Wire Wire Line
	13230 6240 13230 5360
Connection ~ 13230 5360
Wire Wire Line
	15120 5810 15120 5730
Wire Wire Line
	11110 4970 11540 4970
Wire Wire Line
	11540 4970 11540 5250
Wire Wire Line
	10960 4720 10760 4720
Wire Wire Line
	10960 5220 10960 5260
Wire Notes Line
	10470 4270 15900 4270
Wire Notes Line
	10470 4270 10470 6860
Wire Wire Line
	5730 8680 5730 8780
Wire Notes Line
	2450 10680 7730 10680
Wire Wire Line
	5730 9380 5730 9480
Wire Wire Line
	3760 9530 2900 9530
Wire Wire Line
	7290 9280 7290 9680
Connection ~ 7290 9480
Wire Wire Line
	3520 9070 3750 9070
Wire Wire Line
	4350 9070 4390 9070
Wire Wire Line
	4390 9070 4390 9530
Wire Wire Line
	4390 9530 4360 9530
Wire Wire Line
	5420 8980 5530 8980
Wire Wire Line
	4720 8560 4690 8560
Wire Wire Line
	4690 8560 4690 8650
Wire Wire Line
	4970 8710 4970 8980
Wire Wire Line
	4970 8980 5120 8980
Wire Wire Line
	5220 8560 5340 8560
Wire Wire Line
	6190 9080 6190 8250
Wire Wire Line
	6190 8250 5900 8250
Wire Wire Line
	5600 8250 5480 8250
Wire Wire Line
	5480 8250 5480 8980
Connection ~ 5480 8980
Wire Wire Line
	4900 9180 5530 9180
Wire Wire Line
	4600 9180 4390 9180
Connection ~ 4390 9180
Wire Wire Line
	6130 9080 6290 9080
Connection ~ 6190 9080
Wire Wire Line
	6920 9080 7140 9080
Wire Wire Line
	6980 9250 6980 9080
Connection ~ 6980 9080
Wire Wire Line
	5920 10210 5850 10210
Wire Wire Line
	5550 10210 5460 10210
Wire Wire Line
	4960 10210 4880 10210
Wire Wire Line
	4580 10210 4480 10210
Wire Wire Line
	5210 10060 5210 9180
Connection ~ 5210 9180
Wire Wire Line
	6980 9630 6980 9550
Wire Wire Line
	3090 8790 3520 8790
Wire Wire Line
	3520 8790 3520 9070
Wire Wire Line
	2940 8540 2740 8540
Wire Wire Line
	2940 9040 2940 9080
Wire Notes Line
	2450 8090 7730 8090
Wire Notes Line
	2450 8090 2450 10680
Wire Notes Line
	10880 7280 12400 7280
Wire Notes Line
	12400 7280 12400 9550
Wire Notes Line
	12400 9550 10880 9550
Wire Notes Line
	10880 9550 10880 7280
Wire Wire Line
	11990 7900 11860 7900
Wire Wire Line
	11990 8000 11860 8000
Wire Wire Line
	12010 9000 11860 9000
Wire Wire Line
	12000 9300 11860 9300
Wire Wire Line
	12000 9400 11860 9400
Wire Wire Line
	11230 9200 11360 9200
Wire Wire Line
	11230 9100 11360 9100
Wire Wire Line
	12010 8900 11860 8900
Wire Wire Line
	12650 2560 12650 2580
Connection ~ 12650 2580
$Comp
L CONN_01X01 P3
U 1 1 5870B850
P 7080 2410
F 0 "P3" H 7080 2510 50  0000 C CNN
F 1 "CONN_01X01" V 7180 2410 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 7080 2410 50  0001 C CNN
F 3 "" H 7080 2410 50  0000 C CNN
	1    7080 2410
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7080 2610 7080 2650
Connection ~ 7080 2650
$Comp
L CONN_01X01 P1
U 1 1 5870D5D4
P 3760 2830
F 0 "P1" H 3760 2930 50  0000 C CNN
F 1 "CONN_01X01" V 3860 2830 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 3760 2830 50  0001 C CNN
F 3 "" H 3760 2830 50  0000 C CNN
	1    3760 2830
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3760 3030 3760 3060
Wire Wire Line
	3760 3060 4020 3060
Connection ~ 4020 3060
$Comp
L CONN_01X01 P5
U 1 1 5870EE0E
P 9030 2800
F 0 "P5" H 9030 2900 50  0000 C CNN
F 1 "CONN_01X01" V 9150 2740 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 9030 2800 50  0001 C CNN
F 3 "" H 9030 2800 50  0000 C CNN
	1    9030 2800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9030 3000 9030 3030
Wire Wire Line
	9030 3030 9290 3030
Connection ~ 9290 3030
Text Notes 9130 2840 0    39   ~ 0
GND
Text Notes 3850 2860 0    39   ~ 0
GND
Text Notes 7180 2450 0    39   ~ 0
+12V
Text Notes 12760 2390 0    39   ~ 0
-12V
Wire Wire Line
	12000 7500 11860 7500
$Comp
L R R19
U 1 1 587E80A3
P 14520 5260
F 0 "R19" V 14600 5260 50  0000 C CNN
F 1 "50R" V 14520 5260 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 14450 5260 50  0001 C CNN
F 3 "" H 14520 5260 50  0000 C CNN
	1    14520 5260
	0    1    1    0   
$EndComp
Wire Wire Line
	14150 5260 14370 5260
Wire Wire Line
	14670 5260 14760 5260
Wire Notes Line
	15900 4270 15900 6860
$Comp
L R R18
U 1 1 587ECBB6
P 6440 9080
F 0 "R18" V 6520 9080 50  0000 C CNN
F 1 "50R" V 6440 9080 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 6370 9080 50  0001 C CNN
F 3 "" H 6440 9080 50  0000 C CNN
	1    6440 9080
	0    1    1    0   
$EndComp
Wire Wire Line
	6620 9080 6590 9080
Wire Notes Line
	7730 8090 7730 10680
Text Notes 11100 4800 0    39   ~ 0
Amplitude
Text Notes 2790 8470 0    39   ~ 0
Amplitude
Text GLabel 11210 7500 0    39   Input ~ 0
GND
Wire Wire Line
	11360 7500 11210 7500
$EndSCHEMATC
