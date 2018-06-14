import magma as m
from mantle import *
from loam.boards.papilioone import PapilioOne
from loam.shields.megawing import MegaWing

megawing = MegaWing(PapilioOne)
megawing.Switch.on(6)
megawing.LED.on(1)

main = megawing.main()
I = main.SWITCH[0:4]
S = main.SWITCH[4:6]

mux = Mux4()

mux(I,S)
m.wire(mux.O, main.LED)

