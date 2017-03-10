import sys
from magma import *
from mantle import *
from loam.shields.megawing import MegaWing

megawing = MegaWing()
megawing.LED.on(2)

main = megawing.main()

wire(HIGH,main.LED[0])
wire(LOW, main.LED[1])

compile(sys.argv[1], main)

