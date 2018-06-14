from magma.testing import compile_and_regress

def main(n):
    import magma as m
    m.set_mantle_target('spartan6')
    from loam.boards.papiliopro import PapilioPro
    from loam.shields.megawing import MegaWing
    from mantle import LUTN

    megawing = MegaWing(PapilioPro)
    megawing.Switch.on(n)
    megawing.LED.on(1)

    top = megawing.main()
    pown = 1 << n
    lut = LUTN(pown//2*[0,1], pown)
    I = [top.SWITCH[i] for i in range(n)] if n != 1 else [top.SWITCH]
    m.wire( lut(*I), top.LED )
    m.EndCircuit()

    return top

def test_mantle6_lut():
    for n in range(8):
        compile_and_regress(__file__, 'lut'+str(n+1), 'xilinx', main, n+1)

