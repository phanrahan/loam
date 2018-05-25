import magma as m
from loam.shields.megawing import MegaWing

megawing = MegaWing()
megawing.Joystick.init(select=True, up=True, down=True, left=True, right=True).on()
megawing.LED.on(5)

main = megawing.main()

m.wire( main.SELECT, main.LED[0] )
m.wire( main.UP,     main.LED[1] )
m.wire( main.DOWN,   main.LED[2] )
m.wire( main.LEFT,   main.LED[3] )
m.wire( main.RIGHT,  main.LED[4] )



