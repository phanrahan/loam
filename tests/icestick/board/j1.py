from magma import wire, EndCircuit
from loam.boards.icestick import IceStick

icestick = IceStick()
icestick.J1[0].input().on()
icestick.J3[0].output().on()

main = icestick.main()

wire( main.J1, main.J3 )

EndCircuit()
