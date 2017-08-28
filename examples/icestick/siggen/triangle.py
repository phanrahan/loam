from magma import *
from loam.boards.icestick import IceStick, Counter, Mux, Invert

N = 8

def DefineTriangle(n):
    name = 'Triangle{}'.format(n)
    T = Bits(n)
    class _Triangle(Circuit):
        IO = ["I", In(T), "O", Out(T)]
        @classmethod
        def definition(io):
            invert = Invert(n)
            mux = Mux(2, n)
            wire( mux( io.I, invert(io.I), io.I[n-1] ), io.O )
    return _Triangle

def Triangle(n):
    return DefineTriangle(n)()

icestick = IceStick()
icestick.Clock.on()
for i in range(8):
    icestick.J3[i].output().on()

main = icestick.main()

counter = Counter(32)
sawtooth = counter.O[8:8+N]
triangle = Triangle(N)

wire( triangle(sawtooth), main.J3 )

