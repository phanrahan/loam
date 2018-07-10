import magma as m
from mantle import *
from loam.boards.papilioone import PapilioOne
from loam.shields.megawing import MegaWing

megawing = MegaWing(PapilioOne)
megawing.Clock.on()
megawing.Switch.on(1)
megawing.LED.on(1)

main = megawing.main()
I = main.SWITCH
O = main.LED

ff = FF()

m.wire( ff(I), O)



