from magma import wire, bits, EndCircuit
from loam.boards.icestick import IceStick, Counter, ULE

N = 8

icestick = IceStick()
icestick.Clock.on()
icestick.J3[0].rename('J3').output().on()

main = icestick.main()

counter = Counter(32)
sawtooth = counter.O[8:8+N]
pwm = ULE(N)

wire( pwm(sawtooth, bits( 64, 8 )), main.J3 )

EndCircuit()

