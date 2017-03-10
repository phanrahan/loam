# 1 Khz signal
import sys
from magma import *
from mantle import *
from loam.shields.megawing import MegaWing

N = 8

megawing = MegaWing()
megawing.Clock.on()
megawing.Audio.on()

main = megawing.main()

counter = Counter(32).O

wire( counter[16], main.AUDIO )

compile(sys.argv[1], main)
