import sys
from magma import *
from mantle import *
from loam.boards.papilio import Papilio

papilio = Papilio()
papilio.C[8].rename('LED0').output().on()
papilio.C[9].rename('LED1').output().on()

main = papilio.main()

wire( 1, main.LED0 )
wire( 1, main.LED1 )

compile(sys.argv[1], main)
