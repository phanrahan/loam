from magma import wire
from loam.boards.icestick import IceStick, Counter

N = 8

icestick = IceStick()
icestick.Clock.on()
for i in range(N):
    icestick.J3[i].output().on()

main = icestick.main()

counter = Counter(32)
sawtooth = counter.O[8:8+N]

wire( sawtooth, main.J3 )

