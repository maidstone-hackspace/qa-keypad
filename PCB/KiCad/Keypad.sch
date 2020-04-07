EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "WiFi Keypad"
Date "2019-10-16"
Rev "1"
Comp "Maidstone Hackspace"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:WeMos_D1_mini U3
U 1 1 5DA755D0
P 4600 3000
F 0 "U3" H 4600 2111 50  0000 C CNN
F 1 "WeMos_D1_mini" H 4600 2020 50  0000 C CNN
F 2 "Module:WEMOS_D1_mini_light" H 4600 1850 50  0001 C CNN
F 3 "https://wiki.wemos.cc/products:d1:d1_mini#documentation" H 2750 1850 50  0001 C CNN
	1    4600 3000
	1    0    0    -1  
$EndComp
$Comp
L Display_Character:WC1602A DS1
U 1 1 5DA760D7
P 9050 2600
F 0 "DS1" H 9050 3581 50  0000 C CNN
F 1 "WC1602A" H 9050 3490 50  0000 C CNN
F 2 "Display:WC1602A" H 9050 1700 50  0001 C CIN
F 3 "http://www.wincomlcd.com/pdf/WC1602A-SFYLYHTC06.pdf" H 9750 2600 50  0001 C CNN
	1    9050 2600
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x16 I2C-Parallel1
U 1 1 5DA78C47
P 7400 2850
F 0 "I2C-Parallel1" H 7480 2842 50  0000 L CNN
F 1 "Conn_01x16" H 7480 2751 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x16_P2.54mm_Vertical" H 7400 2850 50  0001 C CNN
F 3 "~" H 7400 2850 50  0001 C CNN
	1    7400 2850
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 I2C1
U 1 1 5DA7ADF2
P 6300 2050
F 0 "I2C1" H 6380 2042 50  0000 L CNN
F 1 "Conn_01x04" H 6380 1951 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 6300 2050 50  0001 C CNN
F 3 "~" H 6300 2050 50  0001 C CNN
	1    6300 2050
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR025
U 1 1 5DA8283C
P 9050 3550
F 0 "#PWR025" H 9050 3300 50  0001 C CNN
F 1 "GND" H 9055 3377 50  0000 C CNN
F 2 "" H 9050 3550 50  0001 C CNN
F 3 "" H 9050 3550 50  0001 C CNN
	1    9050 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR024
U 1 1 5DA82EDD
P 6600 1850
F 0 "#PWR024" H 6600 1600 50  0001 C CNN
F 1 "GND" H 6605 1677 50  0000 C CNN
F 2 "" H 6600 1850 50  0001 C CNN
F 3 "" H 6600 1850 50  0001 C CNN
	1    6600 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR018
U 1 1 5DA837C5
P 4100 3800
F 0 "#PWR018" H 4100 3550 50  0001 C CNN
F 1 "GND" H 4105 3627 50  0000 C CNN
F 2 "" H 4100 3800 50  0001 C CNN
F 3 "" H 4100 3800 50  0001 C CNN
	1    4100 3800
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR020
U 1 1 5DA83E8C
P 4700 1900
F 0 "#PWR020" H 4700 1750 50  0001 C CNN
F 1 "+3.3V" H 4715 2073 50  0000 C CNN
F 2 "" H 4700 1900 50  0001 C CNN
F 3 "" H 4700 1900 50  0001 C CNN
	1    4700 1900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR017
U 1 1 5DA8765B
P 1400 1900
F 0 "#PWR017" H 1400 1650 50  0001 C CNN
F 1 "GND" H 1405 1727 50  0000 C CNN
F 2 "" H 1400 1900 50  0001 C CNN
F 3 "" H 1400 1900 50  0001 C CNN
	1    1400 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 1800 1400 1900
Wire Wire Line
	4700 1900 4700 2200
Wire Wire Line
	4600 3800 4100 3800
NoConn ~ 4200 2600
$Comp
L power:+5V #PWR019
U 1 1 5DA8CBB9
P 4500 1900
F 0 "#PWR019" H 4500 1750 50  0001 C CNN
F 1 "+5V" H 4515 2073 50  0000 C CNN
F 2 "" H 4500 1900 50  0001 C CNN
F 3 "" H 4500 1900 50  0001 C CNN
	1    4500 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 1900 4500 2200
$Comp
L power:+5V #PWR023
U 1 1 5DA8FC04
P 6300 1700
F 0 "#PWR023" H 6300 1550 50  0001 C CNN
F 1 "+5V" H 6315 1873 50  0000 C CNN
F 2 "" H 6300 1700 50  0001 C CNN
F 3 "" H 6300 1700 50  0001 C CNN
	1    6300 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 1850 6600 1850
Wire Wire Line
	6300 1850 6300 1700
Text GLabel 5050 2700 2    50   Input ~ 0
SCL
Text GLabel 5050 2800 2    50   Input ~ 0
SDA
Text GLabel 6200 1800 1    50   Input ~ 0
SDA
Text GLabel 6100 1800 1    50   Input ~ 0
SCL
Wire Wire Line
	6100 1800 6100 1850
Wire Wire Line
	6200 1800 6200 1850
Wire Wire Line
	5050 2700 5000 2700
Wire Wire Line
	5050 2800 5000 2800
Wire Wire Line
	9050 3400 9050 3550
$Comp
L New_Library:MT3608 U2
U 1 1 5DA98181
P 2900 4050
F 0 "U2" H 2900 4400 50  0000 C CNN
F 1 "MT3608" H 2900 4300 50  0000 C CNN
F 2 "Keypad:MT3608_module_SMT" H 2900 4050 50  0001 C CNN
F 3 "" H 2900 4050 50  0001 C CNN
	1    2900 4050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR013
U 1 1 5DA9942A
P 3450 3950
F 0 "#PWR013" H 3450 3800 50  0001 C CNN
F 1 "+5V" H 3465 4123 50  0000 C CNN
F 2 "" H 3450 3950 50  0001 C CNN
F 3 "" H 3450 3950 50  0001 C CNN
	1    3450 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5DA9995E
P 3450 4200
F 0 "#PWR014" H 3450 3950 50  0001 C CNN
F 1 "GND" H 3455 4027 50  0000 C CNN
F 2 "" H 3450 4200 50  0001 C CNN
F 3 "" H 3450 4200 50  0001 C CNN
	1    3450 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 4200 3350 4200
Wire Wire Line
	3450 3950 3350 3950
$Comp
L power:GND #PWR02
U 1 1 5DA9B042
P 2350 4200
F 0 "#PWR02" H 2350 3950 50  0001 C CNN
F 1 "GND" H 2355 4027 50  0000 C CNN
F 2 "" H 2350 4200 50  0001 C CNN
F 3 "" H 2350 4200 50  0001 C CNN
	1    2350 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 4200 2450 4200
$Comp
L power:+BATT #PWR07
U 1 1 5DA9CECE
P 2250 1800
F 0 "#PWR07" H 2250 1650 50  0001 C CNN
F 1 "+BATT" H 2265 1973 50  0000 C CNN
F 2 "" H 2250 1800 50  0001 C CNN
F 3 "" H 2250 1800 50  0001 C CNN
	1    2250 1800
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5DA9D69F
P 2250 1900
F 0 "#FLG01" H 2250 1975 50  0001 C CNN
F 1 "PWR_FLAG" H 2250 2073 50  0000 C CNN
F 2 "" H 2250 1900 50  0001 C CNN
F 3 "~" H 2250 1900 50  0001 C CNN
	1    2250 1900
	-1   0    0    1   
$EndComp
Wire Wire Line
	2250 1900 2250 1800
$Comp
L power:-BATT #PWR05
U 1 1 5DA9EFAD
P 1850 1900
F 0 "#PWR05" H 1850 1750 50  0001 C CNN
F 1 "-BATT" H 1865 2073 50  0000 C CNN
F 2 "" H 1850 1900 50  0001 C CNN
F 3 "" H 1850 1900 50  0001 C CNN
	1    1850 1900
	-1   0    0    1   
$EndComp
Wire Wire Line
	1850 1900 1850 1800
$Comp
L New_Library:TP4056 U1
U 1 1 5DAA1132
P 1400 4000
F 0 "U1" H 1425 4315 50  0000 C CNN
F 1 "TP4056" H 1425 4224 50  0000 C CNN
F 2 "Keypad:4056E_LiIon_loader_SMT" H 1400 4000 50  0001 C CNN
F 3 "" H 1400 4000 50  0001 C CNN
	1    1400 4000
	1    0    0    -1  
$EndComp
NoConn ~ 1000 3950
NoConn ~ 1000 4050
$Comp
L power:+BATT #PWR03
U 1 1 5DAA4068
P 1150 4600
F 0 "#PWR03" H 1150 4450 50  0001 C CNN
F 1 "+BATT" H 1165 4773 50  0000 C CNN
F 2 "" H 1150 4600 50  0001 C CNN
F 3 "" H 1150 4600 50  0001 C CNN
	1    1150 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5DAA51A2
P 1900 4200
F 0 "#PWR012" H 1900 3950 50  0001 C CNN
F 1 "GND" H 1905 4027 50  0000 C CNN
F 2 "" H 1900 4200 50  0001 C CNN
F 3 "" H 1900 4200 50  0001 C CNN
	1    1900 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 4050 1900 4050
Wire Wire Line
	1450 4450 1450 4500
Wire Wire Line
	1350 4450 1350 4600
Wire Wire Line
	1350 4600 1150 4600
$Comp
L power:+BATT #PWR08
U 1 1 5DAA9217
P 2650 1800
F 0 "#PWR08" H 2650 1650 50  0001 C CNN
F 1 "+BATT" H 2665 1973 50  0000 C CNN
F 2 "" H 2650 1800 50  0001 C CNN
F 3 "" H 2650 1800 50  0001 C CNN
	1    2650 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5DAB35B3
P 6250 4700
F 0 "R5" H 6320 4746 50  0000 L CNN
F 1 "560k" H 6320 4655 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6180 4700 50  0001 C CNN
F 3 "~" H 6250 4700 50  0001 C CNN
	1    6250 4700
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR027
U 1 1 5DAB40E0
P 6250 4550
F 0 "#PWR027" H 6250 4400 50  0001 C CNN
F 1 "+BATT" H 6265 4723 50  0000 C CNN
F 2 "" H 6250 4550 50  0001 C CNN
F 3 "" H 6250 4550 50  0001 C CNN
	1    6250 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 2500 5050 2500
$Comp
L power:GND #PWR0101
U 1 1 5DADA959
P 7350 1800
F 0 "#PWR0101" H 7350 1550 50  0001 C CNN
F 1 "GND" H 7355 1627 50  0000 C CNN
F 2 "" H 7350 1800 50  0001 C CNN
F 3 "" H 7350 1800 50  0001 C CNN
	1    7350 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 2150 7050 2150
Wire Wire Line
	7050 2150 7050 1800
Wire Wire Line
	7050 1800 7350 1800
Wire Wire Line
	7200 2250 6900 2250
Wire Wire Line
	7200 2350 6900 2350
Wire Wire Line
	7200 2450 6900 2450
Wire Wire Line
	7200 2550 6900 2550
Wire Wire Line
	7200 2650 6900 2650
Wire Wire Line
	7200 2750 6900 2750
Wire Wire Line
	7200 2850 6900 2850
Wire Wire Line
	7200 2950 6900 2950
Wire Wire Line
	7200 3050 6900 3050
Wire Wire Line
	7200 3150 6900 3150
Wire Wire Line
	7200 3250 6900 3250
Wire Wire Line
	7200 3350 6900 3350
Wire Wire Line
	7200 3450 6900 3450
Wire Wire Line
	7200 3550 6900 3550
Wire Wire Line
	7200 3650 6900 3650
Text Label 6900 2250 0    50   ~ 0
LCD2
Text Label 6900 2350 0    50   ~ 0
LCD3
Text Label 6900 2450 0    50   ~ 0
LCD4
Text Label 6900 2550 0    50   ~ 0
LCD5
Text Label 6900 2650 0    50   ~ 0
LCD6
Text Label 6900 2750 0    50   ~ 0
LCD7
Text Label 6900 2850 0    50   ~ 0
LCD8
Text Label 6900 2950 0    50   ~ 0
LCD9
Text Label 6900 3050 0    50   ~ 0
LCD10
Text Label 6900 3150 0    50   ~ 0
LCD11
Text Label 6900 3250 0    50   ~ 0
LCD12
Text Label 6900 3350 0    50   ~ 0
LCD13
Text Label 6900 3450 0    50   ~ 0
LCD14
Text Label 6900 3550 0    50   ~ 0
LCD15
Text Label 6900 3650 0    50   ~ 0
LCD16
Wire Wire Line
	9050 1800 9950 1800
Wire Wire Line
	9450 2000 9950 2000
Wire Wire Line
	9450 2300 9950 2300
Wire Wire Line
	8650 2000 8350 2000
Wire Wire Line
	8650 2100 8350 2100
Wire Wire Line
	8650 2200 8350 2200
Wire Wire Line
	8650 2500 8350 2500
Wire Wire Line
	8650 2600 8350 2600
Wire Wire Line
	8650 2700 8350 2700
Wire Wire Line
	8650 2800 8350 2800
Wire Wire Line
	8650 2900 8350 2900
Wire Wire Line
	8650 3000 8350 3000
Wire Wire Line
	8650 3100 8350 3100
Wire Wire Line
	8650 3200 8350 3200
Entry Wire Line
	6800 2150 6900 2250
Entry Wire Line
	6800 2250 6900 2350
Entry Wire Line
	6800 2350 6900 2450
Entry Wire Line
	6800 2450 6900 2550
Entry Wire Line
	6800 2550 6900 2650
Entry Wire Line
	6800 2650 6900 2750
Entry Wire Line
	6800 2750 6900 2850
Entry Wire Line
	6800 2850 6900 2950
Entry Wire Line
	6800 2950 6900 3050
Entry Wire Line
	6800 3050 6900 3150
Entry Wire Line
	6800 3150 6900 3250
Entry Wire Line
	6800 3250 6900 3350
Entry Wire Line
	6800 3350 6900 3450
Entry Wire Line
	6800 3450 6900 3550
Entry Wire Line
	6800 3550 6900 3650
Entry Wire Line
	8350 2000 8250 1900
Entry Wire Line
	8250 2000 8350 2100
Entry Wire Line
	8250 2100 8350 2200
Entry Wire Line
	8250 2400 8350 2500
Entry Wire Line
	8250 2500 8350 2600
Entry Wire Line
	8250 2600 8350 2700
Entry Wire Line
	8250 2700 8350 2800
Entry Wire Line
	8250 2800 8350 2900
Entry Wire Line
	8250 2900 8350 3000
Entry Wire Line
	8250 3000 8350 3100
Entry Wire Line
	8250 3100 8350 3200
Entry Wire Line
	9950 1800 10050 1900
Entry Wire Line
	9950 2000 10050 2100
Entry Wire Line
	9950 2300 10050 2400
Entry Wire Line
	9950 2400 10050 2500
Wire Bus Line
	8250 3850 10050 3850
Text Label 9450 3850 0    50   ~ 0
LCD[2..16]
Text Label 9750 1800 0    50   ~ 0
LCD2
Text Label 9750 2000 0    50   ~ 0
LCD3
Text Label 9750 2300 0    50   ~ 0
LCD15
Text Label 8350 2500 0    50   ~ 0
LCD7
Text Label 8350 2600 0    50   ~ 0
LCD8
Text Label 8350 2700 0    50   ~ 0
LCD9
Text Label 8350 2800 0    50   ~ 0
LCD10
Text Label 8350 2900 0    50   ~ 0
LCD11
Text Label 8350 3000 0    50   ~ 0
LCD12
Text Label 8350 3100 0    50   ~ 0
LCD13
Text Label 8350 3200 0    50   ~ 0
LCD14
Text Label 8350 2200 0    50   ~ 0
LCD4
Text Label 8350 2100 0    50   ~ 0
LCD5
Text Label 8350 2000 0    50   ~ 0
LCD6
Wire Bus Line
	6800 1650 8250 1650
$Comp
L power:-BATT #PWR06
U 1 1 5DAA4992
P 1450 4500
F 0 "#PWR06" H 1450 4350 50  0001 C CNN
F 1 "-BATT" H 1465 4673 50  0000 C CNN
F 2 "" H 1450 4500 50  0001 C CNN
F 3 "" H 1450 4500 50  0001 C CNN
	1    1450 4500
	-1   0    0    1   
$EndComp
$Comp
L power:-BATT #PWR09
U 1 1 5DAA92DD
P 2650 2100
F 0 "#PWR09" H 2650 1950 50  0001 C CNN
F 1 "-BATT" H 2665 2273 50  0000 C CNN
F 2 "" H 2650 2100 50  0001 C CNN
F 3 "" H 2650 2100 50  0001 C CNN
	1    2650 2100
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5DA7DE58
P 1850 1800
F 0 "#FLG0101" H 1850 1875 50  0001 C CNN
F 1 "PWR_FLAG" H 1850 1973 50  0000 C CNN
F 2 "" H 1850 1800 50  0001 C CNN
F 3 "~" H 1850 1800 50  0001 C CNN
	1    1850 1800
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5DA7ECFF
P 1400 1800
F 0 "#FLG0102" H 1400 1875 50  0001 C CNN
F 1 "PWR_FLAG" H 1400 1973 50  0000 C CNN
F 2 "" H 1400 1800 50  0001 C CNN
F 3 "~" H 1400 1800 50  0001 C CNN
	1    1400 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 6700 4900 6850
Wire Wire Line
	4900 6350 4900 6400
Wire Wire Line
	4900 6000 4900 6050
Wire Wire Line
	4250 6350 4250 6400
Wire Wire Line
	4250 6000 4250 6050
Wire Wire Line
	3550 6350 3550 6400
$Comp
L power:GND #PWR022
U 1 1 5DA81DF5
P 4900 6850
F 0 "#PWR022" H 4900 6600 50  0001 C CNN
F 1 "GND" H 4905 6677 50  0000 C CNN
F 2 "" H 4900 6850 50  0001 C CNN
F 3 "" H 4900 6850 50  0001 C CNN
	1    4900 6850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5DA80DB0
P 4900 6200
F 0 "R3" H 4970 6246 50  0000 L CNN
F 1 "100" H 4970 6155 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4830 6200 50  0001 C CNN
F 3 "~" H 4900 6200 50  0001 C CNN
	1    4900 6200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5DA80348
P 4250 6200
F 0 "R2" H 4320 6246 50  0000 L CNN
F 1 "120" H 4320 6155 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4180 6200 50  0001 C CNN
F 3 "~" H 4250 6200 50  0001 C CNN
	1    4250 6200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5DA7E276
P 3550 6200
F 0 "R1" H 3620 6246 50  0000 L CNN
F 1 "150" H 3620 6155 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3480 6200 50  0001 C CNN
F 3 "~" H 3550 6200 50  0001 C CNN
	1    3550 6200
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D3
U 1 1 5DA7D535
P 4900 6550
F 0 "D3" V 4939 6433 50  0000 R CNN
F 1 "LED (Green)" V 4848 6433 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 4900 6550 50  0001 C CNN
F 3 "~" H 4900 6550 50  0001 C CNN
	1    4900 6550
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D2
U 1 1 5DA7C7A7
P 4250 6550
F 0 "D2" V 4289 6433 50  0000 R CNN
F 1 "LED (Yellow)" V 4198 6433 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 4250 6550 50  0001 C CNN
F 3 "~" H 4250 6550 50  0001 C CNN
	1    4250 6550
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D1
U 1 1 5DA7BF9E
P 3550 6550
F 0 "D1" V 3589 6433 50  0000 R CNN
F 1 "LED (Red)" V 3498 6433 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 3550 6550 50  0001 C CNN
F 3 "~" H 3550 6550 50  0001 C CNN
	1    3550 6550
	0    -1   -1   0   
$EndComp
$Comp
L Device:Battery_Cell BT1
U 1 1 5DAA4FA2
P 2650 2000
F 0 "BT1" H 2768 2096 50  0000 L CNN
F 1 "3.7V LiPo Battery" H 2768 2005 50  0000 L CNN
F 2 "Connector_JST:JST_XH_B2B-XH-A_1x02_P2.50mm_Vertical" V 2650 2060 50  0001 C CNN
F 3 "~" V 2650 2060 50  0001 C CNN
	1    2650 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 4050 1900 4200
Wire Wire Line
	8750 4500 9000 4500
Wire Wire Line
	9000 4500 9000 4450
Wire Wire Line
	9050 4500 9300 4500
Text Label 8750 4500 0    50   ~ 0
LCD15
Text Label 9050 4500 0    50   ~ 0
LCD16
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 5DADB687
P 9000 4450
F 0 "#FLG0103" H 9000 4525 50  0001 C CNN
F 1 "PWR_FLAG" H 9000 4623 50  0000 C CNN
F 2 "" H 9000 4450 50  0001 C CNN
F 3 "~" H 9000 4450 50  0001 C CNN
	1    9000 4450
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0104
U 1 1 5DADBA5E
P 9300 4500
F 0 "#FLG0104" H 9300 4575 50  0001 C CNN
F 1 "PWR_FLAG" H 9100 4650 50  0000 L CNN
F 2 "" H 9300 4500 50  0001 C CNN
F 3 "~" H 9300 4500 50  0001 C CNN
	1    9300 4500
	-1   0    0    1   
$EndComp
Wire Wire Line
	9750 2400 9950 2400
$Comp
L Device:R R4
U 1 1 5DAE7C73
P 9600 2400
F 0 "R4" V 9800 2400 50  0000 C CNN
F 1 "100" V 9700 2400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9530 2400 50  0001 C CNN
F 3 "~" H 9600 2400 50  0001 C CNN
	1    9600 2400
	0    1    1    0   
$EndComp
Text Label 9750 2400 0    50   ~ 0
LCD16
Text Label 8400 4500 0    50   ~ 0
LCD2
$Comp
L power:PWR_FLAG #FLG0105
U 1 1 5DAEAD74
P 8650 4450
F 0 "#FLG0105" H 8650 4525 50  0001 C CNN
F 1 "PWR_FLAG" H 8650 4623 50  0000 C CNN
F 2 "" H 8650 4450 50  0001 C CNN
F 3 "~" H 8650 4450 50  0001 C CNN
	1    8650 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 4500 8650 4500
Wire Wire Line
	8650 4500 8650 4450
Wire Wire Line
	9450 2400 9450 2700
Connection ~ 9450 2400
$Comp
L power:PWR_FLAG #FLG0106
U 1 1 5DAF1F0C
P 9450 2700
F 0 "#FLG0106" H 9450 2775 50  0001 C CNN
F 1 "PWR_FLAG" H 9450 2873 50  0001 C CNN
F 2 "" H 9450 2700 50  0001 C CNN
F 3 "~" H 9450 2700 50  0001 C CNN
	1    9450 2700
	-1   0    0    1   
$EndComp
Wire Wire Line
	2400 3850 2400 3950
$Comp
L power:PWR_FLAG #FLG0107
U 1 1 5DAFD303
P 2400 3850
F 0 "#FLG0107" H 2400 3925 50  0001 C CNN
F 1 "PWR_FLAG" H 2400 4023 50  0001 C CNN
F 2 "" H 2400 3850 50  0001 C CNN
F 3 "~" H 2400 3850 50  0001 C CNN
	1    2400 3850
	1    0    0    -1  
$EndComp
Text Label 1850 3950 0    50   ~ 0
V+1
Text Label 2450 3850 0    50   ~ 0
V+2
Text Label 1450 4500 0    50   ~ 0
Batt-
Wire Notes Line
	5900 1400 8100 1400
Wire Notes Line
	8100 3750 5900 3750
Text Notes 6550 1350 0    50   ~ 0
I2C -> 16x2 LCD adaptor
NoConn ~ 5000 2600
NoConn ~ 5000 2900
NoConn ~ 5000 3000
$Comp
L power:GND #PWR04
U 1 1 5E265BD9
P 4250 6850
F 0 "#PWR04" H 4250 6600 50  0001 C CNN
F 1 "GND" H 4255 6677 50  0000 C CNN
F 2 "" H 4250 6850 50  0001 C CNN
F 3 "" H 4250 6850 50  0001 C CNN
	1    4250 6850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5E26657C
P 3550 6850
F 0 "#PWR01" H 3550 6600 50  0001 C CNN
F 1 "GND" H 3555 6677 50  0000 C CNN
F 2 "" H 3550 6850 50  0001 C CNN
F 3 "" H 3550 6850 50  0001 C CNN
	1    3550 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 6850 3550 6700
Wire Wire Line
	4250 6850 4250 6700
Text GLabel 5050 3200 2    50   Input ~ 0
red
Text GLabel 5050 3400 2    50   Input ~ 0
green
Text GLabel 5050 3300 2    50   Input ~ 0
yellow
Wire Wire Line
	5000 3200 5050 3200
Wire Wire Line
	5000 3300 5050 3300
Wire Wire Line
	5000 3400 5050 3400
Text GLabel 3550 6000 1    50   Input ~ 0
red
Text GLabel 4250 6000 1    50   Input ~ 0
yellow
Wire Wire Line
	3550 6050 3550 6000
NoConn ~ 4200 3000
NoConn ~ 4200 2900
NoConn ~ 5000 3100
Text GLabel 7750 4950 2    50   Input ~ 0
SDA
Text GLabel 7750 4850 2    50   Input ~ 0
SCL
Text GLabel 5050 2500 2    50   Input ~ 0
keypad
Text GLabel 9250 5050 0    50   Input ~ 0
keypad
Wire Wire Line
	9250 5150 8800 5150
$Comp
L power:+3.3V #PWR015
U 1 1 5E299566
P 9250 5250
F 0 "#PWR015" H 9250 5100 50  0001 C CNN
F 1 "+3.3V" V 9265 5378 50  0000 L CNN
F 2 "" H 9250 5250 50  0001 C CNN
F 3 "" H 9250 5250 50  0001 C CNN
	1    9250 5250
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5E298E1A
P 8800 5150
F 0 "#PWR010" H 8800 4900 50  0001 C CNN
F 1 "GND" H 8805 4977 50  0000 C CNN
F 2 "" H 8800 5150 50  0001 C CNN
F 3 "" H 8800 5150 50  0001 C CNN
	1    8800 5150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5E2989CB
P 6750 5050
F 0 "#PWR011" H 6750 4800 50  0001 C CNN
F 1 "GND" H 6755 4877 50  0000 C CNN
F 2 "" H 6750 5050 50  0001 C CNN
F 3 "" H 6750 5050 50  0001 C CNN
	1    6750 5050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR021
U 1 1 5E297E2A
P 7250 5350
F 0 "#PWR021" H 7250 5100 50  0001 C CNN
F 1 "GND" H 7255 5177 50  0000 C CNN
F 2 "" H 7250 5350 50  0001 C CNN
F 3 "" H 7250 5350 50  0001 C CNN
	1    7250 5350
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR016
U 1 1 5E2979B0
P 7250 4550
F 0 "#PWR016" H 7250 4400 50  0001 C CNN
F 1 "+3.3V" H 7265 4723 50  0000 C CNN
F 2 "" H 7250 4550 50  0001 C CNN
F 3 "" H 7250 4550 50  0001 C CNN
	1    7250 4550
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 Keypad1
U 1 1 5E28E90C
P 9450 5150
F 0 "Keypad1" H 9530 5192 50  0000 L CNN
F 1 "Conn_01x03" H 9530 5101 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 9450 5150 50  0001 C CNN
F 3 "~" H 9450 5150 50  0001 C CNN
	1    9450 5150
	1    0    0    -1  
$EndComp
$Comp
L Analog_ADC:MCP3421A0T-ECH U4
U 1 1 5E28D151
P 7250 4950
F 0 "U4" H 6800 5400 50  0000 C CNN
F 1 "MCP3421A0T-ECH" H 6800 5300 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6_Handsoldering" H 7250 4950 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22003e.pdf" H 7250 4950 50  0001 C CNN
	1    7250 4950
	1    0    0    -1  
$EndComp
Text GLabel 4900 6000 1    50   Input ~ 0
green
Wire Notes Line
	5900 6000 8100 6000
Wire Notes Line
	8100 1400 8100 6000
Wire Notes Line
	5900 1400 5900 6000
Text Notes 7650 6150 2    50   ~ 0
Analog -> Digital I2C Converter
Wire Notes Line
	5550 5550 5550 7200
Wire Notes Line
	5550 7200 3300 7200
Wire Notes Line
	3300 7200 3300 5550
Wire Notes Line
	3300 5550 5550 5550
Text Notes 4750 5450 2    50   ~ 0
LED Icons (Optional)
Wire Notes Line
	850  3450 3700 3450
Wire Notes Line
	3700 5200 850  5200
Text Notes 3000 3350 2    50   ~ 0
Power Conversion / Battery Management
$Comp
L Switch:SW_DIP_x01 SW1
U 1 1 5E2CD9B2
P 2150 3950
F 0 "SW1" H 2150 4217 50  0000 C CNN
F 1 "SW_DIP_x01" H 2150 4126 50  0000 C CNN
F 2 "Keypad:Mini_Latching_Torch_Switch" H 2150 3950 50  0001 C CNN
F 3 "~" H 2150 3950 50  0001 C CNN
	1    2150 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5E30D5DC
P 6250 5000
F 0 "R6" H 6320 5046 50  0000 L CNN
F 1 "500K" H 6320 4955 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6180 5000 50  0001 C CNN
F 3 "~" H 6250 5000 50  0001 C CNN
	1    6250 5000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR026
U 1 1 5E30E0FE
P 6250 5150
F 0 "#PWR026" H 6250 4900 50  0001 C CNN
F 1 "GND" H 6255 4977 50  0000 C CNN
F 2 "" H 6250 5150 50  0001 C CNN
F 3 "" H 6250 5150 50  0001 C CNN
	1    6250 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 4850 6750 4850
Connection ~ 6250 4850
$Comp
L Device:CP C1
U 1 1 5E8CFD92
P 2900 4750
F 0 "C1" H 3018 4796 50  0000 L CNN
F 1 "100u" H 3018 4705 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 2938 4600 50  0001 C CNN
F 3 "~" H 2900 4750 50  0001 C CNN
	1    2900 4750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR028
U 1 1 5E8D2138
P 2900 4600
F 0 "#PWR028" H 2900 4450 50  0001 C CNN
F 1 "+5V" H 2915 4773 50  0000 C CNN
F 2 "" H 2900 4600 50  0001 C CNN
F 3 "" H 2900 4600 50  0001 C CNN
	1    2900 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR029
U 1 1 5E8D425B
P 2900 4900
F 0 "#PWR029" H 2900 4650 50  0001 C CNN
F 1 "GND" H 2905 4727 50  0000 C CNN
F 2 "" H 2900 4900 50  0001 C CNN
F 3 "" H 2900 4900 50  0001 C CNN
	1    2900 4900
	1    0    0    -1  
$EndComp
Wire Notes Line
	3700 5200 3700 3450
Wire Notes Line
	850  3450 850  5200
Wire Bus Line
	10050 1900 10050 3850
Wire Bus Line
	6800 1650 6800 3550
Wire Bus Line
	8250 1650 8250 3850
$EndSCHEMATC
