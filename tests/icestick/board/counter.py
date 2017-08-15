import sys
from magma import wire, compile
from loam.boards.icestick import IceStick, Counter

icestick = IceStick()
icestick.Clock.on()
icestick.D5.on()

main = icestick.main()

N = 22

counter = Counter(N)
wire(counter.O[N-1], main.D5)

compile(sys.argv[1], main)
