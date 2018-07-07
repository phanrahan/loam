from magma import *
from mantle import *
from loam.boards.papilioone import PapilioOne
from loam.shields.megawing import MegaWing

megawing = MegaWing(PapilioOne)
megawing.Clock.on()
megawing.LED.on(4)

main = megawing.main()

clock = Counter(24)
ring = Ring(4, init=1, has_ce=True)

wire( ring( CE=clock.COUT ), main.LED )


