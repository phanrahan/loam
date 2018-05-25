import magma as m
from loam.shields.megawing import MegaWing

megawing = MegaWing()
megawing.LED.on(1)

main = megawing.main()

m.wire(1, main.LED)



