import magma as m
from magma.testing import check_files_equal

m.set_mantle_target('ice40')

def compile_and_regress(name, vendor, main, *largs, **kwargs):
    build = 'build/' + name
    gold = 'gold/' + name
    m.compile(build, main(*largs, **kwargs))
    assert check_files_equal(__file__, build+'.v', gold+'.v')
    assert check_files_equal(__file__, build+'.pcf', gold+'.pcf')


def main(n):
    from loam.boards.icestick import IceStick
    from mantle import LUTN

    icestick = IceStick()
    for i in range(n):
        icestick.J1[i].input().on()
    icestick.J3[0].rename('D0').output().on()

    top = icestick.main()
    pown = 1 << n
    lut = LUTN(pown//2*[0,1], pown)
    I = [top.J1[i] for i in range(n)] if n != 1 else [top.J1]
    m.wire( lut(*I), top.D0 )
    m.EndCircuit()

    return top

def test_lut():
    for n in range(8):
        compile_and_regress('lut'+str(n+1), 'lattice', main, n+1)

