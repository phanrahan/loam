import math
from magma import wire, col, fork, uncurry, EndCircuit
from magma.bitutils import int2seq
from mantle import Counter, LUT6
from loam.boards.icestick import IceStick

N = 8

icestick = IceStick()
icestick.Clock.on()
for i in range(N):
    icestick.J3[i].output().on()

main = icestick.main()

counter = Counter(32)
sawtooth = counter.O[8:8+6]

def int256(x):
    return int2seq(int(x), N)

sintab = [int256(128 + 127 * math.sin(2 * math.pi * i / 64.)) for i in range(64)]
sintab = list(zip(*sintab)) # transpose

print(len(sintab))
print(len(sintab[0]))

def ROM(y):
    return uncurry(LUT6(sintab[y]))

rom = fork(col(ROM, N))

rom(sawtooth)

wire( rom, main.J3 )

EndCircuit()

