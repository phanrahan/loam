from magma import array, wire, compile, EndCircuit
from mantle import ReduceNAnd
from loam.boards.icestick import IceStick

icestick = IceStick()
for i in range(2):
    icestick.J1[i].input().on()
icestick.D5.on()

main = icestick.main()

nand2 = ReduceNAnd(2)
nand2(array([main.J1[0], main.J1[1]]))
wire(nand2.O, main.D5)

EndCircuit()
