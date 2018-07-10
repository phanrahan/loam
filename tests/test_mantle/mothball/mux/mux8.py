import magma as m
from mantle import *
from loam.boards.papilioone import PapilioOne
from loam.shields.megawing import MegaWing

megawing = MegaWing(PapilioOne)
megawing.Switch.on(7)
megawing.LED.on(1)

main = megawing.main()
I = bits([main.SWITCH[0], main.SWITCH[1], main.SWITCH[2], main.SWITCH[3],
          main.SWITCH[0], main.SWITCH[1], main.SWITCH[2], main.SWITCH[3]])
S = bits([main.SWITCH[4], main.SWITCH[5], main.SWITCH[6]])

mux = Mux8()

mux(I,S)
m.wire(mux.O, main.LED)

