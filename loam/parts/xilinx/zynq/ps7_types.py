from magma import *
from mantle.types import AxiPort

def axi_type():
  return Tuple(
    S2M=Tuple(
      gp0=Flip(AxiPort(32,32,12)),
      gp1=Flip(AxiPort(32,32,12)),
    ),
    M2S=Tuple(
      gp0=AxiPort(32,32,6),
      gp1=AxiPort(32,32,6),
      hp0=AxiPort(64,32,6),
      hp1=AxiPort(64,32,6),
      hp2=AxiPort(64,32,6),
      hp3=AxiPort(64,32,6),
      acp=AxiPort(64,32,3),
    )
  )

def DDR_type():
  return Tuple(
    Clk=InOut(Bit),
    Clk_n=InOut(Bit),
    CKE=InOut(Bit),
    CS_n=InOut(Bit),
    RAS_n=InOut(Bit),
    CAS_n=InOut(Bit),
    WEB=Out(Bit),
    BankAddr=InOut(Bits(3)),
    Addr=InOut(Bits(15)),
    ODT=InOut(Bit),
    DRSTRB=InOut(Bit),
    DQ=InOut(Bits(32)),
    DM=InOut(Bits(4)),
    DQS=InOut(Bits(4)),
    DQS_n=InOut(Bits(4)),
    VRN=InOut(Bit),
    VRP=InOut(Bit)
  )

def PS_type():
  return Tuple(
    srstb=InOut(Bit),
    clk=InOut(Bit),
    porb=InOut(Bit)
  )

def ps7_type():
  return Tuple(
    fclk=Out(Bits(4)),
    frst_n=Out(Bits(4)),
    PS=PS_type(),
    MIO=InOut(Bits(54)),
    #EMIO=,
    DDR=DDR_type(),
    AXI=ps7_axi_type(),
    #DMA=,
    #EVENT=,
    #FCLKRTIGN=,
    #FPGAIDLEN=,
    #FTM=
    #IRQF2P=
  )

if __name__ == "__main__":
  print(ps7_type())
