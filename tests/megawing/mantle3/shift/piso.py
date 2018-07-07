from magma import *
from mantle import *
from loam.boards.papilioone import PapilioOne
from loam.shields.megawing import MegaWing

megawing = MegaWing(PapilioOne)
megawing.Clock.on()
megawing.Switch.on(6)
megawing.LED.on(1)

main = megawing.main()
SI = main.SWITCH[0]
PI = main.SWITCH[1:5]
LOAD = main.SWITCH[5]

clock = Counter(24)

piso = PISO(4, init=1, has_ce=True)

wire( piso(SI, PI, LOAD, CE=clock.COUT), main.LED )

