import pytest
import mantle
from ..harness import show, unary

def com(name, main):
    import magma
    from magma.testing import check_files_equal
    name += '_' + magma.mantle_target
    build = 'build/' + name
    gold = 'gold/' + name
    magma.compile(build, main)
    assert check_files_equal(__file__, build+'.v',   gold+'.v')
    if magma.mantle_target == 'ice40':
        assert check_files_equal(__file__, build+'.pcf', gold+'.pcf')
    elif magma.mantle_target in ['spartan3', 'spartan6']:
        assert check_files_equal(__file__, build+'.ucf', gold+'.ucf')


@pytest.mark.parametrize("op", [
    "Ring",
    "Johnson",
])
@pytest.mark.parametrize("width", range(8))
def test_unary(op,width):
    width = width + 1
    Test = getattr(mantle, op)
    com(f'{op}{width}', show(Test, width, has_clock=True))

@pytest.mark.parametrize("op", [
    "SISO",
])
@pytest.mark.parametrize("width", range(8))
def test_siso(op,width):
    width = width + 1
    def Test(w):
        Op = getattr(mantle, op)
        return Op(width)
    com(f'{op}{width}', unary(Test, 1, input_isbits=False, output_isbits=False, has_clock=True))

@pytest.mark.skip(reason='NYI')
@pytest.mark.parametrize("op", [
    "SIPO",
])
@pytest.mark.parametrize("width", range(8))
def test_sipo(op,width):
    pass

@pytest.mark.skip(reason='NYI')
@pytest.mark.parametrize("op", [
    "PISO",
])
@pytest.mark.parametrize("width", range(8))
def test_piso(op,width):
    pass

@pytest.mark.skip(reason='NYI')
@pytest.mark.parametrize("op", [
    "PIPO",
])
@pytest.mark.parametrize("width", range(8))
def test_pipo(op,width):
    pass

