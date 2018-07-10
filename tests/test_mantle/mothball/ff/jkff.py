import magma as m
from mantle import *
from loam.boards.papilioone import PapilioOne
from loam.shields.megawing import MegaWing

megawing = MegaWing(PapilioOne)
megawing.Clock.on()
megawing.Switch.on(2)
megawing.LED.on(1)

main = megawing.main()
J = main.SWITCH[0]
K = main.SWITCH[1]
O = main.LED

ff = JKFF()

m.wire( ff(J, K), O )


