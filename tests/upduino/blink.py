import magma as m
from mantle import Counter
from mantle.lattice.ice40up import SB_HFOSC
from loam.boards.upduino import Upduino

N = 25

up = Upduino()
up.LED_R.on()
up.LED_G.on()
up.LED_B.on()

# 48 Mhz
#SB_HFOSC u_hfosc (
#        .CLKHFPU(1'b1),
#        .CLKHFEN(1'b1),
#        .CLKHF(clk)
#);

main = up.DefineMain()
hf = SB_HFOSC()
clk = hf(1,1)
counter = Counter(N)
m.wire(clk, counter.CLK)
m.wire(counter.O[-1], main.LED_R)
m.wire(counter.O[-1], main.LED_G)
m.wire(counter.O[-1], main.LED_B)
m.EndCircuit()
