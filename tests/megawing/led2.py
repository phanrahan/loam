import magma as m
from loam.shields.megawing import MegaWing

megawing = MegaWing()
megawing.LED.on(2)

main = megawing.main()

m.wire(1, main.LED[0])
m.wire(1, main.LED[1])



