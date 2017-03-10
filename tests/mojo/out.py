import sys
from magma import *
from mantle import *
from loam.boards.mojo import Mojo

mojo = Mojo()
mojo.LED1.on()
mojo.LED2.on()

main = mojo.main()

wire( 1, main.LED1 )
wire( 1, main.LED2 )

compile(sys.argv[1], main)
