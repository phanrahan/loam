from magma import sint, bits, concat, wire, compile, EndCircuit
from mantle import SLT
from loam.boards.icestick import IceStick

icestick = IceStick()
for i in range(4):
    icestick.J1[i].input().on()
icestick.D1.on()

main = icestick.main()
A = sint(concat(main.J1[0:2], bits(0,6)))
B = sint(concat(main.J1[2:4], bits(0,6)))
O = main.D1

slt = SLT(8)
wire( slt(A, B), main.D1 )

EndCircuit()
