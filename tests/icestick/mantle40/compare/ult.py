from magma import uint, bits, concat, wire, compile, EndCircuit
from mantle import ULT
from loam.boards.icestick import IceStick

icestick = IceStick()
for i in range(4):
    icestick.J1[i].input().on()
icestick.D1.on()

main = icestick.main()
A = uint(concat(main.J1[0:2], bits(0,6)))
B = uint(concat(main.J1[2:4], bits(0,6)))
O = main.D1

ult = ULT(8)
wire( ult(A, B), main.D1 )

EndCircuit()
