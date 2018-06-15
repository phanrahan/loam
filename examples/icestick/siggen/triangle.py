import magma as m
from mantle import Register, Counter, Invert, Mux
from loam.boards.icestick import IceStick

N = 8

icestick = IceStick()
icestick.Clock.on()
for i in range(N):
    icestick.J3[i].output().on()

main = icestick.main()

def DefineTriangle(n):
    T = m.Bits(n)
    class _Triangle(m.Circuit):
        name = 'Triangle'+str(n)
        IO  = ['I', m.In(T), 'O', m.Out(T)]
    
        @classmethod
        def definition(io):
            invert = Invert(n)
            mux = Mux(2, n)
            m.wire( mux( io.I, invert(io.I), io.I[n-1] ), io.O )
    return _Triangle

def Triangle(n):
    return DefineTriangle(N)()

counter = Counter(32)
sawtooth = counter.O[8:8+N]

tri = Triangle(N)
reg = Register(N)

m.wire( reg(tri(sawtooth)), main.J3 )


