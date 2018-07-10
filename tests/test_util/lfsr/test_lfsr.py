import pytest
import mantle
from ..harness import show

def com(name, main):
    import magma
    from magma.testing import check_files_equal
    name += '_' + magma.mantle_target
    build = 'build/' + name
    gold = 'gold/' + name
    magma.compile(build, main)
    assert check_files_equal(__file__, build+'.v',   gold+'.v')
    assert check_files_equal(__file__, build+'.pcf', gold+'.pcf')


@pytest.mark.parametrize("width", [3,4,5,6,7,8])
def test_lfsr(width):
    from mantle.util.lfsr import DefineLFSR
    Test = DefineLFSR(width)
    com(f'LFSR{width}', show(Test, width))
