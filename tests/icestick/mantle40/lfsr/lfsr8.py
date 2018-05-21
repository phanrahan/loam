from magma import wire, compile, EndCircuit
from mantle.util.lfsr import DefineLFSR
from mantle import Counter
from loam.boards.icestick import IceStick

icestick = IceStick()
icestick.Clock.on()
for i in range(8):
    icestick.J3[i].output().on()

main = icestick.main()

clock = Counter(22)

lfsr = DefineLFSR(8, has_ce=True)

wire( lfsr( ce=clock.COUT ), main.J3 )

EndCircuit()
