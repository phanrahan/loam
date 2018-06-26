import magma as m
from mantle import Counter, ULE
from loam.boards.icestick import IceStick

N = 8

def PWM(n):
    return ULE(n)

icestick = IceStick()
icestick.Clock.on()
for i in range(8):
    icestick.J1[i].input().on()
icestick.J3[0].output().on()

main = icestick.main()

counter = Counter(32)
sawtooth = counter.O[8:8+N]
# alternatively, reverse bits before feeding to comparitor
# sawtooth = array([counter.O[8+N-1-i] for i in range(N)])
pwm = PWM(N)

m.wire( pwm( sawtooth, main.J1 ), main.J3 )



