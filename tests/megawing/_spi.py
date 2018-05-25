import sys
from magma import *
from mantle import *
from loam.shields.megawing import MegaWing

megawing = MegaWing()
megawing.Switch.on(3)
megawing.LED.on(1)
megawing.SPI.on()

main = megawing.main()

wire( main.SWITCH[0], main.CS )
wire( main.SWITCH[1], main.MOSI )
wire( main.SWITCH[2], main.SCLK )
wire( main.MISO, main.LED[0] )

compile(sys.argv[1], main)
