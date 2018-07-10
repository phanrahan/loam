import magma as m
m.set_mantle_target('spartan6')
from mantle import A0, A1, A2, A3
from mantle.xilinx.mantle6.cascade import HalfCarry, FlatHalfCascade

hc = HalfCarry(2, A0^A1, A1, True)
print(repr(hc.interface))

fhc = FlatHalfCascade(8, 4, A0^A1^A2^A3, A1, True)
print(repr(fhc.interface))

