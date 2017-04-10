from magma import *

def d(board, n):

    class _DRAM(Part):

        name = 'DRAM'
        IO = [
            "inout MIO", Array(54,Bit),
            "output DDR_WEB", Bit,
            "inout DDR_VRP", Bit,
            "inout DDR_VRN", Bit,
            "inout DDR_RAS_n", Bit,
            "inout DDR_ODT", Bit,
            "inout DDR_DRSTB", Bit,
            "inout DDR_DQS", Array(4,Bit),
            "inout DDR_DQS_n", Array(4,Bit),
            "inout DDR_DQ", Array(32,Bit),
            "inout DDR_DM", Array(4,Bit),
            "inout DDR_CS_n", Bit,
            "inout DDR_CKE", Bit,
            "inout DDR_Clk", Bit,
            "inout DDR_Clk_n", Bit,
            "inout DDR_CAS_n", Bit,
            "inout DDR_BankAddr", Array(3,Bit),
            "inout DDR_Addr", Array(15,Bit),
            "inout PS_PORB", Bit,
            "inout PS_SRSTB", Bit,
            "inout PS_CLK", Bit
        ]

        def __init__(self, board, name=''):
            Part.__init__(self, board, "LED")

        def on(self, n):
            assert n <= self.n
            for i in range(n):
                inst = self.I[i].trace().inst
                inst.output().on()
            Part.on(self)
            return self

    return _DRAM(n, board)
