Loam is part of the Magma ecosystem.

Magma is a programming model for building hardware.
The key abstractions in Magma is a Circuit.
Circuits are created and then wired together.

Mantle is a library of useful circuits.
Examples of mantle circuits are logic operators,
arithmetic operators,
comparison operators,
multiplexers,
decoders and encoders,
registers,
counters,
shift regiseters
and memory.

Loam extends Magma to model parts and boards.
A part represents an IC and a board a PCB.
Parts and boards are themselves circuits.
Parts can be wired to other parts,
and boards consist of a collection of parts and headers.

FPGAs are a subclass of parts.
Circuits can be created on an FPGAs using Magma.

A special feature of loam is peripherals.
Peripherals make it easy to build drivers for parts connected to an FPGA.

This makes it very easy to build an application running on
a particular board.
For example, here is a simple application to blink an LED on the IceStick
(in the file `blink.py`).
```
from magma import wire, EndDefine
from loam.boards.icestick import IceStick, Counter

# Create an instance of an IceStick board
icestick = IceStick()

# Turn on the Clock - the default clock runs at 12Mhz
#  The clock is turned on because we are using a synchronous counter
icestick.Clock.on()

# Turn on the LED D5
icestick.D5.on()

# Define a Magma Circuit on the icestick
#  Since this board contains a single FPGA, define the circuit on that FPGA
main = icestick.DefineMain()

# Create a 22-bit counter
N = 22
counter = Counter(N)

# Wire bit 22 to D5, bit 22 changes approximately once per second
wire(counter.O[N-1], main.D5)

EndDefine()
```
In this example, `Clock` and `D5` are peripherals.
To use a peripheral, you turn it on.

This application is compiled to verilog using `magma`.
```
$ magma -b icestick blink.py
```
and compiled to bits using the open source yosys tool chain 
```
$ cd build
$ make
yosys -q -p 'synth_ice40 -top main -blif blink.blif' blink.v
arachne-pnr -q -d 1k -o blink.txt -p blink.pcf blink.blif
icepack blink.txt blink.bin
$ make upload
iceprog blink.bin
...
```
