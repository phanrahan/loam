import magma as m
from loam import Board
from loam.parts.silego.greenpak4 import SLG46620V

class GPDevBoard(Board):

    def __init__(self):

        super(GPDevBoard, self).__init__("gpdevboard")

        self.fpga = fpga = SLG46620V(board=self)

if __name__ == '__main__':
    gpdevboard = GPDevBoard()
