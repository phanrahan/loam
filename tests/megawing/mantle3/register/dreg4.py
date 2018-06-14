import magma as m
from mantle import *
from loam.boards.papilioone import PapilioOne
from loam.shields.megawing import MegaWing

megawing = MegaWing(PapilioOne)
megawing.Clock.on()
megawing.Switch.on(4)
megawing.LED.on(4)

main = megawing.main()
I = main.SWITCH
O = main.LED

Register4 = DefineRegister(4)
#print(Register4, Register4.IO)

reg = Register4()

reg(I)
m.wire(reg.O, O)



