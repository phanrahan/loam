import magma as m
from magma.bitutils import int2seq
import mantle
from loam.boards.icestick import IceStick
from rom import ROM

icestick = IceStick()
icestick.Clock.on()
icestick.TX.output().on()

main = icestick.main()

valid = 1

init = [m.array(int2seq(ord(c), 8)) for c in 'hello, world  \r\n']

printf = mantle.Counter(4, has_ce=True)
rom = ROM(4, init, printf.O)

data = m.array([rom.O[7], rom.O[6], rom.O[5], rom.O[4],
                rom.O[3], rom.O[2], rom.O[1], rom.O[0], 0])

counter = mantle.CounterModM(103, 8)
baud = counter.COUT

count = mantle.Counter(4, has_ce=True, has_reset=True)
decode = mantle.Decode(15, 4)
done = decode(count.O)

run = mantle.DFF(has_ce=True)
run_n = mantle.LUT3([0,0,1,0, 1,0,1,0])
run_n(done, valid, run.O)
run(run_n, ce=baud)

reset = mantle.LUT2(mantle.I0&~mantle.I1)(done, run)
count(CE=baud, RESET=reset)

shift = mantle.PISO(9, has_ce=True)
load = mantle.LUT2(mantle.I0&~mantle.I1)(valid,run)
shift(1,data,load)
m.wire(baud, shift.CE)

ready = mantle.LUT2(~mantle.I0 & mantle.I1)(run, baud)
m.wire(ready, printf.CE)

m.wire(shift, main.TX)

