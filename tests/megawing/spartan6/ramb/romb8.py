import magma as m
from mantle.xilinx.spartan6.RAMB import ROMB16
from loam.boards.papiliopro import PapilioPro
from loam.shields.megawing import MegaWing

megawing = MegaWing(PapilioPro)
megawing.Clock.on()
megawing.Switch.on(8)
megawing.LED.on(8)

main = megawing.main()

rom = 2048*[0]
for i in range(2048):
    byte = i & 0xff
    rom[i] = byte

romb = ROMB16( rom, 8 )

I = m.bits([main.SWITCH[0], main.SWITCH[1], main.SWITCH[2], main.SWITCH[3],
            main.SWITCH[4], main.SWITCH[5], main.SWITCH[6], main.SWITCH[7],
            0, 0, 0])

O = main.LED

m.wire( I, romb.A )
m.wire( romb.O, O )

