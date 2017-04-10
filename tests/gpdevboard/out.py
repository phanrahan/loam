import sys
from magma import *
from loam.boards.gpdevboard import GPDevBoard

gpdevboard = GPDevBoard()
gpdevboard.PINS[2].rename('PIN2').output().on()

main = gpdevboard.main()

wire( 1, main.PIN2 )

compile(sys.argv[1], main)
