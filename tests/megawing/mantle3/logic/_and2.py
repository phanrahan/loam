import magma as m
from mantle import *
from loam.boards.papilioone import PapilioOne
from loam.shields.megawing import MegaWing

megawing = MegaWing(PapilioOne)
megawing.Switch.on(2)
megawing.LED.on(1)

main = megawing.main()

and2 = And(2)

and2(main.SWITCH[0], main.SWITCH[1])
wire(and2, main.LED)



