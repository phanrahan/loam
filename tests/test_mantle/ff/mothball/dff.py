from magma import wire, compile, EndCircuit
from loam.boards.icestick import IceStick, FF

icestick = IceStick()
icestick.Clock.on()
icestick.J1[0].rename('SWITCH').input().on()
icestick.D1.on()

main = icestick.main()

ff = FF()
ff(main.SWITCH)
wire(ff, main.D1)

EndCircuit()
