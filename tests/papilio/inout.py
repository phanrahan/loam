import sys
from magma import *
from mantle import *
from loam.boards.papilio import Papilio

papilio = Papilio()
papilio.C[0].rename('SWITCH0').input().on()
papilio.C[1].rename('SWITCH1').input().on()
papilio.C[8].rename('LED0').output().on()
papilio.C[9].rename('LED1').output().on()

main = papilio.main()

wire( main.SWITCH0, main.LED0 )
wire( main.SWITCH1, main.LED1 )

compile(sys.argv[1], main)
