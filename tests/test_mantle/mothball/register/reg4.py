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

reg = Register(4)

reg(I)
m.wire(reg.O, O)



