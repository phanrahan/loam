from magma import bit, wire, compile, EndCircuit
from mantle import EQ
from loam.boards.icestick import IceStick

icestick = IceStick()
icestick.J1[0].rename('I').input().on()
icestick.D1.on()

main = icestick.main()

eq1 = EQ(1)
eq1(main.I,bit(1))
wire(eq1.O, main.D1)

EndCircuit()
