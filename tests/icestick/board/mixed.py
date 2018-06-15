import magma as m
from mantle import Counter
from loam.boards.icestick import IceStick

icestick = IceStick()
icestick.Clock.on()
for i in range(0, 4):
    icestick.J1[i].rename('J1i[{}]'.format(i)).input().on()
for i in range(4, 8):
    icestick.J1[i].rename('J1o[{}]'.format(i-4)).output().on()

main = icestick.main()
m.wire(1, main.J1o[0])
m.EndCircuit()

