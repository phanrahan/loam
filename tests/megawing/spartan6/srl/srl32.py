import magma as m
from mantle.xilinx.spartan6.SRL import SRL32
from loam.boards.papiliopro import PapilioPro
from loam.shields.megawing import MegaWing

megawing = MegaWing(PapilioPro)
megawing.Clock.on()
megawing.Switch.on(6)
megawing.LED.on(1)

main = megawing.main()
A = main.SWITCH[0:5]
I = main.SWITCH[5]
O = main.LED

srl32 = SRL32(init=1)
m.wire( srl32(A,I), O )


