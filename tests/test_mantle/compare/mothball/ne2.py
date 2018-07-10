from magma import bits, wire, compile, EndCircuit
from mantle import NE
from loam.boards.icestick import IceStick

icestick = IceStick()
for i in range(2):
    icestick.J1[i].input().on()
icestick.D1.on()

main = icestick.main()

ne2 = NE(2)
ne2(main.J1,bits([0,1]))
wire(ne2.O, main.D1)

EndCircuit()
