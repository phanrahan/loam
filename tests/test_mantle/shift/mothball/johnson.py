import magma as m
import mantle
from loam.boards.icestick import IceStick

icestick = IceStick()
icestick.Clock.on()
for i in range(4):
    icestick.J3[i].output().on()

main = icestick.main()

clock = mantle.Counter(22)

johnson = mantle.Johnson(4, has_ce=True)

johnson(ce=clock.COUT)

m.wire(johnson.O, main.J3)

m.EndCircuit()
