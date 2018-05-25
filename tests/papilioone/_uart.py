import sys
from magma import *
from mantle import *
from loam.boards.papilio import Papilio

papilio = Papilio()
papilio.Clock.on()
papilio.usart.on()

main = papilio.main()

A = array(*int2seq(ord('C'),8))

wire(A, main.TXD)
wire(1, main.TXWRITE)

compile(sys.argv[1], main)
