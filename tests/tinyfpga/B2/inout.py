import magma as m
from loam.boards.tinyfpga import B2

b2 = B2()
b2.PIN4.input().on()
b2.PIN5.output().on()

main = b2.main()
m.wire( main.PIN4, main.PIN5 )
m.EndDefine()

