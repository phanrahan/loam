import sys
from magma import *
from loam.boards.gpdevboard import GPDevBoard

gpdevboard = GPDevBoard()
gpdevboard.PINS[2].rename('PIN2').output().on()
gpdevboard.PINS[3].rename('PIN3').input().on()

main = gpdevboard.main()

wire( main.PIN3, main.PIN2 )

compile(sys.argv[1], main)
