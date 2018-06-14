import magma as m
from mantle import *
from loam.boards.papilioone import PapilioOne
from loam.shields.megawing import MegaWing

megawing = MegaWing(PapilioOne)
megawing.Switch.on(3)
megawing.LED.on(8)

main = megawing.main()

decoder = Decoder( 3 )

m.wire( decoder( main.SWITCH ), main.LED )

