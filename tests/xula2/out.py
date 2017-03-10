import sys
from magma import *
from mantle import *
from loam.boards.xula2 import Xula2

xula = Xula2()
xula.Pin[0].on()

main = xula.main()

#wire( 1, main.Pin[0] )

compile(sys.argv[1], main)
