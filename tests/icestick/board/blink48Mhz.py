import magma as m
from mantle import Counter
from loam.boards.icestick import IceStick

icestick = IceStick()
icestick.Clock.frequency(48000000).on()
icestick.D5.on()

main = icestick.main()

N = 24

counter = Counter(N)
o, _ = counter()
main.D5 <= o[-1]

m.EndCircuit()
