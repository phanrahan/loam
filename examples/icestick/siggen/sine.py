import math
import magma as m
from mantle import Counter, Memory
from loam.boards.icestick import IceStick

icestick = IceStick()
icestick.Clock.on()
for i in range(8):
    icestick.J3[i].output().on()

main = icestick.main()

counter = Counter(16)
sawtooth = counter.O[8:16]

sintab = [int(128 + 127 * math.sin(2 * math.pi * i / 256.)) for i in range(256)]

rom = Memory(height=256, width=16, rom=sintab, readonly=True)

m.wire( rom(sawtooth)[0:8], main.J3 )
m.wire( 1, rom.RE )

m.EndCircuit()

