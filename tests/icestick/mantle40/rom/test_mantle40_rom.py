from magma.testing import compile_and_regress

import magma as m
m.set_mantle_target('ice40')
from mantle import LUTN

def ROMN(rom, n):
    return m.uncurry(LUTN(rom, n))

def main(n):
    from loam.boards.icestick import IceStick

    icestick = IceStick()
    for i in range(n):
        icestick.J1[i].input().on()
    icestick.J3[0].rename('D0').output().on()

    top = icestick.main()

    pown = 1 << n
    rom = ROMN(pown//2*[0,1], pown)
    m.wire( rom(top.J1 if n != 1 else m.bits([top.J1])), top.D0 )
    m.EndCircuit()

    return top

def test_rom():
    for n in range(8):
        compile_and_regress(__file__, 'rom'+str(n+1), 'lattice', main, n+1)
