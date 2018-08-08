import magma as m
from mantle.xilinx.spartan3.RAMB import ROMB16
from loam.boards.papilioone import PapilioOne
from loam.shields.megawing import MegaWing


megawing = MegaWing(PapilioOne)
megawing.Clock.on()
megawing.Switch.on(8)
megawing.LED.on(8)

main = megawing.main()

rom = range(1024)
for i in range(1024):
    byte = i & 0xff
    rom[i] = byte << 8

romb = ROMB16( rom, 16 )

I = m.bits([main.SWITCH[0], main.SWITCH[1], main.SWITCH[2], main.SWITCH[3],
          main.SWITCH[4], main.SWITCH[5], main.SWITCH[6], main.SWITCH[7],
          GND, GND])

O = main.LED

m.wire( I, romb.A )
m.wire( romb.O[8:16], O )

