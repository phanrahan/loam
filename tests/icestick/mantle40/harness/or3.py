import sys
if sys.version_info < (3, 3):
    from funcsigs import signature
else:
    from inspect import signature
from magma import wire, compile
from loam.boards.icestick import IceStick
from mantle import Not, Or, And
from testharness import test

icestick = IceStick()
icestick.Clock.on()
icestick.DSR.on()
icestick.CTS.on()
icestick.D1.on()
icestick.D2.on()
icestick.D3.on()
icestick.D4.on()
icestick.D5.on()

main = icestick.main()

def or_(x0, x1, x2):
    return x0 | x1 | x2

finished, error = test(Or(3), or_)
#finished, error = test(And(3), or_)

wire(finished, main.D3)
wire(finished, main.D4)
wire(finished, main.DSR)

wire(error, main.D1)
wire(error, main.D2)
wire(Not()(error), main.D5)
wire(error, main.CTS)

compile(sys.argv[1], main)
