import magma as m
from mantle import Counter
from loam.boards.icestick import IceStick

icestick = IceStick()
icestick.Clock.on()
icestick.DSR.on()
icestick.CTS.on()
icestick.D1.on()
icestick.D2.on()

main = icestick.main()

N = 26

counter = Counter(N)
O, _ = counter()
main.DSR <= O[-2]
main.D1 <= O[-2]

main.CTS <= O[-1]
main.D2 <= O[-1]

m.EndCircuit()
