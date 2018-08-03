from magma import *
from mantle.types import AxiPort

def ps7_axi_type():
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

if __name__ == "__main__":
  print(ps7_axi_type())
