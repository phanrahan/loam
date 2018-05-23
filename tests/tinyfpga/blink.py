import magma as m
from mantle import Counter
from loam.boards.tinyfpga import B2

N = 24

b2 = B2()
b2.Clock.on() # 16Mhz default
b2.PIN4.on()

main = b2.DefineMain()
counter = Counter(N)
m.wire(counter.O[-1], main.PIN4)
m.EndCircuit()
