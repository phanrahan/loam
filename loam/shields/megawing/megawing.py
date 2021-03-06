from magma import *

from loam.parts.generic.switch import Switches
from loam.parts.generic.led import LEDs
from loam.parts.generic.joystick import Joystick
#from loam.parts.generic.display import Display
#from loam.peripherals.display import DisplayRefresh
from loam import Board
from loam.boards.papilioone import PapilioOne
from loam.boards.papiliopro import PapilioPro

#from .audio import Audio
#from .vga import VGA

class MegaWing(Board):

    def __init__(self, papilio):
        Board.__init__(self, "MegaWing")

        self.papilio = papilio()
        self.fpga = self.papilio.fpga

        A = self.papilio.A
        B = self.papilio.B
        C = self.papilio.C

        self.Clock = self.papilio.Clock

        #self.Timer = self.papilio.Timer

        #self.usart = self.papilio.usart

        # A header

        #self.Display = Display(board=self)
        #self.refresh = DisplayRefresh(self.papilio.fpga)
        #self.Display.peripheral(self.refresh)

        #print('wiring cathodes')
        #cathodes = [A[7], A[10], A[5], A[6], A[3], A[4], A[9], A[ 1]]
        #for i in range(len(cathodes)):
            #cathodes[i].rename("CATHODES[%d]" % i).output()
            #wire(cathodes[i], self.Display.cathodes[i])
            #wire(self.refresh.cathodes[i], cathodes[i])

        #print('wiring anodes')
        #anodes = [A[11], A[8], A[2], A[0]]
        #for i in range(len(anodes)):
            #anodes[i].rename("ANODES[%d]" % i).output()
            #wire(anodes[i], self.Display.anodes[i])
            #wire(self.refresh.anodes[i], anodes[i])

        # self.SPI = 
        #A[12].rename('CS').output()
        #A[13].rename('MISO').input()
        #A[14].rename('MOSI').output()
        #A[15].rename('SCLK').output()
        #wire(A[12], self.SPI.CS)
        #wire(self.SPI.MISO, A[13])
        #wire(A[14], self.SPI.MOSI)
        #wire(A[15], self.SPI.SCLK)


        # B header

        #self.VGA = VGA(self)
        #vga = [
        #    B[7], B[8], B[9], # R
        #    B[4], B[5], B[6], # G
        #    B[2], B[3] ]      # B
        #for i in range(len(vga)):
        #    vga[i].rename("VGA_RGB[%d]" % i).output()
        #    wire(vga[i], self.VGA.I[i])
        #B[0].rename("VGA_VSYNC").output()
        #wire(B[0], self.VGA.HSYNC)
        #B[1].rename("VGA_HSYNC").output()
        #wire(B[1], self.VGA.VSYNC)

        #self.Audio = Audio(self)
        #B[10].rename('AUDIO').output()
        #wire(B[10], self.Audio.I)

        #print("wiring joystick")
        self.Joystick = Joystick(board=self)
        B[15].rename('SELECT').input()
        B[14].rename('UP').input()
        B[13].rename('DOWN').input()
        B[12].rename('LEFT').input()
        B[11].rename('RIGHT').input()
        wire( self.Joystick.SELECT, B[15] )
        wire( self.Joystick.UP,     B[14] )
        wire( self.Joystick.DOWN,   B[13] )
        wire( self.Joystick.LEFT,   B[12] )
        wire( self.Joystick.RIGHT,  B[11] )


        # C header

        #print('wiring switch')
        self.Switch = Switches(8, name='Switch', board=self)
        for i in range(8):
            C[i].rename("SWITCH[%d]" % i).input()
            wire(self.Switch.O[i], C[i])

        #print('wiring led')
        self.LED = LEDs(8, name='LED', board=self)
        for i in range(8):
            C[8+i].rename("LED[%d]" % i).output()
            wire(C[8+i], self.LED.I[i])
