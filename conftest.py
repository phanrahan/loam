# content of conftest.py
import sys
import pytest
import magma


def pytest_addoption(parser):
    parser.addoption("--target", action="store", default="coreir")

def pytest_configure(config):
    target = config.getoption('--target')
    magma.set_mantle_target(target)

@pytest.fixture(autouse=True)
def mantle_test():
    import magma.config
    magma.config.set_compile_dir('callee_file_dir')

    """
    Clear the circuit cache before running, allows name reuse across tests
    without collisions
    """
    from magma import clear_cachedFunctions
    clear_cachedFunctions()

    from magma.circuit import magma_clear_circuit_cache
    magma_clear_circuit_cache()

