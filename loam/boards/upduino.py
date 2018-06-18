import magma as m
from loam.parts.lattice.ice40 import ICE40UP5K
from loam import Board

class Upduino(Board):

    def __init__(self):

        super(Upduino, self).__init__("Upduino")

        self.fpga = fpga = ICE40UP5K(board=self, package='sg48')

        self.JP5 = [
           None,
           None, # 3.3
           None, # GND
           fpga.IOT_37a,
           fpga.IOT_36b,
           fpga.IOT_39a,
           fpga.IOT_38b,
           fpga.IOT_43a,
           fpga.IOT_46b_G0,
           fpga.IOT_42b,
           fpga.IOT_45a_G1,
           fpga.IOT_44b,
           fpga.IOT_49a,
           fpga.IOT_48b,
           fpga.IOT_51a,
           fpga.IOT_50b,
           fpga.IOT_41a,
        ]

        self.JP6 = [
           None,
           fpga.IOB_22a,
           fpga.IOB_23b,
           fpga.IOB_24a,
           fpga.IOB_29b,
           fpga.IOB_31b,
           fpga.IOB_20a,
           fpga.IOB_16a,
           fpga.IOB_13b,
           fpga.IOB_3b_G6,
           fpga.IOB_8a,
           fpga.IOB_9b,
           fpga.IOB_4a,
           fpga.IOB_5b,
           fpga.IOB_2a,
           fpga.IOB_0a,
           fpga.IOB_6a,
        ]

        self.LED_R = fpga.RGB2
        self.LED_R.rename('LED_R').output()
        self.LED_G = fpga.RGB1
        self.LED_G.rename('LED_G').output()
        self.LED_B = fpga.RGB0
        self.LED_B.rename('LED_B').output()

