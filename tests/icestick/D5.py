import sys
from magma import *
from mantle import *
from loam.boards.icestick import IceStick

icestick = IceStick()
icestick.D5.on()

main = icestick.main()

wire( 1, main.D5 )

compile(sys.argv[1], main)

