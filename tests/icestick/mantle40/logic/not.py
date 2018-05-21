from magma import wire, EndCircuit
from mantle import Not
from loam.boards.icestick import IceStick

icestick = IceStick()
icestick.J1[0].rename('I0').input().on()
icestick.D5.on()

main = icestick.main()

n = Not()
n(main.I0)
wire(n.O, main.D5)

EndCircuit()
