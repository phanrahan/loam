import magma as m
from mantle import *
from loam.boards.papilioone import PapilioOne
from loam.shields.megawing import MegaWing

megawing = MegaWing(PapilioOne)
megawing.Switch.on(4)
megawing.LED.on(1)

main = megawing.main()

and4 = And(4)

and4(main.SWITCH[0], main.SWITCH[1], main.SWITCH[2], main.SWITCH[3])
m.wire(and4, main.LED)



