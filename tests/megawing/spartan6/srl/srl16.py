import magma as m
from mantle.xilinx.spartan6.SRL import SRL16
from loam.boards.papiliopro import PapilioPro
from loam.shields.megawing import MegaWing

megawing = MegaWing(PapilioPro)
megawing.Clock.on()
megawing.Switch.on(5)
megawing.LED.on(1)

main = megawing.main()
A = main.SWITCH[0:4]
I = main.SWITCH[4]
O = main.LED

srl16=  SRL16(init=1)
m.wire( srl16(A,I), O )



