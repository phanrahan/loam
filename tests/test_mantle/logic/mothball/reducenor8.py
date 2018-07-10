from magma import wire, compile, EndCircuit
from mantle import ReduceNOr
from loam.boards.icestick import IceStick

icestick = IceStick()
for i in range(8):
    icestick.J1[i].input().on()
icestick.D5.on()

main = icestick.main()

nor8 = ReduceNOr(8)
nor8(main.J1)
wire(nor8.O, main.D5)

EndCircuit()
