import magma as m
from mantle import *
from loam.boards.papilioone import PapilioOne
from loam.shields.megawing import MegaWing

megawing = MegaWing(PapilioOne)
megawing.Clock.on()
megawing.Switch.on(5)
megawing.LED.on(4)

main = megawing.main()
RESET = main.SWITCH[4]
I = main.SWITCH[0:4]
O = main.LED

reg = Register(4,r=True)

m.wire( reg(I, RESET=RESET), O )



