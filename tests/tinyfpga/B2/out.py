import magma as m
from loam.boards.tinyfpga import B2

b2 = B2()
b2.PIN4.output().on()

main = b2.main()

m.wire( 1, main.PIN4 )

m.EndDefine()
