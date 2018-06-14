import magma as m
from mantle import FF
from loam.boards.papilioone import PapilioOne
from loam.shields.megawing import MegaWing

megawing = MegaWing(PapilioOne)
megawing.Clock.frequency(50000000).on()
megawing.Switch.on(1)
megawing.LED.on(1)

main = megawing.main()

ff = FF()

m.wire( ff(main.SWITCH), main.LED )



