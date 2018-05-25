import sys
from magma import *
from mantle import *
from loam.boards.papilio import Papilio

papilio = Papilio()
papilio.Clock.on()
papilio.C[0].rename('SWITCH').input().on()
papilio.C[8].rename('LED').output().on()

main = papilio.main()

ff = FF()
ff(main.SWITCH)
wire(ff, main.LED)

compile(sys.argv[1], main)
