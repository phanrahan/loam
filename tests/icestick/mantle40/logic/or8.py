from magma import wire, compile, EndCircuit
from loam.boards.icestick import IceStick, ReduceOr

icestick = IceStick()
for i in range(8):
    icestick.J1[i].input().on()
icestick.D5.on()

main = icestick.main()

or8 = ReduceOr(8)
or8(main.J1)
wire(or8.O, main.D5)

EndCircuit()
