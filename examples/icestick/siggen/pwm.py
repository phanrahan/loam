import magma as m
from mantle import Counter, ULE
from loam.boards.icestick import IceStick

N = 8

def PWM(n):
    return ULE(n)

icestick = IceStick()
icestick.Clock.on()
icestick.J3[0].output().on()

main = icestick.main()

counter = Counter(32)
sawtooth = counter.O[8:8+N]
pwm = PWM(N)

m.wire( pwm( sawtooth, m.uint(128,8) ), main.J3 )



