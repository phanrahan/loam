import magma as m
from loam.boards.gpdevboard import GPDevBoard

gp = GPDevBoard()
gp.fpga.P4.input().on()
gp.fpga.P5.output().on()

main = gp.main()
m.wire( main.P4, main.P5 )
m.EndDefine()

