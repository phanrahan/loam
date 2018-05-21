from magma import bits, wire, compile, EndCircuit
from mantle import EQ
from loam.boards.icestick import IceStick

icestick = IceStick()
for i in range(2):
    icestick.J1[i].input().on()
icestick.D1.on()

main = icestick.main()

eq2 = EQ(2)
eq2(main.J1,bits([0,1]))
wire(eq2.O, main.D1)

EndCircuit()
