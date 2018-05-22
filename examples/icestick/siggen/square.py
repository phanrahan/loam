import magma as m
from mantle import Counter
from loam.boards.icestick import IceStick

icestick = IceStick()
icestick.Clock.on()
icestick.J3[0].output().on()

main = icestick.main()

counter = Counter(32)
square = counter.O[9]

m.wire( square, main.J3 )


