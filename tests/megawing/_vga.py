import sys
from magma import *
from mantle import *
from loam.shields.megawing import MegaWing

def nbv(w,x):
    res = []
    for i in range(1,w + 1):
        res.append((x >> (i - 1)) & 1)
    return Array(w, Bit)(*res)

megawing = MegaWing()
megawing.Clock.frequency(25000000).on()
megawing.VGA.on()
megawing.LED.on(8)

main = megawing.main()

def VGAController_simple():

    _def = DefineCircuit("VGA_640_480", 
            "input CLK", Bit,
            "output HSYNC", Bit, 
            "output VSYNC", Bit,
            "output COUNTX", Array(10, Bit),
            "output COUNTY", Array(10, Bit),
            )
    CLK = _def.CLK
    HSYNC = _def.HSYNC
    VSYNC = _def.VSYNC

    COUNTX = _def.COUNTX
    COUNTY = _def.COUNTY

    countx = Register(10)
    wire(Mux(2, 10)(Add(10)(nbv(10, 1), countx.O), nbv(10, 0), EQ(10)(countx.O, nbv(10, 800))), countx.I)

    county = Register(10)
    incy = Add(10)(nbv(10, 1), county.O)
    resety = EQ(10)(nbv(10, 480 + 11 + 2 + 31), county.O)
    incorz = Mux(2, 10)(incy, nbv(10, 0), resety)

    wire(Mux(2, 10)(county.O, incorz, EQ(10)(nbv(10, 800), countx.O)), county.I)

    wire(Or2()(LT(10)(countx.O, nbv(10, 640 + 16)),
               GT(10)(countx.O, nbv(10, 640 + 16 + 96))), HSYNC)
    wire(Or2()(LT(10)(county.O, nbv(10, 480 + 11)),
               GT(10)(county.O, nbv(10, 480 + 11 + 2))), VSYNC)

    wire(countx.O, COUNTX)
    wire(county.O, COUNTY)

    End()
    return _def()

vgac = VGAController_simple()
wire(main.CLK, vgac.CLK)

# http://www.fpga4fun.com/PongGame.html

xeq256 = EQ(10)(vgac.COUNTX, nbv(10, 256))
test_red = Or2()(vgac.COUNTY[3], xeq256)
test_green = Or2()(Xor2()(vgac.COUNTX[5], vgac.COUNTX[6]), xeq256)
test_blue = Or2()(vgac.COUNTX[4], xeq256)

wire(Array(3,Bit)(*(3 * [test_red])), main.VGA_RGB[0:3])
wire(Array(3,Bit)(*(3 * [test_green])), main.VGA_RGB[3:6])
wire(Array(2,Bit)(*(2 * [test_blue])), main.VGA_RGB[6:8])

wire(vgac.HSYNC, main.VGA_HSYNC)
wire(vgac.VSYNC, main.VGA_VSYNC)

wire(Array(8, Bit)(Not()(vgac.HSYNC),Not()(vgac.VSYNC),0,0,1,1,0,0), main.LED)

compile(sys.argv[1], main)
