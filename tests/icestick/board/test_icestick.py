import os
os.environ['MANTLE_TARGET'] = 'ice40'
os.environ['MANTLE'] = 'lattice'
from loam.boards.icestick import IceStick

def test_icestick():
    icestick = IceStick()
    assert icestick
