import magma as m
from mantle import *
from loam.boards.papilioone import PapilioOne
from loam.shields.megawing import MegaWing

megawing = MegaWing(PapilioOne)

megawing.Switch.on(4)
megawing.LED.on(1)

main = megawing.main()
I = main.SWITCH
O = main.LED[0]

three = Decode(3,4)

m.wire(three(I), O)



