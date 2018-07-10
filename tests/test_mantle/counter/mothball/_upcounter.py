from magma import wire, compile, EndCircuit
from loam.boards.icestick import IceStick, UpCounter

icestick = IceStick()
icestick.Clock.on()
icestick.J3[0].output().on()
icestick.J3[1].output().on()
icestick.J3[2].output().on()
icestick.J3[3].output().on()
icestick.J3[4].output().on()
icestick.J3[5].output().on()
icestick.J3[6].output().on()
icestick.J3[7].output().on()

main = icestick.main()

N = 22+8

counter = UpCounter(N)
print( counter.interface )
wire(counter.O[N-8:N], main.J3)

EndCircuit()
