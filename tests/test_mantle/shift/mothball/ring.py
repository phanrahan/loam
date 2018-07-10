import magma as m
import mantle
from loam.boards.icestick import IceStick

N = 8

icestick = IceStick()
icestick.Clock.on()
for i in range(N):
    icestick.J3[i].output().on()

main = icestick.main()

clock = mantle.Counter(22)

ring = mantle.Ring(N, has_ce=True)

m.wire( ring( ce=clock.COUT ), main.J3 )

m.EndCircuit()
