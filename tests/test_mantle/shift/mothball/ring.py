from magma import wire, compile, EndCircuit
from loam.boards.icestick import IceStick, Counter, Ring

N = 8

icestick = IceStick()
icestick.Clock.on()
for i in range(N):
    icestick.J3[i].output().on()

main = icestick.main()

clock = Counter(22)

ring = Ring(N, has_ce=True)

wire( ring( ce=clock.COUT ), main.J3 )

EndCircuit()
