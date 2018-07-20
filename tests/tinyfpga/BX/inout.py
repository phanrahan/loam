import magma as m
from loam.boards.tinyfpga import BX

b = BX()
b.PIN4.input().on()
b.PIN5.output().on()

main = b.main()
m.wire( main.PIN4, main.PIN5 )
m.EndDefine()

