# build conhex.exe
# (only required if convhex.exe does not yet exist or convhex.c was modified) 
gcc ../../../sw/tools/convhex.c -o ../../../sw/tools/convhex.exe

# create *_quartus.mif file by executing convhex.exe
# (requires a HEX file, generated by the Keil C compiler, located in the directory shown below)   
../../../sw/tools/convhex.exe ../../../keil/blink_led/blink_led.hex

# copy .mif file into ModelSim simulation directory
cp ../../../keil/blink_led/blink_led_quartus.mif ./mc8051_rom_quartus.mif

# copy .mif file into Quartus implementation directory
cp ../../../keil/blink_led/blink_led_quartus.mif ../../impl/mc8051_rom_quartus.mif
