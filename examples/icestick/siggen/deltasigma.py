import magma as m
from mantle import Add, Register
from loam.boards.icestick import IceStick

DELTA = 0x8000

icestick = IceStick()
icestick.Clock.on()
icestick.J3[0].output().on()

main = icestick.main()

add = Add(16, cout=True)
reg = Register(16)

O, cout = add(reg, m.uint(DELTA,16)) 

m.wire( O, reg.I )
m.wire( cout, main.J3 )


