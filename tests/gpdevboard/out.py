import magma as m
from loam.boards.gpdevboard import GPDevBoard

gp = GPDevBoard()
gp.fpga.P4.output().on()

main = gp.main()

m.wire( 1, main.P4 )

m.EndDefine()
