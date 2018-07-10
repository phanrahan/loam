import sys
from magma import *
from mantle import *
from loam.boards.papilio import Papilio

papilio = Papilio()
papilio.Clock.on()
papilio.Timer.on()
papilio.C[8].rename('LED').output().on()

main = papilio.main()

wire( main.systimer.O[24], main.LED )

compile(sys.argv[1], main)

