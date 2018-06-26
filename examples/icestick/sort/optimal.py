import magma as m
from loam.boards.icestick import IceStick
from mantle.util.sort import swap
from mantle.util.sort.best import sort8

icestick = IceStick()
for i in range(8):
    icestick.J1[i].input().on()
for i in range(8):
    icestick.J3[i].output().on()

main = icestick.main()

I = main.J1.as_list()

for wire0, wire1 in sum(sort8, []):
    O = swap(m.bits([I[wire0], I[wire1]]))
    I[wire0], I[wire1]  = O[0], O[1]

m.wire(m.bits(I), main.J3)

m.EndCircuit()
