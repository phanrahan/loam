import magma as m
import mantle
from loam.shields.megawing import MegaWing

if   m.mantle_target == 'spartan3':
    from loam.boards.papilioone import PapilioOne as Papilio
elif m.mantle_target == 'spartan6':
    from loam.boards.papiliopro import PapilioPro as Papilio

megawing = MegaWing(Papilio)
megawing.Clock.on()
megawing.LED.on(8)

main = megawing.main()

counter = mantle.Counter(22)

ring = mantle.Ring(8, has_ce=True)

m.wire( ring( ce=counter.COUT ), main.LED )

m.EndCircuit()
