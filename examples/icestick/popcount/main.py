import magma as m
from magma.bitutils import clog2
from mantle.util.compressor import PopCount
from loam.boards.icestick import IceStick

N = 128
LOGN = min( clog2(N) + 1, 8 )

icestick = IceStick()
for i in range(8):
    icestick.J1[i].input().on()
for i in range(LOGN):
    icestick.J3[i].output().on()

main = icestick.main()

pop = PopCount(N)

for i in range(len(pop.I)):
   pop.I[i] <= (main.J1[i] if i < 8 else 0)
main.J3 <= pop.O[0:LOGN]

m.EndCircuit()

