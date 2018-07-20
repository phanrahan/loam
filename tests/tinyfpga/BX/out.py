import magma as m
from loam.boards.tinyfpga import BX

b = BX()
b.PIN4.output().on()

main = b.main()
m.wire( 1, main.PIN4 )
m.EndDefine()
