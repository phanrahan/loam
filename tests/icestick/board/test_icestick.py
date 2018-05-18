import os
os.environ["MANTLE"] = "lattice"
from loam.boards.icestick import IceStick

def test_icestick():
    icestick = IceStick()
    assert icestick

