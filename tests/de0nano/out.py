import sys
from magma import *
from loam.boards.de0nano import DE0Nano

nano = DE0Nano()
nano.D1.on()

main = nano.main()

wire(1, main.D1)

compile(sys.argv[1], main)

