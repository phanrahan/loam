import magma as m
from mantle.xilinx.spartan6.RAM import RAM32
from loam.boards.papiliopro import PapilioPro
from loam.shields.megawing import MegaWing

megawing = MegaWing(PapilioPro)
megawing.Clock.on()
megawing.Switch.on(8)
megawing.LED.on(1)

main = megawing.main()

ram = RAM32(16*[0,1])

m.wire(main.SWITCH[:5], ram.A)
m.wire(main.SWITCH[6], ram.I)
m.wire(main.SWITCH[7], ram.WE)

m.wire(ram.O, main.LED)

