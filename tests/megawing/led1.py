import sys
from magma import *
from mantle import *
from loam.shields.megawing import MegaWing

megawing = MegaWing()
megawing.LED.on(1)

main = megawing.main()

wire(1, main.LED[0])

compile(sys.argv[1], main)


