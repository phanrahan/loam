import magma as m
from loam.shields.megawing import MegaWing

megawing = MegaWing()
megawing.Switch.on(8)
megawing.LED.on(8)

main = megawing.main()

m.wire(main.SWITCH, main.LED)



