import sys
from magma import *
from mantle import *
from loam.shields.megawing import MegaWing

megawing = MegaWing()
megawing.LED.on(2)

main = megawing.main()

wire(1, main.LED[0])
wire(1, main.LED[1])

compile(sys.argv[1], main)


