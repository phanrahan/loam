from magma import wire, compile, EndCircuit
from mantle import Buf
from loam.boards.icestick import IceStick

icestick = IceStick()
icestick.J1[0].rename('I0').input().on()
icestick.D5.on()

main = icestick.main()

buf = Buf()
buf(main.I0)
wire(buf.O, main.D5)

EndCircuit()
