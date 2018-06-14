import magma as m
from mantle import *
from loam.boards.papilioone import PapilioOne
from loam.shields.megawing import MegaWing

megawing = MegaWing(PapilioOne)
megawing.Clock.on()
megawing.Switch.on(5)
megawing.LED.on(4)

main = megawing.main()
I = main.SWITCH[0:4]
SET = main.SWITCH[4]
O = main.LED

reg = Register(4,s=True)

m.wire( reg(I, SET=SET), O )


