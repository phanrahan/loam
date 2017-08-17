from magma import wire, compile, EndCircuit
from loam.boards.icestick import IceStick, Counter

icestick = IceStick()
icestick.Clock.on()
icestick.DSR.on()
icestick.CTS.on()
icestick.D1.on()
icestick.D2.on()

main = icestick.main()

N = 26

counter = Counter(N)
wire(counter.O[N-2], main.DSR)
wire(counter.O[N-2], main.D1)

wire(counter.O[N-1], main.CTS)
wire(counter.O[N-1], main.D2)

EndCircuit()
