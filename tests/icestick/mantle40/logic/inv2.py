from magma import wire, compile, EndCircuit
from mantle import Invert
from loam.boards.icestick import IceStick

icestick = IceStick()
for i in range(2):
    icestick.J1[i].input().on()
for i in range(2):
    icestick.J3[i].output().on()

main = icestick.main()

inv = Invert(2)
wire( inv(main.J1), main.J3 )

EndCircuit()
