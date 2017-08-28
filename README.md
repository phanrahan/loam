Loam is part of the Magma ecosystem
of python programming tools for FPGAs.

[Magma](https://github.com/phanrahan/magma)
is a programming model for building hardware.
The main abstraction in Magma is a Circuit.
Circuits are created and then wired together.
Magma circuits can be saved as structural verilog files.

[Mantle](https://github.com/phanrahan/mantle)
is a library of useful circuits.
Examples of mantle circuits are logic operators,
arithmetic operators,
comparison operators,
multiplexers,
decoders and encoders,
flip-flops,
registers,
counters,
shift regiseters
and memory.

[Loam](https://github.com/phanrahan/loam) extends Magma
to model FPGAs, Peripherals, Parts and Boards.
A part represents an IC and a board a PCB.
Parts and boards are themselves circuits.
Parts can be wired to other parts,
and boards consist of a collection of parts and headers.
Just like parts, boards can be wired together via their headers.
Loam makes it easy to build applications
on a variety of different FPGA demonstration boards.

FPGAs are a subclass of parts.
Circuits can be created on an FPGAs using Magma.
A special feature of loam are peripherals.
Peripherals make it easy to instantiate hardware drivers on an FPGA
for a part connected to the FPGA.

Loam implementations of boards 
are expected to implement drivers for all the parts on the board.
For example, a Lattice Icestick board
contains an Lattice ice40 FPGA,
an FTDI USART, LEDS, and 3 headers.
The IceStick board contains built-in drivers for the USART and LEDs.
This makes it very easy to build an application running on a particular board.

For example, here is a complete application to blink an LED on the IceStick.
```
from magma import wire, EndDefine
from mantle import Counter
from loam.boards.icestick import IceStick

# Create an instance of an IceStick board
icestick = IceStick()

# Turn on the Clock peripheral
#  The clock is turned on because we are using a synchronous counter
icestick.Clock.on()

# Turn on the LED D5, also a peripheral
icestick.D5.on()

# Define a Magma Circuit on the FPGA on the IceStick
main = icestick.DefineMain()

# Create a 22-bit counter
N = 22
counter = Counter(N)

# Wire bit 21 of the counter to D5.
#  Since the clock frequency is 12Mhz,
#  bit 22 will toggle  approximately once per second
wire(counter.O[N-1], main.D5)

EndDefine()
```

This application is contained in the file `blink.py`.
`blink.py` is compiled to verilog using `magma`.
```
$ magma -b icestick blink.py
```

The verilog (.v) and physical constraint files (.pcf)
can then be compiled to a bitstream file 
using the open source yosys tool chain 
```
$ cd build
$ make
yosys -q -p 'synth_ice40 -top main -blif blink.blif' blink.v
arachne-pnr -q -d 1k -o blink.txt -p blink.pcf blink.blif
icepack blink.txt blink.bin
```

Finally, we upload to the board
using the open source icestorm tools.
```
$ make upload
iceprog blink.bin
...

It is that easy to make an LED blink using an FPGA!

