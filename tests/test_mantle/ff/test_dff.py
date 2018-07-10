import pytest
import magma
import mantle
from ..harness import unary

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


def test_dff():
    def Test(width):
        return mantle.DFF()
    com(f'DFF', unary(Test, 1,
                          input_isbits=False,
                          output_isbits=False,
                          has_clock=True))
