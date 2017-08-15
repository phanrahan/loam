import sys
if sys.version_info < (3, 3):
    from funcsigs import signature
else:
    from inspect import signature
from magma import wire, compile
from loam.boards.icestick import IceStick
from mantle import Not, Or
from testharness import test

icestick = IceStick()
icestick.Clock.on()
icestick.D1.on()
icestick.D2.on()
icestick.D3.on()
icestick.D4.on()
icestick.D5.on()

main = icestick.main()

def or_(x0, x1, x2):
    return x0 | x1 | x2

result = test(Or(3), or_)

wire(result, main.D1)
wire(result, main.D2)
wire(result, main.D3)
wire(result, main.D4)
wire(Not()(result), main.D5)

compile(sys.argv[1], main)
