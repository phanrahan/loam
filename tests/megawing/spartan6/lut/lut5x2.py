import magma as m
from mantle.xilinx.spartan6 import LUT5x2
from loam.boards.papiliopro import PapilioPro
from loam.shields.megawing import MegaWing

megawing = MegaWing(PapilioPro)
megawing.Switch.on(6)
megawing.LED.on(2)

main = megawing.main()
I = main.SWITCH
O = main.LED

lut = LUT5x2(16*[0,1],16*[1,0])

lut(I[0], I[1], I[2], I[3], I[4])
m.wire(lut.O5, O[0])
m.wire(lut.O6, O[1])



