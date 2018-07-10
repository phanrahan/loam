from magma import wire, compile, EndCircuit
from loam.boards.icestick import IceStick
from mantle import XOr

icestick = IceStick()
for i in range(2):
    icestick.J1[i].input().on()
icestick.D5.on()

main = icestick.main()

xor2 = XOr(2)
xor2(main.J1[0], main.J1[1])
wire(xor2.O, main.D5)

EndCircuit()
