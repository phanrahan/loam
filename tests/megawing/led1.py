import magma as m
from loam.boards.papilioone import PapilioOne
from loam.shields.megawing import MegaWing

megawing = MegaWing(PapilioOne)
megawing.LED.on(1)

main = megawing.main()

m.wire(1, main.LED)



