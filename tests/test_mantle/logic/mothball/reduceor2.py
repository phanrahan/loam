from magma import wire, compile, EndCircuit
from mantle import Or
from loam.boards.icestick import IceStick

icestick = IceStick()
for i in range(2):
    icestick.J1[i].input().on()
icestick.D5.on()

main = icestick.main()

or2 = Or(2)
or2(main.J1[0], main.J1[1])
wire(or2.O, main.D5)

EndCircuit()
