from magma import wire, compile, EndCircuit
from loam.boards.icestick import IceStick, Decode

icestick = IceStick()
for i in range(4):
    icestick.J1[i].input().on()
icestick.D1.on()

main = icestick.main()

three = Decode(3,4)

wire( three(main.J1), main.D1 )

EndCircuit()
