from magma import array, wire, compile, EndCircuit
from loam.boards.icestick import IceStick, Mux

icestick = IceStick()
icestick.J1[0].rename('I0').input().on()
icestick.J1[1].rename('I1').input().on()
icestick.J1[2].rename('S').input().on()
icestick.D1.on()

main = icestick.main()
I = array([main.I0, main.I1])
S = main.S

mux = Mux(2)
mux(I, S)
wire(mux.O, main.D1)

EndCircuit()
