import os, csv
from loam import FPGA
from ..lattice import Lattice
from .gpio import Pin, GPIO
from .clock import Clock
from .usart import USART

__all__  = ['ICE40HX1K', 'ICE40HX8K']
__all__ += ['ICE40LP1K', 'ICE40LP8K']
__all__ += ['ICE40UP5K']


class HX(Lattice):
    family = 'ice40'

    def __init__(self, name, board):
        super(HX,self).__init__(name, board)

        self.clock = Clock(self)

        self.USART = USART

    def VQ100(self):
        self.package = 'VQ100'

        # Note that these are named as bank / pin
        #
        # The lattice names are different: see iCE40PinoutHX1K.xlsx

        GPIO(self, 'IOL_1A', 1)
        GPIO(self, 'IOL_1B', 2)
        GPIO(self, 'IOL_2A', 3)
        GPIO(self, 'IOL_2B', 4)
        GPIO(self, 'IOL_3A', 7)
        GPIO(self, 'IOL_3B', 8)
        GPIO(self, 'IOL_5A', 9)
        GPIO(self, 'IOL_5B', 10)
        GPIO(self, 'IOL_6A', 12)
        GPIO(self, 'IOL_6B', 13)
        GPIO(self, 'IOL_7A', 15)
        GPIO(self, 'IOL_7B', 16)
        GPIO(self, 'IOL_8A', 18)
        GPIO(self, 'IOL_8B', 19)
        GPIO(self, 'IOL_10A', 20)
        GPIO(self, 'IOL_10B', 21)
        GPIO(self, 'IOL_12A', 24)
        GPIO(self, 'IOL_12B', 25)

        # Bank B
        GPIO(self, 'IOB_26', 26)
        GPIO(self, 'IOB_27', 27)
        GPIO(self, 'IOB_28', 28)
        GPIO(self, 'IOB_29', 29)
        GPIO(self, 'IOB_30', 30)
        # 31 32
        GPIO(self, 'IOB_33', 33)
        GPIO(self, 'IOB_34', 34)
        # 35
        GPIO(self, 'IOB_36', 36)
        GPIO(self, 'IOB_37', 37)
        # 38 39
        GPIO(self, 'IOB_40', 40)
        GPIO(self, 'IOB_41', 41)
        GPIO(self, 'IOB_42', 42)

        GPIO(self, 'IOB_43', 43) # CDONE
        GPIO(self, 'IOB_44', 44) # CRESET_B

        GPIO(self, 'IOB_45', 45) # SDO
        GPIO(self, 'IOB_46', 46) # SDI
        # 47
        GPIO(self, 'IOB_48', 48) # SCK
        GPIO(self, 'IOB_49', 49) # SS


        # Bank R
        GPIO(self, 'IOR_51', 51)
        GPIO(self, 'IOR_52', 52)
        GPIO(self, 'IOR_53', 53)
        GPIO(self, 'IOR_54', 54)
        # GND 55
        GPIO(self, 'IOR_56', 56)
        GPIO(self, 'IOR_57', 57)
        # VCC 57
        GPIO(self, 'IOR_59', 59)
        GPIO(self, 'IOR_60', 60)
        # VCC 61
        GPIO(self, 'IOR_60_GBIN3', 60)
        GPIO(self, 'IOR_61_GBIN2', 61)
        GPIO(self, 'IOR_62', 62)
        GPIO(self, 'IOR_63', 63)
        GPIO(self, 'IOR_64', 64)
        GPIO(self, 'IOR_65', 65)
        # VCC 67
        GPIO(self, 'IOR_68', 68)
        GPIO(self, 'IOR_69', 69)
        # GND 70
        GPIO(self, 'IOR_71', 71)
        GPIO(self, 'IOR_72', 72)
        GPIO(self, 'IOR_73', 73)
        GPIO(self, 'IOR_74', 74)
        # VPP 75

        # Bank T
        GPIO(self, 'IOT_78', 78)
        GPIO(self, 'IOT_79', 79)
        GPIO(self, 'IOT_80', 80)
        GPIO(self, 'IOT_81', 81)

        GPIO(self, 'IOT_90', 90)
        GPIO(self, 'IOT_91', 91)
        # 92
        GPIO(self, 'IOT_93', 93)
        GPIO(self, 'IOT_94', 94)
        GPIO(self, 'IOT_95', 95)
        GPIO(self, 'IOT_96', 96)
        GPIO(self, 'IOT_97', 97)
        GPIO(self, 'IOT_99', 99)
        GPIO(self, 'IOT_100', 100)

    def TQ144(self):
        self.package = 'TQ144'

        # Special
        GPIO(self, "PIOS_00", 70)
        GPIO(self, "PIOS_01", 68)
        GPIO(self, "PIOS_02", 67)
        GPIO(self, "PIOS_03", 71)

        # Bank 0
        GPIO(self, "PIO0_02", 112)
        GPIO(self, "PIO0_03", 113)
        GPIO(self, "PIO0_04", 114)
        GPIO(self, "PIO0_05", 115)
        GPIO(self, "PIO0_06", 116)
        GPIO(self, "PIO0_07", 117)
        GPIO(self, "PIO0_08", 118)
        GPIO(self, "PIO0_09", 119)
        # ...
        # PIO0_22, 144

        # Bank 1
        GPIO(self, "PIO1_02", 78)
        GPIO(self, "PIO1_03", 79)
        GPIO(self, "PIO1_04", 80)
        GPIO(self, "PIO1_05", 81)
        GPIO(self, "PIO1_06", 87)
        GPIO(self, "PIO1_07", 88)
        GPIO(self, "PIO1_08", 90)
        GPIO(self, "PIO1_09", 91)
        GPIO(self, "PIO1_10", 95) # D5
        GPIO(self, "PIO1_11", 96) # D4
        GPIO(self, "PIO1_12", 97) # D3
        GPIO(self, "PIO1_13", 98) # D2
        GPIO(self, "PIO1_14", 99) # D1
        GPIO(self, "PIO1_15", 101)
        GPIO(self, "PIO1_16", 102)
        GPIO(self, "PIO1_17", 104)
        GPIO(self, "PIO1_18", 105) # IRTXD
        GPIO(self, "PIO1_19", 106) # IRRXD
        GPIO(self, "PIO1_20", 107) # SD


        # Bank 2
        GPIO(self, "PIO2_10", 44)
        GPIO(self, "PIO2_11", 45)
        GPIO(self, "PIO2_12", 47)
        GPIO(self, "PIO2_13", 48)
        GPIO(self, "PIO2_14", 56)
        GPIO(self, "PIO2_15", 60)
        GPIO(self, "PIO2_16", 61)
        GPIO(self, "PIO2_17", 62)

        # Bank 3
        GPIO(self, "PIO3_00", 21) # CLK
        GPIO(self, "PIO3_01", 20) # 
        GPIO(self, "PIO3_02", 1)  # DCD
        GPIO(self, "PIO3_03", 2) # DSR / RESETQ
        GPIO(self, "PIO3_04", 3) # DTR
        GPIO(self, "PIO3_05", 4) # CTS
        GPIO(self, "PIO3_06", 7) # RTS
        GPIO(self, "PIO3_07", 8) # TXD
        GPIO(self, "PIO3_08", 9) # RXD

        # Configuration pins
        #set_io CDONE 65
        #set_io CRESET_B 66
        #GPIO(self, "CDONE", 65)
        #GPIO(self, "CRESET", 66)

    def CT256(self):
        self.package = 'CT256'

        # Special
        GPIO(self, "PIOS_00", "P12")
        GPIO(self, "PIOS_01", "R12")
        GPIO(self, "PIOS_02", "R11")
        GPIO(self, "PIOS_03", "P11")

        # Bank 0
        GPIO(self, "PIO0_01", "B15")
        GPIO(self, "PIO0_03", "B14")
        GPIO(self, "PIO0_07", "A16")
        GPIO(self, "PIO0_08", "A15")
        GPIO(self, "PIO0_09", "B13")
        GPIO(self, "PIO0_13", "B12")
        GPIO(self, "PIO0_14", "B10")

        GPIO(self, "PIO0_39", "B5")
        GPIO(self, "PIO0_41", "B4")
        GPIO(self, "PIO0_42", "A2")
        GPIO(self, "PIO0_44", "A1")
        GPIO(self, "PIO0_45", "C5")
        GPIO(self, "PIO0_46", "C4")
        GPIO(self, "PIO0_47", "B3")
        GPIO(self, "PIO0_51", "C3")
        # ...

        # Bank 1
        GPIO(self, "PIO1_01", "R15")
        GPIO(self, "PIO1_03", "P15")
        GPIO(self, "PIO1_04", "P16")
        GPIO(self, "PIO1_05", "K15")
        GPIO(self, "PIO1_06", "K14")
        GPIO(self, "PIO1_07", "G14")
        GPIO(self, "PIO1_08", "N16")
        GPIO(self, "PIO1_09", "H16")
        GPIO(self, "PIO1_12", "M16")
        GPIO(self, "PIO1_14", "M15")
        GPIO(self, "PIO1_16", "L16")
        GPIO(self, "PIO1_18", "K14")
        GPIO(self, "PIO1_19", "J15")
        GPIO(self, "PIO1_20", "K15")
        GPIO(self, "PIO1_21", "K16")
        GPIO(self, "PIO1_22", "J14")
        GPIO(self, "PIO1_28", "H16")
        GPIO(self, "PIO1_29", "H14")
        GPIO(self, "PIO1_30", "G16")
        GPIO(self, "PIO1_32", "G15")
        GPIO(self, "PIO1_34", "F16")
        GPIO(self, "PIO1_36", "F15")
        GPIO(self, "PIO1_37", "G14")
        GPIO(self, "PIO1_38", "E16")
        GPIO(self, "PIO1_40", "D16")
        GPIO(self, "PIO1_42", "F14")
        GPIO(self, "PIO1_44", "D15")
        GPIO(self, "PIO1_46", "E14")
        GPIO(self, "PIO1_47", "C16")
        GPIO(self, "PIO1_49", "B16")
        GPIO(self, "PIO1_51", "D14")
        # ...

        # Bank 2
        GPIO(self, "PIO2_10", "P1")
        GPIO(self, "PIO2_11", "N3")
        GPIO(self, "PIO2_12", "M2")
        GPIO(self, "PIO2_13", "L3")
        GPIO(self, "PIO2_14", "K3")
        GPIO(self, "PIO2_15", "J2")
        GPIO(self, "PIO2_16", "H2")
        GPIO(self, "PIO2_17", "G2")
        # ...

        # Bank 3
        # ...
        GPIO(self, "PIO3_26", "J3")

        # Configuration pins
        GPIO(self, "A16", "A16")


class ICE40HX1K(HX):
    part = 'ice40hx1k'

    def __init__(self, name='hx1k', board=None, package='tq144'):
        assert package in ['vq100', 'tq144']
        super(ICE40HX1K,self).__init__(name, board)
        if   package == 'tq144':
            self.TQ144()
        elif package == 'vq100':
            self.VQ100()


class ICE40HX8K(HX):
    part = 'ice40hx8k'

    def __init__(self, name='hx8k', board=None, package='ct256'):
        assert package in ['ct256']
        super(ICE40HX8K,self).__init__(name, board)
        if   package == 'ct256':
            self.CT256()



class LP(Lattice):
    family = 'ice40'

    def __init__(self, name, board):
        super(LP,self).__init__(name, board)

        self.clock = Clock(self)

        self.USART = USART


    def readpins(self, package):
        dir = os.path.join(os.path.dirname(__file__), 'pins')
        filename = os.path.join(dir,package+'.csv')

        f = open(filename, 'r')
        row = csv.reader(f)

        '''
        iCE40-LP8K-CM81
        pin,bank,type,name
        C2,3,IO,IOL_2A
        '''
        header = next(row)
        for data in row:
            if data[2] == 'IO':
                #print(data[3], data[0])
                GPIO(self, data[3], data[0])

    def CM81(self):
        self.package = 'CM81'
        self.readpins('lp8kcm81')

class ICE40LP1K(LP):
    part = 'ice40lp1k'
    def __init__(self, name='lp1k', board=None, package='cm81'):
        assert package in ['cm81']
        super(ICE40LP1K,self).__init__(name, board)
        if   package == 'cm81':
            self.CM81()


class ICE40LP8K(LP):
    part = 'ice40lp8k'
    def __init__(self, name='lp8k', board=None, package='cm81'):
        assert package in ['cm81']
        super(ICE40LP8K,self).__init__(name, board)
        if   package == 'cm81':
            self.CM81()


# UltraScale Plus
class UP(Lattice):
    family = 'ice40'

    def readpins(self, package):
        dir = os.path.join(os.path.dirname(__file__), 'pins')
        filename = os.path.join(dir,package+'.csv')

        f = open(filename, 'r')
        row = csv.reader(f)

        '''
        iCE40-LP8K-CM81
        name,type,bank,pair,UW30,SG48
        IOB_0a,PIO,2,,E5,46
        '''
        header = next(row)
        for data in row:
            if data[1].startswith('PIO') \
            or data[1].startswith('DPIO') \
            or data[1].startswith('LED'):
                #print(data[1], data[0])
                if   self.package == 'SG48' and data[5] != '-':
                    GPIO(self, data[0], data[5])
                elif self.package == 'UW30' and data[6] != '-':
                    GPIO(self, data[0], data[6])

    def SG48(self):
        self.package = 'SG48'
        self.readpins('up5k')

    def UW30(self):
        self.package = 'UW30'
        self.readpins('up5k')

class ICE40UP5K(UP):
    part = 'ice40up5k'
    def __init__(self, name='up5k', board=None, package='sg48'):
        assert package in ['sg48']
        super(ICE40UP5K,self).__init__(name, board)
        if   package == 'sg48':
            self.SG48()

