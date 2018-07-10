from magma import wire, compile, EndCircuit
from loam.boards.icestick import IceStick, Counter

N = 8

icestick = IceStick()
icestick.Clock.on()
for i in range(N):
    icestick.J3[i].output().on()

main = icestick.main()

counter = Counter(N)
wire(counter.O, main.J3)

EndCircuit()
