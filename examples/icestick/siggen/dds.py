import math
import magma as m
from mantle import Register, Memory
from loam.boards.icestick import IceStick

def DefineDDS(n):
    class _DDS(m.Circuit):
        name = 'DDS{}'.format(n)
        IO = ['I', m.In(m.UInt(n)), "O", m.Out(m.UInt(n))] + m.ClockInterface()
        @classmethod
        def definition(io):
            reg = Register(n)
            m.wire(reg(m.uint(reg.O) + io.I), io.O)
    return _DDS

def DDS(n):
    return DefineDDS(n)()

icestick = IceStick()
icestick.Clock.on()
for i in range(8):
    icestick.J1[i].input().on()
    icestick.J3[i].output().on()

main = icestick.main()

dds = DDS(16)

sintab = [int(128 + 127 * math.sin(2 * math.pi * i / 256.)) for i in range(256)]
rom = Memory(height=256, width=16, rom=sintab, readonly=True)

phase = m.concat(main.J1, m.bits(0,8))
addr = dds( phase )
O = rom( addr[8:] ) 
m.wire( 1, rom.RE )
m.wire( O[8:16], main.J3 )

m.EndCircuit()

