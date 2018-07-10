import magma as m
from mantle import *
from loam.boards.papilioone import PapilioOne
from loam.shields.megawing import MegaWing

megawing = MegaWing(PapilioOne)

megawing.Switch.on(8)
megawing.LED.on(3)

main = megawing.main()
I = main.SWITCH
O = main.LED

arb = Arbiter( 8 )
enc = Encoder( 8 )

m.wire( enc( arb (I) ), O )
