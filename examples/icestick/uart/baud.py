import magma as m
import mantle
from loam.boards.icestick import IceStick

icestick = IceStick()
icestick.Clock.on()
for i in range(2):
    icestick.J3[i].output().on()

main = icestick.main()

counter = mantle.CounterModM(103, 8)
baud = counter.COUT

m.wire(main.CLKIN, main.J3[0])
m.wire(baud,       main.J3[1])

