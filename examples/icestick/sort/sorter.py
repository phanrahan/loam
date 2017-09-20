from magma import *
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

#wire( Riffle(N)(main.J1), main.J3 )
#r = Riffle(N)
#u = UnRiffle(N)
#id = compose( u, r )

#r = ReverseRiffle(N)
#u = UnReverseRiffle(N)
#id = compose( u, r )

#wire( Reverse(N)(main.J1), main.J3 )
#r = Reverse(N)
#u = Reverse(N)
#id = compose( u, r )
#wire( id(main.J1), main.J3 )

#wire( halfcleaner(main.J1), main.J3 )
#wire( reversehalfcleaner(main.J1), main.J3 )

#wire( bitonicsorter(main.J1), main.J3 )

#wire( merger(main.J1), main.J3 )

wire( sorter(main.J1), main.J3 )

#wire( evenoddmerger(main.J1), main.J3 )
#wire( evenoddsorter(main.J1), main.J3 )

#wire( bricksorter(main.J1), main.J3 )

EndCircuit()
