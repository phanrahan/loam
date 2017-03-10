import sys
from magma import *
from mantle import *
from loam.boards.de0nano import DE0Nano

nano = DE0Nano()
nano.B1.on()
nano.B2.on()
nano.D1.on()

main = nano.main()

lut4 = LUT4()
lut4(main.B1, main.B2, main.B1, main.B2)
wire(lut4.O, main.D1)

compile(sys.argv[1], main)

