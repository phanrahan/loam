import magma as m
from mantle import Counter
from loam.boards.icestick import IceStick

icestick = IceStick()
for i in range(8):
    icestick.J1[i].input().on()
    icestick.J3[i].output().on()

main = icestick.main()

for i in range(8):
    main.J3[i] <= main.J1[7-i]
#main.J3[4:] <= main.J1[4:]
#main.J3 <= main.J1

m.EndCircuit()
