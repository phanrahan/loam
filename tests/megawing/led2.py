import magma as m
from loam.boards.papilioone import PapilioOne
from loam.shields.megawing import MegaWing

megawing = MegaWing(PapilioOne)
megawing.LED.on(2)

main = megawing.main()

m.wire(1, main.LED[0])
m.wire(1, main.LED[1])



