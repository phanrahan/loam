import sys
from magma import wire, compile
from loam.boards.icestick import IceStick, Mux

icestick = IceStick()
for i in range(6):
    icestick.J1[i].input().on()
icestick.D1.on()

main = icestick.main()
I = main.J1[0:4]
S = main.J1[4:6]

mux = Mux(4)
mux( I, S )
wire(mux.O, main.D1)

compile(sys.argv[1], main)
