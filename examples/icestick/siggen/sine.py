import math
import numpy as np

import magma as m
from mantle import Counter, Memory
from loam.boards.icestick import IceStick


def sine(x):
    return np.sin(2 * math.pi * x)

x = np.linspace(0., 1., num=256, endpoint=False)
wavetable = 128 + 127*sine(x)

icestick = IceStick()
icestick.Clock.on()
for i in range(8):
    icestick.J3[i].output().on()

main = icestick.main()

counter = Counter(16)
sawtooth = counter.O[8:16]

wavetable = wavetable.astype(int)
rom = Memory(height=256, width=16, rom=list(wavetable), readonly=True)

m.wire( rom(sawtooth)[0:8], main.J3 )
m.wire( 1, rom.RE )

m.EndCircuit()

