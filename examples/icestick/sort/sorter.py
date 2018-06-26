import magma as m
from loam.boards.icestick import IceStick
from mantle.util.sort import \
    halfcleaner, reversehalfcleaner, \
    Riffle, UnRiffle, \
    ReverseRiffle, UnReverseRiffle, \
    Reverse, \
    bricksorter, \
    bitonicsorter, sorter, \
    evenoddsorter \


N = 8
icestick = IceStick()
for i in range(N):
    icestick.J1[i].input().on()
for i in range(N):
    icestick.J3[i].output().on()

main = icestick.main()

#m.wire( Riffle(N)(main.J1), main.J3 )
#r = Riffle(N)
#u = UnRiffle(N)
#id = compose( u, r )

#r = ReverseRiffle(N)
#u = UnReverseRiffle(N)
#id = compose( u, r )

#m.wire( Reverse(N)(main.J1), main.J3 )
#r = Reverse(N)
#u = Reverse(N)
#id = compose( u, r )
#m.wire( id(main.J1), main.J3 )

#m.wire( halfcleaner(main.J1), main.J3 )
#m.wire( reversehalfcleaner(main.J1), main.J3 )

#m.wire( bitonicsorter(main.J1), main.J3 )

#m.wire( merger(main.J1), main.J3 )

m.wire( sorter(main.J1), main.J3 )

#m.wire( evenoddmerger(main.J1), main.J3 )
#m.wire( evenoddsorter(main.J1), main.J3 )

#m.wire( bricksorter(main.J1), main.J3 )

m.EndCircuit()
