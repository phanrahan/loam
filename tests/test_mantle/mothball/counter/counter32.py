import magma as m
import mantle
from loam.boards.papilioone import PapilioOne
from loam.shields.megawing import MegaWing

megawing = MegaWing(PapilioOne)
megawing.Clock.on()
megawing.LED.on(8)

main = megawing.main()

counter = mantle.Counter(32)

m.wire( counter.O[24:], main.LED )


