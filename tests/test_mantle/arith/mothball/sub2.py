from magma import array, wire, compile, EndCircuit
from loam.boards.icestick import IceStick, Sub

icestick = IceStick()
icestick.J1[0].rename('A0').input().on()
icestick.J1[1].rename('A1').input().on()
icestick.J1[2].rename('B0').input().on()
icestick.J1[3].rename('B1').input().on()
icestick.D1.on()
icestick.D2.on()

main = icestick.main()
A = array([main.A0, main.A1])
B = array([main.B0, main.B1])
O = array([main.D1, main.D2])

sub = Sub(2)

wire( sub(A, B), O )

EndCircuit()
