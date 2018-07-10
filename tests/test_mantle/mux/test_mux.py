import pytest
import magma
import mantle

def com(name, main):
    from magma.testing import check_files_equal
    name += '_' + magma.mantle_target
    build = 'build/' + name
    gold = 'gold/' + name
    magma.compile(build, main)
    assert check_files_equal(__file__, build+'.v',   gold+'.v')
    if   magma.mantle_target == 'ice40':
        assert check_files_equal(__file__, build+'.pcf', gold+'.pcf')
    elif magma.mantle_target in ['spartan3', 'spartan6']:
        assert check_files_equal(__file__, build+'.ucf', gold+'.ucf')


def binary(Test, width):
    import magma as m
    from loam.boards.icestick import IceStick

    icestick = IceStick()
    for i in range(2*width):
        icestick.J1[i].input().on()
    for i in range(width):
        icestick.J3[i].output().on()

    top = icestick.main()
    if width == 1:
        top.J3 = [top.J3]
    test = Test()
    m.wire( test(top.J1[0:width], top.J1[width:2*width], 0), top.J3 )
    m.EndCircuit()

    return top

@pytest.mark.skipif(magma.mantle_target != 'ice40', reason='NYI')
@pytest.mark.parametrize("width", [2,4])
def test_mux(width):
    Test = mantle.DefineMux(2,width)
    com(f'Mux2x{width}', binary(Test, width) )

