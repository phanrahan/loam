from magma import *


class SDRAM(Part):
    name = 'SDRAM'

    def __init__(self, name='SDRAM', board=None):
        super(SDRAM, self).__init__(name, board)

        addr = Array(13, Bit)(inst=self, addr="ADDR", direction=INPUT)
        data = Array(16, Bit)(inst=self, addr="DATA", direction=INOUT)

        dqml = Bit(inst=self, addr="DQML", direction=INPUT)
        dqmh = Bit(inst=self, addr="DQMH", direction=INPUT)

        ba = Array(2, Bit)(inst=self, addr="BA", direction=INPUT)

        we = Bit(inst=self, addr="WE", direction=INPUT)
        cas = Bit(inst=self, addr="CAS", direction=INPUT)
        ras = Bit(inst=self, addr="RAS", direction=INPUT)

        cs = Bit(inst=self, addr="CS", direction=INPUT)
        clk = Bit(inst=self, addr="CLK", direction=INPUT)
        cke = Bit(inst=self, addr="CKE", direction=INPUT)

        args = ["input ADDR", addr, "inout DATA", data,
                "input DQML", dqml, "input DQMH", dqmh,
                "input BA", ba,
                "input WE", we, "input CAS", cas, "input RAS", ras,
                "input CS", cs, "input CLK", clk, "input CKE", cke]

        self.interface = Interface(args, self)
        self.setports()

    def on(self):

        # print("SELF",self.ADDR,self.DATA)
        # print("SELF",type(self.ADDR),type(self.DATA))
        # print(self.used)
        for i in range(13):
            t = self.ADDR[i].trace()
            # print("addrt:",t)
            if t:
                t.inst.on()

        for i in range(16):
            t = self.DATA[i].trace()
            if t:
                t.inst.on()

        t = self.DQML.trace()
        if t:
            t.inst.on()
        t = self.DQMH.trace()
        if t:
            t.inst.on()

        t = self.BA[0].trace()
        if t:
            t.inst.on()
        t = self.BA[1].trace()
        if t:
            t.inst.on()

        t = self.WE.trace()
        if t:
            t.inst.on()
        t = self.RAS.trace()
        if t:
            t.inst.on()
        t = self.CAS.trace()
        if t:
            t.inst.on()

        t = self.CS.trace()
        if t:
            t.inst.on()
        t = self.CLK.trace()
        if t:
            t.inst.on()
        t = self.CKE.trace()
        if t:
            t.inst.on()

        Part.on(self)

        return self
