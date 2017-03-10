import sys
from magma import *
from mantle import *
from loam.boards.mojo import Mojo

mojo = Mojo()
mojo.Clock.on()
mojo.LED1.on()

main = mojo.main()

N = 32

counter = Counter( N )

count = counter()

wire( count[24], main.LED1 )

compile(sys.argv[1], main)
 
