from magma import bit, wire, compile, EndCircuit
from mantle import NE
from loam.boards.icestick import IceStick

icestick = IceStick()
icestick.J1[0].rename('I').input().on()
icestick.D1.on()

main = icestick.main()

ne1 = NE(1)
ne1(main.I,bit(1))
wire(ne1.O, main.D1)

EndCircuit()
