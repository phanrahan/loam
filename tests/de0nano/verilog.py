import sys
from magma import *
from loam.boards.de0nano import DE0Nano

nano = DE0Nano()
nano.B1.on()
nano.B2.on()
nano.D1.on()

main = nano.main()

Add = DefineCircuit('Add', 'input A', Bit, 'input B', Bit, 'output C', Bit)
Add.verilog = 'C = A ^ B;'
EndCircuit()

add = Add()
add(main.B1, main.B2)
wire(add.C, main.D1)

compile(sys.argv[1], main)

