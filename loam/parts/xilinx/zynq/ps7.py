from magma import wire DefineFromVerilogFile
from mantle.xilinx.spartan6 import BUFG
from loam import Peripheral
from .ps7_types import ps7_type

#This is the PS7 black box with a higher level interface
class PS7_wrap(Circuit):
  IO = ps7_type()
  @classmethod
  def definition(io):

    #TODO Why does this not work?
    ps7 = DefineFromVerilogFile("collateral/ps7_wrap.v")
    
    #Wire the clocks
    wire(ps7.FCLKCLK,io.fclk)

    #Wire the resets
    wire(ps7.FCLKRESETN,io.frst_n)
    
    #MIO
    wire(ps7.MIO,io.MIO)
    
    #PS signals
    wire(ps7.PS_SRSTB,io.PS.srstb)
    wire(ps7.PS_CLK,io.PS.clk)
    wire(ps7.PS_PORB,io.PS.porb)

    #DDR signals
    for name in io.DDR.Ks:
      io_port = getattr(io.DDR,name)
      ps7_port = getattr(ps7,"DDR_"+name)
      wire(io_port,ps7_port)

    #Axi signals
    def wire_ready_valid(ps7_prefix,io_prefix):
      wire(getattr(ps7,ps7_prefix+"READY"),io_prefix.ready)
      wire(getattr(ps7,ps7_prefix+"VALID"),io_prefix.valid)
      #Wire all the other signals
      for name,io_port in enumerate(io_prefix.data.Ks):
        ps7_port = ps7_prefix + to_upper(name)
        wire(io_port,getattr(ps7,ps7_port))
    
    for dirname in ["S2M","M2S"]
      
      #Like GP0,HP0,etc
      for portkind,io_dir in enumerate(getattr(io.AXI,dirname).Ks):
        ps7_prefix = "%s_%s_AXI_" % (dirname,portkind)
        io_prefix = getattr(getattr(io.AXI,dirname),portkind)
        #Wire the clock
        wire(io_prefix.clk, getattr(ps7,ps7_prefix+"ACLK"))

        #Wire the read port
        #Read Addr
        wire_ready_valid(ps7_prefix+"AR",io_prefix.read.addr)
        #Read Data
        wire_ready_valid(ps7_prefix+"R",io_prefix.read.data)

        #Wire the write port
        #Write Addr
        wire_ready_valid(ps7_prefix+"AW",io_prefix.write.addr)
        
        #Write Data
        wire_ready_valid(ps7_prefix+"W",io_prefix.write.data)
        
        #Write Resp 
        wire_ready_valid(ps7_prefix+"B",io_prefix.write.resp)

#"Processing System 7"
class PS7(Peripheral):
  name = 'ps7'

  def __init__(self, fpga,name='ps7'):
    Peripheral.__init__(self, fpga, name)

  def on(self):
    Peripheral.on(self)
    return self

  #Instantiate a PS7 module
  def setup(self, main):
    
    ps7 = PS7_wrap(name="ps7_inst")
    #for now just have the instance be accessable by main
    
    #Add buffers to all the clocks
    #And allow the clock to be accessable by main
    setattr(main,fclk,[])
    for i in range(4):
      bufg = BUFG()
      wire(ps7.fclk[i], bufg.I)
      main.fclk.append(bufg.O)

    #Have nice interfaces for DDR, MIO, PS, and AXI
    self.DDR = ps7.DDR
    self.MIO = ps7.MIO
    self.PS = ps7.PS
    #Should eventually split AXI ports into separate peripherals themselves in which you can declare that you are using each axi port
    self.AXI = ps7.AXI

