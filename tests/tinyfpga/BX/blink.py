import magma as m
from mantle import Counter
from loam.boards.tinyfpga import BX

N = 24

b = BX()
b.Clock.on() # 16Mhz default
b.LED.on()

main = b.DefineMain()
counter = Counter(N)
m.wire(counter.O[-1], main.LED)
m.EndCircuit()
