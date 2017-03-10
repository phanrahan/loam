import sys
from magma import *
from mantle import *
from loam.shields.megawing import MegaWing

megawing = MegaWing()
megawing.Joystick.init(select=True, up=True, down=True, left=True, right=True).on()
megawing.LED.on(5)


main = megawing.main()

wire( main.SELECT, main.LED[0] )
wire( main.UP,     main.LED[1] )
wire( main.DOWN,   main.LED[2] )
wire( main.LEFT,   main.LED[3] )
wire( main.RIGHT,  main.LED[4] )

compile(sys.argv[1], main)


