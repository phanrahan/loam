import pytest
import magma
import mantle
from ..harness import reduce, unary, nary

def com(name, main):
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
    "ReduceAnd",
    "ReduceNAnd",
    "ReduceOr",
    "ReduceNOr",
    "ReduceXOr",
    "ReduceNXOr",
])
@pytest.mark.parametrize("width", [2,3,4,8])
def test_reduce(op,width):
    Test = getattr(mantle, op)
    com(f'{op}{width}', reduce( Test, width ) )


@pytest.mark.parametrize("op", [
    "And",
    "NAnd",
    "Or",
    "NOr",
    "XOr",
    "NXOr",
])
@pytest.mark.parametrize("height", [2,3,4])
@pytest.mark.parametrize("width", [2,4])
def test_nary(op,height,width):
    if height * width <= 8:
        Test = getattr(mantle, op)
        com(f'{op}{height}x{width}', nary(Test, height, width) )


@pytest.mark.parametrize("op", [
    "Invert",
])
@pytest.mark.parametrize("width", [2,3,4,8])
def test_unary(op,width):
    Test = getattr(mantle, op)
    com(f'{op}{width}', unary(Test, width) )

def test_not():
    pass
