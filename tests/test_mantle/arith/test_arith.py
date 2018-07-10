import pytest
import mantle
from ..harness import unary, binary

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
    "Negate",
])
@pytest.mark.parametrize("width", [2,4,8])
def test_unary(op,width):
    Test = getattr(mantle, op)
    com(f'{op}{width}', unary(Test, width))


@pytest.mark.parametrize("op", [
    "Add",
    "Sub",
])
@pytest.mark.parametrize("width", [2,4])
def test_binary(op,width):
    Test = getattr(mantle, op)
    com(f'{op}{width}', binary(Test, width))

