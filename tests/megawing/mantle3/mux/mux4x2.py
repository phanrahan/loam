import magma as m
from mantle import *
from loam.boards.papilioone import PapilioOne
from loam.shields.megawing import MegaWing

megawing = MegaWing(PapilioOne)
megawing.Switch.on(6)
megawing.LED.on(2)

main = megawing.main()
I0 = bits([main.SWITCH[0], main.SWITCH[0]])
I1 = bits([main.SWITCH[1], main.SWITCH[1]])
I2 = bits([main.SWITCH[2], main.SWITCH[2]])
I3 = bits([main.SWITCH[3], main.SWITCH[3]])
S = main.SWITCH[4:6]
O = main.LED

mux = Mux(4,2)
mux(I0,I1,I2,I3,S)
m.wire(mux.O, O)

