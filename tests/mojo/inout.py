import sys
from magma import *
from mantle import *
from loam.boards.mojo import Mojo

mojo = Mojo()
mojo.LED1.on()
mojo.RST_N.on()

main = mojo.main()

wire( main.RST_N, main.LED1 )

compile(sys.argv[1], main)
