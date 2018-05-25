from magma import *

from mantle.xilinx.zynq import PS7
from ..spartan.spartan import Spartan
from ..gpio import GPIO, Pin
from .clock import Clock

class Zynq(Spartan):
    family = 'zynq'

    def __init__(self, name, board, speed):
        Spartan.__init__(self, name, board, speed)

        
    def CLG484(self):
        self.package = 'CLG484'
% for p in clg484:
%   if p.gpio:
        GPIO(self, "${p.name}")
%   else:
        Pin(self, "${p.name}")
%   endif
% endfor

## FPGA:          xc7z020clg484-1
## Device:        xc7z020
## Package:       clg484
## Speed:         -1
class XC7Z020(Zynq):
    part = 'xc7z020'

    def __init__(self, name='', board=None, package='clg484', speed='-1'):
        assert package in ['clg484']
        Zynq.__init__(self, name, board, speed)
        if package == 'clg484':
            self.CLG484()
        
        #TODO Import PS7 peripheral nicely!
        self.ps7 = PS7(self)
        self.ps7.on()

        self.clock = Clock(self)

if __name__ == "__main__":
    fpga = XC7Z020()





#        s = "SLOW"
#        f = "FAST"
#        pinmap = [
#                {'NET':'MIO','DRIVE':"8",'IOSTANDARD':'LVCMOS18','LOC':["C12", "D10", "C10", "D13", "C14", "D11", "B10", "D12", "B9", "E13", "B11", "D8", "C8", "E14", "C13", "F13", "B14", "A9", "F14", "B12", "G13", "C7", "F9", "A11", "E8", "A12", "D7", "A13", "F12", "B7", "E11", "A14", "F11", "A8", "E10", "A7", "E9", "D6", "E6", "B6", "A6", "C5", "B4", "G7", "C4", "E5", "D5", "A4", "A3", "E4", "F6", "A2", "A1", "G6"], 'SLEW':[s,s,s,s,s,s,s,s,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,s,s,s,s,s,s,s,f,s,f,f,f,f,f,f,s]},
#                {'NET':"DDR_WEB", 'SLEW':s,  'IOSTANDARD':'SSTL15', 'LOC':"R4"},
#                {'NET':"DDR_VRP", 'SLEW':f,  'IOSTANDARD':'SSTL15_T_DCI', 'LOC':"N7"},
#                {'NET':"DDR_VRN", 'SLEW':f 'IOSTANDARD':'SSTL15_T_DCI', 'LOC':"M7"},
#                {'NET':"DDR_RAS_n", 'SLEW':s 'IOSTANDARD':'SSTL15', 'LOC':"R5"},
#                {'NET':"DDR_ODT", 'SLEW':s 'IOSTANDARD':'SSTL15', 'LOC':"P5"},
#                {'NET':"DDR_DRSTB", 'SLEW':f 'IOSTANDARD':'SSTL15', 'LOC':"F3"},
#                {'NET':'DDR_DQS', 'LOC':["V2", "N2","H2", "C2"],
#                {'NET':'DDR_DQS_n', 'LOC':["W2", "P2", "J2", "D2"],
#                {'NET':'DDR_DQ', 'LOC':["Y1", "W3", "Y3", "W1", "U2", "AA1", "U1", "AA3", "R1", "M2", "T2", "R3", "T1", "N3", "T3", "M1", "K3", "J1", "K1", "L3", "L2", "L1", "G1", "G2", "F1", "F2", "E1", "E3", "D3", "B2", "C3", "D1"],
#                {'NET':'DDR_DM', 'LOC':["AA2", "P1", "H3", "B1"],
#                {'NET':'DDR_CS_n', 'LOC':"P6",
#                {'NET':'DDR_CKE', 'LOC':"V3",
#                {'NET':'DDR_Clk', 'LOC':"N4",
#                {'NET':'DDR_Clk_n, 'LOC':"N5",
#                {'NET':'DDR_CAS_n', 'LOC':"P3",
#                {'NET':'DDR_ 'LOC':["M6", "L6", "L7"],
#                {'NET':'DDR_ 'LOC':["G4", "F4", "H4", "G5", "J3", "H5", "J5", "J6", "J7", "K5", "K6", "L4", "K4", "M5", "M4"],
#                {'NET': 'LOC':"B5", 
#                {'NET': 'LOC':"C9",
#                {'NET': 'LOC':"F7"
#            ]
 
