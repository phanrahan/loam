import magma as m
from mantle import Counter
from mantle.util.lhca import LHCA
from loam.boards.icestick import IceStick

icestick = IceStick()
icestick.Clock.on()
for i in range(8):
    icestick.J3[i].output().on()

main = icestick.main()

clock = Counter(22)

lhca = LHCA(8, has_ce=True)

m.wire( lhca( ce=clock.COUT ), main.J3 )

m.EndCircuit()
