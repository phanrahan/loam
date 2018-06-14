import magma as m
from mantle import *
from loam.boards.papilioone import PapilioOne
from loam.shields.megawing import MegaWing

megawing = MegaWing(PapilioOne)
megawing.Switch.on(1)
megawing.LED.on(1)

main = megawing.main()
A = main.SWITCH
O = main.LED

not1 = Not()

not1(A)
m.wire(not1.O, O)



