import sys
from magma import *
from mantle import *
from loam.boards.goboard import GoBoard

goboard = GoBoard()
goboard.Digit0.on()
goboard.Digit1.on()

main = goboard.main()

zero = array(0,0,0,0,0,0,1)

wire( zero, main.Digit0 )
wire( zero, main.Digit1 )

compile(sys.argv[1], main)
