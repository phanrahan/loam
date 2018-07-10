from magma import array, wire, compile, EndCircuit
from loam.boards.icestick import IceStick, Add

icestick = IceStick()
icestick.Clock.on()
icestick.J1[0].rename('A0').input().on()
icestick.J1[1].rename('B0').input().on()
icestick.D1.on()

main = icestick.main()
A = array([main.A0])
B = array([main.B0])
O = array([main.D1])

add = Add(1)

wire( add(A, B), O )

EndCircuit()
