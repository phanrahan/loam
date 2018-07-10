import magma as m
from mantle import *
from loam.boards.papilioone import PapilioOne
from loam.shields.megawing import MegaWing

megawing = MegaWing(PapilioOne)
megawing.Switch.on(3)
megawing.LED.on(1)

main = megawing.main()
I = main.SWITCH[0:2]
S = main.SWITCH[2]

mux2 = Mux2()

mux2(I,S)
m.wire(mux2.O, main.LED)



