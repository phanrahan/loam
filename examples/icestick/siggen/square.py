from magma import wire, bits
from loam.boards.icestick import IceStick, Counter

icestick = IceStick()
icestick.Clock.on()
for i in range(8):
    icestick.J3[i].output().on()

main = icestick.main()

counter = Counter(32)
square = bits([counter.O[9], 0, 0, 0, 0, 0, 0, 0])

wire( square, main.J3 )

