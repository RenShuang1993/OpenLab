vj-uart
=======

Virtual JTAG UART for Altera Devices

Altera's Cyclone devices contain a couple of special JTAG instructions that
allow data to be passed to a "Virtual VJTAG" adapter coded into your design.

This project provides a "Virtual UART" allowing information to be easily
exchanged between a PC and the design inside the Altera chip.  This is
particularly handy for devices like the excellent Terasic DE0-Nano, that
only have one USB connection for the built-in USB Blaster and no other
built-in UART.

The performance on this interface is the equivalent of about 1600 bps (measured 1294 bps/162 cps actual) and is limited by the USB blaster speed and the protocol.

The sample TCL script connects to the first USB Blaster device through the
Quartus STP application and listens on a TCP connection.

QUICK START:
<pre>
1. Build the bitstream using Altera Quartus II
2. Upload the bitstream to your device.  Use Quartus II programmer or urJTag:
	jtag vjuart.svf
3. Run the TCL script:
	./vjuart.tcl (for linux) or
	quartus_stp -t vjuart.tcl (for windows)
4. Telnet to the listening port:
	telnet localhost 2323
</pre>
If all went well, the screen should show you the alphabet, A through Z and
every character you type will be echoed back to you.
  
Credit for the inspritation to develop this code must go to Chris Zeh and
his Idle Logic blog;
http://idle-logic.com/2012/04/15/talking-to-the-de0-nano-using-the-virtual-jtag-interface

This file is part of the Virtual JTAG UART toolkit
