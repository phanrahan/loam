from magma import *
from mantle import *
from loam.boards.papilioone import PapilioOne
from loam.shields.megawing import MegaWing

megawing = MegaWing(PapilioOne)
megawing.Clock.on()
megawing.LED.on(1)

main = megawing.main()

clock = Counter(24)
ring = SISO(4, init=1, has_ce=True)

wire( ring(ring.O, CE=clock.COUT), main.LED )

