import magma as m
from mantle import *
from loam.boards.papilioone import PapilioOne
from loam.shields.megawing import MegaWing

megawing = MegaWing(PapilioOne)
megawing.Clock.on()
megawing.Switch.on(6)
megawing.LED.on(4)

main = megawing.main()
I = main.SWITCH[0:4]
RESET = main.SWITCH[4]
SET = main.SWITCH[5]
O = main.LED

reg = Register(4,r=True,s=True)

m.wire( reg(I, RESET=RESET, SET=SET), O )


