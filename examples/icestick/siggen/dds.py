import math
import magma as m
from magma.bitutils import int2seq
from mantle import LUT4, Counter
from loam.boards.icestick import IceStick

N = 8

icestick = IceStick()
icestick.Clock.on()
for i in range(N):
    icestick.J3[i].output().on()

main = icestick.main()

counter = Counter(32)
sawtooth = counter.O[8:8+4]

def int256(x):
    return int2seq(int(x), N)

sintab = [int256(128+127*math.sin(2 * math.pi * i / 16.)) for i in range(16)]
sintab = list(zip(*sintab)) # transpose

def ROM(y):
    return m.uncurry(LUT4(sintab[y]))

rom = m.fork(m.col(ROM, N))

m.wire( rom(sawtooth), main.J3 )


