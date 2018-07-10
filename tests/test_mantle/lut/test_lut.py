import pytest
import magma
import mantle
from ..harness import nary

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


@pytest.mark.parametrize("n", range(8))
def test_lut(n):
    n = n+1
    def Test(n, width):
        return mantle.LUT((1<<n)//2*[0,1], n)
    com('lut'+str(n), nary(Test, n, 1, output_isbits=False))

