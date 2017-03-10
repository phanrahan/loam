import sys
from magma import *
from mantle import *
from loam.shields.megawing import MegaWing

megawing = MegaWing()
megawing.Switch.on(8)
megawing.LED.on(8)

main = megawing.main()

wire(main.SWITCH, main.LED)

compile(sys.argv[1], main)


