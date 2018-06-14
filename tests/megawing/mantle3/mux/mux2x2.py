import magma as m
from mantle import *
from loam.boards.papilioone import PapilioOne
from loam.shields.megawing import MegaWing

megawing = MegaWing(PapilioOne)
megawing.Switch.on(5)
megawing.LED.on(2)

main = megawing.main()
I0 = main.SWITCH[0:2]
I1 = main.SWITCH[2:4]
S = main.SWITCH[4]
O = main.LED

mux = Mux(2,2)
mux(I0,I1,S)
m.wire(mux.O, O)


