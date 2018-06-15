import magma as m
from mantle import Counter
from loam.boards.icestick import IceStick

icestick = IceStick()
icestick.Clock.on()
icestick.DSR.on()
icestick.CTS.on()
icestick.D1.on()
icestick.D2.on()

main = icestick.main()

N = 26

counter = Counter(N)
m.wire(counter.O[N-2], main.DSR)
m.wire(counter.O[N-2], main.D1)

m.wire(counter.O[N-1], main.CTS)
m.wire(counter.O[N-1], main.D2)

m.EndCircuit()
