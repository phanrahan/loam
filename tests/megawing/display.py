import sys
from magma import *
from mantle import *
from loam.shields.megawing import MegaWing

megawing = MegaWing()
megawing.Clock.on()
megawing.Timer.bits(40).on()
megawing.Display.on()

main = megawing.main()

timer = main.systimer.O
main.display(timer[36:40], timer[32:36], timer[28:32], timer[24:28])

compile(sys.argv[1], main)
