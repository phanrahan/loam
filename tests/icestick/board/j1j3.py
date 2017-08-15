import sys
from magma import wire, compile
from loam.boards.icestick import IceStick

icestick = IceStick()
for i in range(8):
    icestick.J1[i].input().on()
    icestick.J3[i].output().on()

main = icestick.main()

wire( main.J1, main.J3 )

compile(sys.argv[1], main)
