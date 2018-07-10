import magma as m
from mantle import Counter
from mantle.util.lfsr import DefineLFSR
from loam.boards.icestick import IceStick

icestick = IceStick()
icestick.Clock.on()
for i in range(8):
    icestick.J3[i].output().on()

LFSR = DefineLFSR(8, has_ce=True)

main = icestick.main()

clock = Counter(22)

lfsr = LFSR()

m.wire( lfsr( ce=clock.COUT ), main.J3 )

m.EndCircuit()
