import magma as m
import mantle
from loam.boards.icestick import IceStick

icestick = IceStick()
icestick.Clock.on()
for i in range(8):
    icestick.J3[i].output().on()

main = icestick.main()

valid = 1

counter = mantle.CounterModM(103, 8)
baud = counter.COUT

count = mantle.Counter(4, has_ce=True, has_reset=True)
done = mantle.Decode(15, 4)(count.O)

run = mantle.DFF(has_ce=True)
run_n = mantle.LUT3([0,0,1,0, 1,0,1,0])
run_n(done, valid, run.O)
run(run_n, ce=baud)

reset = mantle.LUT2(mantle.I0&~mantle.I1)(done, run)
count(ce=baud, reset=reset)

m.wire(main.CLKIN, main.J3[0])
m.wire(baud,       main.J3[1])
m.wire(run,        main.J3[2])
m.wire(done,       main.J3[3])
m.wire(count.O,    main.J3[4:8])

