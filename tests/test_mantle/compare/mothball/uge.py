from magma import uint, bits, concat, wire, compile, EndCircuit
from mantle import UGE
from loam.boards.icestick import IceStick

icestick = IceStick()
for i in range(4):
    icestick.J1[i].input().on()
icestick.D1.on()

main = icestick.main()
A = uint(concat(main.J1[0:2], bits(0,6)))
B = uint(concat(main.J1[2:4], bits(0,6)))
O = main.D1

uge = UGE(8)
wire( uge(A, B), main.D1 )

EndCircuit()
