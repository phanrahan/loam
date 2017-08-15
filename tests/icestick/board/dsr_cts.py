import sys
from magma import wire, compile
from loam.boards.icestick import IceStick, Counter

icestick = IceStick()
icestick.Clock.on()
icestick.DSR.on()
icestick.CTS.on()

main = icestick.main()

N = 22

counter = Counter(N)
wire(counter.O[N-2], main.DSR)
wire(counter.O[N-1], main.CTS)

compile(sys.argv[1], main)
