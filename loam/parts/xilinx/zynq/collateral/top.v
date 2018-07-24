`include "macros.vh"
module top
  (
    inout [53:0] MIO,
    inout PS_SRSTB,
    inout PS_CLK,
    inout PS_PORB,
    inout DDR_Clk,
    inout DDR_Clk_n,
    inout DDR_CKE,
    inout DDR_CS_n,
    inout DDR_RAS_n,
    inout DDR_CAS_n,
    output DDR_WEB,
    inout [2:0] DDR_BankAddr,
    inout [14:0] DDR_Addr,
    inout DDR_ODT,
    inout DDR_DRSTB,
    inout [31:0] DDR_DQ,
    inout [3:0] DDR_DM,
    inout [3:0] DDR_DQS,
    inout [3:0] DDR_DQS_n,
    inout DDR_VRN,
    inout DDR_VRP,


  );
    
    `include "ps7_include.vh";
    
 

    wire FCLK0;
    BUFG bufg0(.I(FCLKCLK[0]),.O(FCLK0));
    wire FCLK1;
    BUFG bufg1(.I(FCLKCLK[1]),.O(FCLK1));
    
    wire rst_n;
    assign ARESETN = FCLKRESETN[0];
    assign rst_n = ARESETN;
 

endmodule : top

