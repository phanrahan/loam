import magma as m
from mantle import Counter
from loam.boards.icestick import IceStick

N = 8

icestick = IceStick()
icestick.Clock.on()
for i in range(N):
    icestick.J3[i].output().on()

main = icestick.main()

counter = Counter(32)
sawtooth = counter.O[8:16]

m.wire( sawtooth, main.J3 )


