import magma as m
from magma.bitutils import clog2
from mantle.util.compressor import PopCount
from loam.shields.megawing import MegaWing

N = 128
LOGN = min( clog2(N) + 1, 8 )

if   m.mantle_target == 'spartan3':
    from loam.boards.papilioone import PapilioOne as Papilio
elif m.mantle_target == 'spartan6':
    from loam.boards.papiliopro import PapilioPro as Papilio

megawing = MegaWing(Papilio)
megawing.Switch.on(8)
megawing.LED.on(LOGN)

main = megawing.main()

pop8 = PopCount(N)

O = pop8( m.concat(main.SWITCH, m.bits(0,N-8) ) )

m.wire( O[0:LOGN], main.LED )

m.EndCircuit()

