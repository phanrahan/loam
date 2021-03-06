from magma import wire, compile, EndCircuit
from loam.boards.icestick import IceStick
from mantle import ReduceNAnd

icestick = IceStick()
for i in range(8):
    icestick.J1[i].input().on()
icestick.D5.on()

main = icestick.main()

nand8 = ReduceNAnd(8)
nand8(main.J1)
wire(nand8.O, main.D5)

EndCircuit()
