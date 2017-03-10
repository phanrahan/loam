module axi_slave_stub(

    output S2M_AXI_ACLK,

    // Read interface
    input S2M_AXI_ARVALID,
    output S2M_AXI_ARREADY,
    input [31:0] S2M_AXI_ARADDR,
    input [11:0] S2M_AXI_ARID,

    output S2M_AXI_RVALID,
    input S2M_AXI_RREADY,
    output S2M_AXI_RLAST,
    output [31:0] S2M_AXI_RDATA,
    output [11:0] S2M_AXI_RID,

    output [1:0] S2M_AXI_RRESP,

    //write interface
    input S2M_AXI_AWVALID,
    output S2M_AXI_AWREADY,
    input [31:0] S2M_AXI_AWADDR,
    input [11:0] S2M_AXI_AWID,

    input S2M_AXI_WVALID,
    output S2M_AXI_WREADY,
    input [31:0] S2M_AXI_WDATA,
    input [3:0] S2M_AXI_WSTRB,

    output S2M_AXI_BVALID,
    input S2M_AXI_BREADY,
    output [1:0] S2M_AXI_BRESP,
    output [11:0] S2M_AXI_BID
);
    
    assign S2M_AXI_ACLK = 1'b0;
    // Read interface
    assign S2M_AXI_ARREADY = 1'b0;
    assign S2M_AXI_RVALID = 1'b0;
    assign S2M_AXI_RLAST = 1'b0;
    assign S2M_AXI_RDATA = 32'b0;
    assign S2M_AXI_RID = 12'b0;
    assign S2M_AXI_RRESP = 2'b0;

    //write interface
    assign S2M_AXI_AWREADY = 1'b0;
    assign S2M_AXI_WREADY = 1'b0;
    assign S2M_AXI_BVALID = 1'b0;
    assign S2M_AXI_BRESP = 2'b0;
    assign S2M_AXI_BID = 12'b0;


endmodule : axi_slave_stub


/*

    axi_slave_stub axi_slave_XXX_stub(    
        .S2M_AXI_ACLK\(S2M_XXX_AXI_ACLK),
        // Read interface
        .S2M_AXI_ARVALID(S2M_XXX_AXI_ARVALID),
        .S2M_AXI_ARREADY(S2M_XXX_AXI_ARREADY),
        .S2M_AXI_ARADDR(S2M_XXX_AXI_ARADDR[31:0]),
        .S2M_AXI_ARID(S2M_XXX_AXI_ARID[11:0]),

        .S2M_AXI_RVALID(S2M_XXX_AXI_RVALID),
        .S2M_AXI_RREADY(S2M_XXX_AXI_RREADY),
        .S2M_AXI_RLAST(S2M_XXX_AXI_RLAST),
        .S2M_AXI_RDATA(S2M_XXX_AXI_RDATA[31:0]),
        .S2M_AXI_RID(S2M_XXX_AXI_RID[11:0]),

        .S2M_AXI_RRESP(S2M_XXX_AXI_RRESP[1:0]),

        //write interface
        .S2M_AXI_AWVALID(S2M_XXX_AXI_AWVALID),
        .S2M_AXI_AWREADY(S2M_XXX_AXI_AWREADY),
        .S2M_AXI_AWADDR(S2M_XXX_AXI_AWADDR[31:0]),
        .S2M_AXI_AWID(S2M_XXX_AXI_AWID[11:0]),

        .S2M_AXI_WVALID(S2M_XXX_AXI_WVALID),
        .S2M_AXI_WREADY(S2M_XXX_AXI_WREADY),
        .S2M_AXI_WDATA(S2M_XXX_AXI_WDATA[31:0]),
        .S2M_AXI_WSTRB(S2M_XXX_AXI_WSTRB[3:0]),

        .S2M_AXI_BVALID(S2M_XXX_AXI_BVALID),
        .S2M_AXI_BREADY(S2M_XXX_AXI_BREADY),
        .S2M_AXI_BRESP(S2M_XXX_AXI_BRESP[1:0]),
        .S2M_AXI_BID(S2M_XXX_AXI_BID[11:0])
    );

*/


// Used for 32 bit data axi ports like GP0/GP1
module axi_master32_stub(
    output M2S_AXI_ACLK,

    //Read Transaction

    output M2S_AXI_ARVALID,
    input M2S_AXI_ARREADY,
    output [31:0] M2S_AXI_ARADDR,
    output [1:0] M2S_AXI_ARBURST,
    output [3:0] M2S_AXI_ARLEN,
    output [1:0] M2S_AXI_ARSIZE,
    //
    input M2S_AXI_RVALID,
    output M2S_AXI_RREADY,
    input M2S_AXI_RLAST,
    input [31:0] M2S_AXI_RDATA,
    //
    input [1:0] M2S_AXI_RRESP,

    // Write Transaction
    output M2S_AXI_AWVALID,
    input M2S_AXI_AWREADY,
    output [31:0] M2S_AXI_AWADDR,
    output [1:0] M2S_AXI_AWBURST,
    output [3:0] M2S_AXI_AWLEN,
    output [1:0] M2S_AXI_AWSIZE,
    //
    output M2S_AXI_WVALID,
    input M2S_AXI_WREADY,
    output M2S_AXI_WLAST,
    output [31:0] M2S_AXI_WDATA,
    output [3:0] M2S_AXI_WSTRB,
    //
    input M2S_AXI_BVALID,
    output M2S_AXI_BREADY,
    input [1:0] M2S_AXI_BRESP

);
    assign M2S_AXI_ACLK = 1'b0;

    //Read Transaction

    assign M2S_AXI_ARVALID = 1'b0;
    assign M2S_AXI_ARADDR = 32'b0;
    assign M2S_AXI_ARBURST = 2'b0;
    assign M2S_AXI_ARLEN = 4'b0;
    assign M2S_AXI_ARSIZE = 2'b0;
    assign M2S_AXI_RREADY = 1'b0;

    // Write Transaction
    assign M2S_AXI_AWVALID = 1'b0;
    assign M2S_AXI_AWADDR = 32'b0;
    assign M2S_AXI_AWBURST = 2'b0;
    assign M2S_AXI_AWLEN = 4'b0;
    assign M2S_AXI_AWSIZE = 2'b0;
    assign M2S_AXI_WVALID = 1'b0;
    assign M2S_AXI_WLAST = 1'b0;
    assign M2S_AXI_WDATA = 32'b0;
    assign M2S_AXI_WSTRB = 4'b0;
    assign M2S_AXI_BREADY = 1'b0;


endmodule : axi_master32_stub


/*

    axi_master_stub axi_master_XXX_stub (
        .M2S_AXI_ACLK(M2S_XXX_AXI_ACLK),

        //Read Transaction

        .M2S_AXI_ARVALID(M2S_XXX_AXI_ARVALID),
        .M2S_AXI_ARREADY(M2S_XXX_AXI_ARREADY),
        .M2S_AXI_ARADDR(M2S_XXX_AXI_ARADDR[31:0]),
        .M2S_AXI_ARBURST(M2S_XXX_AXI_ARBURST[1:0]),
        .M2S_AXI_ARLEN(M2S_XXX_AXI_ARLEN[3:0]),
        .M2S_AXI_ARSIZE(M2S_XXX_AXI_ARSIZE[1:0]),
        //
        .M2S_AXI_RVALID(M2S_XXX_AXI_RVALID),
        .M2S_AXI_RREADY(M2S_XXX_AXI_RREADY),
        .M2S_AXI_RLAST(M2S_XXX_AXI_RLAST),
        .M2S_AXI_RDATA(M2S_XXX_AXI_RDATA[63:0]),
        //
        .M2S_AXI_RRESP(M2S_XXX_AXI_RRESP[1:0]),

        // Write Transaction
        .M2S_AXI_AWVALID(M2S_XXX_AXI_AWVALID),
        .M2S_AXI_AWREADY(M2S_XXX_AXI_AWREADY),
        .M2S_AXI_AWADDR(M2S_XXX_AXI_AWADDR[31:0]),
        .M2S_AXI_AWBURST(M2S_XXX_AXI_AWBURST[1:0]),
        .M2S_AXI_AWLEN(M2S_XXX_AXI_AWLEN[3:0]),
        .M2S_AXI_AWSIZE(M2S_XXX_AXI_AWSIZE[1:0]),
        //
        .M2S_AXI_WVALID(M2S_XXX_AXI_WVALID),
        .M2S_AXI_WREADY(M2S_XXX_AXI_WREADY),
        .M2S_AXI_WLAST(M2S_XXX_AXI_WLAST),
        .M2S_AXI_WDATA(M2S_XXX_AXI_WDATA[63:0]),
        .M2S_AXI_WSTRB(M2S_XXX_AXI_WSTRB[7:0]),
        //
        .M2S_AXI_BVALID(M2S_XXX_AXI_BVALID),
        .M2S_AXI_BREADY(M2S_XXX_AXI_BREADY),
        .M2S_AXI_BRESP(M2S_XXX_AXI_BRESP[1:0])
    );

*/
module axi_master_stub(
    output M2S_AXI_ACLK,

    //Read Transaction

    output M2S_AXI_ARVALID,
    input M2S_AXI_ARREADY,
    output [31:0] M2S_AXI_ARADDR,
    output [1:0] M2S_AXI_ARBURST,
    output [3:0] M2S_AXI_ARLEN,
    output [1:0] M2S_AXI_ARSIZE,
    //
    input M2S_AXI_RVALID,
    output M2S_AXI_RREADY,
    input M2S_AXI_RLAST,
    input [63:0] M2S_AXI_RDATA,
    //
    input [1:0] M2S_AXI_RRESP,

    // Write Transaction
    output M2S_AXI_AWVALID,
    input M2S_AXI_AWREADY,
    output [31:0] M2S_AXI_AWADDR,
    output [1:0] M2S_AXI_AWBURST,
    output [3:0] M2S_AXI_AWLEN,
    output [1:0] M2S_AXI_AWSIZE,
    //
    output M2S_AXI_WVALID,
    input M2S_AXI_WREADY,
    output M2S_AXI_WLAST,
    output [63:0] M2S_AXI_WDATA,
    output [7:0] M2S_AXI_WSTRB,
    //
    input M2S_AXI_BVALID,
    output M2S_AXI_BREADY,
    input [1:0] M2S_AXI_BRESP

);
    assign M2S_AXI_ACLK = 1'b0;

    //Read Transaction

    assign M2S_AXI_ARVALID = 1'b0;
    assign M2S_AXI_ARADDR = 32'b0;
    assign M2S_AXI_ARBURST = 2'b0;
    assign M2S_AXI_ARLEN = 4'b0;
    assign M2S_AXI_ARSIZE = 2'b0;
    assign M2S_AXI_RREADY = 1'b0;

    // Write Transaction
    assign M2S_AXI_AWVALID = 1'b0;
    assign M2S_AXI_AWADDR = 32'b0;
    assign M2S_AXI_AWBURST = 2'b0;
    assign M2S_AXI_AWLEN = 4'b0;
    assign M2S_AXI_AWSIZE = 2'b0;
    assign M2S_AXI_WVALID = 1'b0;
    assign M2S_AXI_WLAST = 1'b0;
    assign M2S_AXI_WDATA = 64'b0;
    assign M2S_AXI_WSTRB = 8'b0;
    assign M2S_AXI_BREADY = 1'b0;


endmodule : axi_master_stub


/*

    axi_master_stub axi_master_XXX_stub (
        .M2S_AXI_ACLK(M2S_XXX_AXI_ACLK),

        //Read Transaction

        .M2S_AXI_ARVALID(M2S_XXX_AXI_ARVALID),
        .M2S_AXI_ARREADY(M2S_XXX_AXI_ARREADY),
        .M2S_AXI_ARADDR(M2S_XXX_AXI_ARADDR[31:0]),
        .M2S_AXI_ARBURST(M2S_XXX_AXI_ARBURST[1:0]),
        .M2S_AXI_ARLEN(M2S_XXX_AXI_ARLEN[3:0]),
        .M2S_AXI_ARSIZE(M2S_XXX_AXI_ARSIZE[1:0]),
        //
        .M2S_AXI_RVALID(M2S_XXX_AXI_RVALID),
        .M2S_AXI_RREADY(M2S_XXX_AXI_RREADY),
        .M2S_AXI_RLAST(M2S_XXX_AXI_RLAST),
        .M2S_AXI_RDATA(M2S_XXX_AXI_RDATA[63:0]),
        //
        .M2S_AXI_RRESP(M2S_XXX_AXI_RRESP[1:0]),

        // Write Transaction
        .M2S_AXI_AWVALID(M2S_XXX_AXI_AWVALID),
        .M2S_AXI_AWREADY(M2S_XXX_AXI_AWREADY),
        .M2S_AXI_AWADDR(M2S_XXX_AXI_AWADDR[31:0]),
        .M2S_AXI_AWBURST(M2S_XXX_AXI_AWBURST[1:0]),
        .M2S_AXI_AWLEN(M2S_XXX_AXI_AWLEN[3:0]),
        .M2S_AXI_AWSIZE(M2S_XXX_AXI_AWSIZE[1:0]),
        //
        .M2S_AXI_WVALID(M2S_XXX_AXI_WVALID),
        .M2S_AXI_WREADY(M2S_XXX_AXI_WREADY),
        .M2S_AXI_WLAST(M2S_XXX_AXI_WLAST),
        .M2S_AXI_WDATA(M2S_XXX_AXI_WDATA[63:0]),
        .M2S_AXI_WSTRB(M2S_XXX_AXI_WSTRB[7:0]),
        //
        .M2S_AXI_BVALID(M2S_XXX_AXI_BVALID),
        .M2S_AXI_BREADY(M2S_XXX_AXI_BREADY),
        .M2S_AXI_BRESP(M2S_XXX_AXI_BRESP[1:0])
    );

*/
module ps7_wrap(

    // Non-Axi PS7 signals
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

    output [3:0] FCLKCLK,
    output [3:0] FCLKRESETN,


/////////////////////////////////////
// Slave -> Master GP0
/////////////////////////////////////
    input S2M_GP0_AXI_ACLK,

    // Read interface
    output S2M_GP0_AXI_ARVALID,
    input S2M_GP0_AXI_ARREADY,
    output [31:0] S2M_GP0_AXI_ARADDR,
    output [11:0] S2M_GP0_AXI_ARID,

    input S2M_GP0_AXI_RVALID,
    output S2M_GP0_AXI_RREADY,
    input S2M_GP0_AXI_RLAST,
    input [31:0] S2M_GP0_AXI_RDATA,
    input [11:0] S2M_GP0_AXI_RID,

    input [1:0] S2M_GP0_AXI_RRESP,


    //write interface
    output S2M_GP0_AXI_AWVALID,
    input S2M_GP0_AXI_AWREADY,
    output [31:0] S2M_GP0_AXI_AWADDR,
    output [11:0] S2M_GP0_AXI_AWID,

    output S2M_GP0_AXI_WVALID,
    input S2M_GP0_AXI_WREADY,
    output [31:0] S2M_GP0_AXI_WDATA,
    output [3:0] S2M_GP0_AXI_WSTRB,

    input S2M_GP0_AXI_BVALID,
    output S2M_GP0_AXI_BREADY,
    input [1:0] S2M_GP0_AXI_BRESP,
    input [11:0] S2M_GP0_AXI_BID,

/////////////////////////////////////
// Slave -> Master GP1
/////////////////////////////////////
    input S2M_GP1_AXI_ACLK,

    // Read interface
    output S2M_GP1_AXI_ARVALID,
    input S2M_GP1_AXI_ARREADY,
    output [31:0] S2M_GP1_AXI_ARADDR,
    output [11:0] S2M_GP1_AXI_ARID,

    input S2M_GP1_AXI_RVALID,
    output S2M_GP1_AXI_RREADY,
    input S2M_GP1_AXI_RLAST,
    input [31:0] S2M_GP1_AXI_RDATA,
    input [11:0] S2M_GP1_AXI_RID,

    input [1:0] S2M_GP1_AXI_RRESP,

    //write interface
    output S2M_GP1_AXI_AWVALID,
    input S2M_GP1_AXI_AWREADY,
    output [31:0] S2M_GP1_AXI_AWADDR,
    output [11:0] S2M_GP1_AXI_AWID,

    output S2M_GP1_AXI_WVALID,
    input S2M_GP1_AXI_WREADY,
    output [31:0] S2M_GP1_AXI_WDATA,
    output [3:0] S2M_GP1_AXI_WSTRB,

    input S2M_GP1_AXI_BVALID,
    output S2M_GP1_AXI_BREADY,
    input [1:0] S2M_GP1_AXI_BRESP,
    input [11:0] S2M_GP1_AXI_BID,

    
/////////////////////////////////////
// Master -> Slave interface GP0
/////////////////////////////////////
    input M2S_GP0_AXI_ACLK ,
    
    //Read M2S_GP0_AXI_transation
    
    input M2S_GP0_AXI_ARVALID,
    output M2S_GP0_AXI_ARREADY,
    input [31:0] M2S_GP0_AXI_ARADDR,
    input [1:0] M2S_GP0_AXI_ARBURST,
    input [3:0] M2S_GP0_AXI_ARLEN,
    input [1:0] M2S_GP0_AXI_ARSIZE,
    //
    output M2S_GP0_AXI_RVALID,
    input M2S_GP0_AXI_RREADY,
    output M2S_GP0_AXI_RLAST,
    output [31:0] M2S_GP0_AXI_RDATA,
    //
    output [1:0] M2S_GP0_AXI_RRESP,
   
    // Write M2S_GP0_AXI_Transaction
    input M2S_GP0_AXI_AWVALID,
    output M2S_GP0_AXI_AWREADY,
    input [31:0] M2S_GP0_AXI_AWADDR,
    input [1:0] M2S_GP0_AXI_AWBURST,
    input [3:0] M2S_GP0_AXI_AWLEN,
    input [1:0] M2S_GP0_AXI_AWSIZE,
    //
    input M2S_GP0_AXI_WVALID,
    output M2S_GP0_AXI_WREADY,
    input M2S_GP0_AXI_WLAST,
    input [31:0] M2S_GP0_AXI_WDATA,
    input [3:0] M2S_GP0_AXI_WSTRB,
    //
    output M2S_GP0_AXI_BVALID,
    input M2S_GP0_AXI_BREADY,
    output [1:0] M2S_GP0_AXI_BRESP,

/////////////////////////////////////
// Master -> Slave interface GP1
/////////////////////////////////////
    input M2S_GP1_AXI_ACLK ,
    
    //Read M2S_GP1_AXI_transation
    
    input M2S_GP1_AXI_ARVALID,
    output M2S_GP1_AXI_ARREADY,
    input [31:0] M2S_GP1_AXI_ARADDR,
    input [1:0] M2S_GP1_AXI_ARBURST,
    input [3:0] M2S_GP1_AXI_ARLEN,
    input [1:0] M2S_GP1_AXI_ARSIZE,
    //
    output M2S_GP1_AXI_RVALID,
    input M2S_GP1_AXI_RREADY,
    output M2S_GP1_AXI_RLAST,
    output [31:0] M2S_GP1_AXI_RDATA,
    //
    output [1:0] M2S_GP1_AXI_RRESP,
   
    // Write M2S_GP1_AXI_Transaction
    input M2S_GP1_AXI_AWVALID,
    output M2S_GP1_AXI_AWREADY,
    input [31:0] M2S_GP1_AXI_AWADDR,
    input [1:0] M2S_GP1_AXI_AWBURST,
    input [3:0] M2S_GP1_AXI_AWLEN,
    input [1:0] M2S_GP1_AXI_AWSIZE,
    //
    input M2S_GP1_AXI_WVALID,
    output M2S_GP1_AXI_WREADY,
    input M2S_GP1_AXI_WLAST,
    input [31:0] M2S_GP1_AXI_WDATA,
    input [3:0] M2S_GP1_AXI_WSTRB,
    //
    output M2S_GP1_AXI_BVALID,
    input M2S_GP1_AXI_BREADY,
    output [1:0] M2S_GP1_AXI_BRESP,

/////////////////////////////////////
// Master -> Slave interface HP0
/////////////////////////////////////
    input M2S_HP0_AXI_ACLK ,
    
    //Read M2S_HP0_AXI_transation
    
    input M2S_HP0_AXI_ARVALID,
    output M2S_HP0_AXI_ARREADY,
    input [31:0] M2S_HP0_AXI_ARADDR,
    input [1:0] M2S_HP0_AXI_ARBURST,
    input [3:0] M2S_HP0_AXI_ARLEN,
    input [1:0] M2S_HP0_AXI_ARSIZE,
    //
    output M2S_HP0_AXI_RVALID,
    input M2S_HP0_AXI_RREADY,
    output M2S_HP0_AXI_RLAST,
    output [63:0] M2S_HP0_AXI_RDATA,
    //
    output [1:0] M2S_HP0_AXI_RRESP,
   
    // Write M2S_HP0_AXI_Transaction
    input M2S_HP0_AXI_AWVALID,
    output M2S_HP0_AXI_AWREADY,
    input [31:0] M2S_HP0_AXI_AWADDR,
    input [1:0] M2S_HP0_AXI_AWBURST,
    input [3:0] M2S_HP0_AXI_AWLEN,
    input [1:0] M2S_HP0_AXI_AWSIZE,
    //
    input M2S_HP0_AXI_WVALID,
    output M2S_HP0_AXI_WREADY,
    input M2S_HP0_AXI_WLAST,
    input [63:0] M2S_HP0_AXI_WDATA,
    input [7:0] M2S_HP0_AXI_WSTRB,
    //
    output M2S_HP0_AXI_BVALID,
    input M2S_HP0_AXI_BREADY,
    output [1:0] M2S_HP0_AXI_BRESP,

/////////////////////////////////////
// Master -> Slave interface HP1
/////////////////////////////////////
    input M2S_HP1_AXI_ACLK ,
    
    //Read M2S_HP1_AXI_transation
    
    input M2S_HP1_AXI_ARVALID,
    output M2S_HP1_AXI_ARREADY,
    input [31:0] M2S_HP1_AXI_ARADDR,
    input [1:0] M2S_HP1_AXI_ARBURST,
    input [3:0] M2S_HP1_AXI_ARLEN,
    input [1:0] M2S_HP1_AXI_ARSIZE,
    //
    output M2S_HP1_AXI_RVALID,
    input M2S_HP1_AXI_RREADY,
    output M2S_HP1_AXI_RLAST,
    output [63:0] M2S_HP1_AXI_RDATA,
    //
    output [1:0] M2S_HP1_AXI_RRESP,
   
    // Write M2S_HP1_AXI_Transaction
    input M2S_HP1_AXI_AWVALID,
    output M2S_HP1_AXI_AWREADY,
    input [31:0] M2S_HP1_AXI_AWADDR,
    input [1:0] M2S_HP1_AXI_AWBURST,
    input [3:0] M2S_HP1_AXI_AWLEN,
    input [1:0] M2S_HP1_AXI_AWSIZE,
    //
    input M2S_HP1_AXI_WVALID,
    output M2S_HP1_AXI_WREADY,
    input M2S_HP1_AXI_WLAST,
    input [63:0] M2S_HP1_AXI_WDATA,
    input [7:0] M2S_HP1_AXI_WSTRB,
    //
    output M2S_HP1_AXI_BVALID,
    input M2S_HP1_AXI_BREADY,
    output [1:0] M2S_HP1_AXI_BRESP,

/////////////////////////////////////
// Master -> Slave interface HP2
/////////////////////////////////////
    input M2S_HP2_AXI_ACLK ,
    
    //Read M2S_HP2_AXI_transation
    
    input M2S_HP2_AXI_ARVALID,
    output M2S_HP2_AXI_ARREADY,
    input [31:0] M2S_HP2_AXI_ARADDR,
    input [1:0] M2S_HP2_AXI_ARBURST,
    input [3:0] M2S_HP2_AXI_ARLEN,
    input [1:0] M2S_HP2_AXI_ARSIZE,
    //
    output M2S_HP2_AXI_RVALID,
    input M2S_HP2_AXI_RREADY,
    output M2S_HP2_AXI_RLAST,
    output [63:0] M2S_HP2_AXI_RDATA,
    //
    output [1:0] M2S_HP2_AXI_RRESP,
   
    // Write M2S_HP2_AXI_Transaction
    input M2S_HP2_AXI_AWVALID,
    output M2S_HP2_AXI_AWREADY,
    input [31:0] M2S_HP2_AXI_AWADDR,
    input [1:0] M2S_HP2_AXI_AWBURST,
    input [3:0] M2S_HP2_AXI_AWLEN,
    input [1:0] M2S_HP2_AXI_AWSIZE,
    //
    input M2S_HP2_AXI_WVALID,
    output M2S_HP2_AXI_WREADY,
    input M2S_HP2_AXI_WLAST,
    input [63:0] M2S_HP2_AXI_WDATA,
    input [7:0] M2S_HP2_AXI_WSTRB,
    //
    output M2S_HP2_AXI_BVALID,
    input M2S_HP2_AXI_BREADY,
    output [1:0] M2S_HP2_AXI_BRESP,

/////////////////////////////////////
// Master -> Slave interface HP3
/////////////////////////////////////
    input M2S_HP3_AXI_ACLK ,
    
    //Read M2S_HP3_AXI_transation
    
    input M2S_HP3_AXI_ARVALID,
    output M2S_HP3_AXI_ARREADY,
    input [31:0] M2S_HP3_AXI_ARADDR,
    input [1:0] M2S_HP3_AXI_ARBURST,
    input [3:0] M2S_HP3_AXI_ARLEN,
    input [1:0] M2S_HP3_AXI_ARSIZE,
    //
    output M2S_HP3_AXI_RVALID,
    input M2S_HP3_AXI_RREADY,
    output M2S_HP3_AXI_RLAST,
    output [63:0] M2S_HP3_AXI_RDATA,
    //
    output [1:0] M2S_HP3_AXI_RRESP,
   
    // Write M2S_HP3_AXI_Transaction
    input M2S_HP3_AXI_AWVALID,
    output M2S_HP3_AXI_AWREADY,
    input [31:0] M2S_HP3_AXI_AWADDR,
    input [1:0] M2S_HP3_AXI_AWBURST,
    input [3:0] M2S_HP3_AXI_AWLEN,
    input [1:0] M2S_HP3_AXI_AWSIZE,
    //
    input M2S_HP3_AXI_WVALID,
    output M2S_HP3_AXI_WREADY,
    input M2S_HP3_AXI_WLAST,
    input [63:0] M2S_HP3_AXI_WDATA,
    input [7:0] M2S_HP3_AXI_WSTRB,
    //
    output M2S_HP3_AXI_BVALID,
    input M2S_HP3_AXI_BREADY,
    output [1:0] M2S_HP3_AXI_BRESP,

/////////////////////////////////////
// Master -> Slave interface ACP
/////////////////////////////////////
    input M2S_ACP_AXI_ACLK ,
    
    //Read M2S_ACP_AXI_transation
    
    input M2S_ACP_AXI_ARVALID,
    output M2S_ACP_AXI_ARREADY,
    input [31:0] M2S_ACP_AXI_ARADDR,
    input [1:0] M2S_ACP_AXI_ARBURST,
    input [3:0] M2S_ACP_AXI_ARLEN,
    input [1:0] M2S_ACP_AXI_ARSIZE,
    //
    output M2S_ACP_AXI_RVALID,
    input M2S_ACP_AXI_RREADY,
    output M2S_ACP_AXI_RLAST,
    output [63:0] M2S_ACP_AXI_RDATA,
    //
    output [1:0] M2S_ACP_AXI_RRESP,
   
    // Write M2S_ACP_AXI_Transaction
    input M2S_ACP_AXI_AWVALID,
    output M2S_ACP_AXI_AWREADY,
    input [31:0] M2S_ACP_AXI_AWADDR,
    input [1:0] M2S_ACP_AXI_AWBURST,
    input [3:0] M2S_ACP_AXI_AWLEN,
    input [1:0] M2S_ACP_AXI_AWSIZE,
    //
    input M2S_ACP_AXI_WVALID,
    output M2S_ACP_AXI_WREADY,
    input M2S_ACP_AXI_WLAST,
    input [63:0] M2S_ACP_AXI_WDATA,
    input [7:0] M2S_ACP_AXI_WSTRB,
    //
    output M2S_ACP_AXI_BVALID,
    input M2S_ACP_AXI_BREADY,
    output [1:0] M2S_ACP_AXI_BRESP
);

/////////////////////////////////////////





    PS7 ps7_0(
        .DMA0DATYPE(),   // out std_logic_vector(1 downto 0);
        .DMA0DAVALID(),   // out std_ulogic;
        .DMA0DRREADY(),   // out std_ulogic;
        .DMA0RSTN(),   // out std_ulogic;
        .DMA1DATYPE(),   // out std_logic_vector(1 downto 0);
        .DMA1DAVALID(),   // out std_ulogic;
        .DMA1DRREADY(),   // out std_ulogic;
        .DMA1RSTN(),   // out std_ulogic;
        .DMA2DATYPE(),   // out std_logic_vector(1 downto 0);
        .DMA2DAVALID(),   // out std_ulogic;
        .DMA2DRREADY(),   // out std_ulogic;
        .DMA2RSTN(),   // out std_ulogic;
        .DMA3DATYPE(),   // out std_logic_vector(1 downto 0);
        .DMA3DAVALID(),   // out std_ulogic;
        .DMA3DRREADY(),   // out std_ulogic;
        .DMA3RSTN(),   // out std_ulogic;
        .EMIOCAN0PHYTX(),   // out std_ulogic;
        .EMIOCAN1PHYTX(),   // out std_ulogic;
        .EMIOENET0GMIITXD(),   // out std_logic_vector(7 downto 0);
        .EMIOENET0GMIITXEN(),   // out std_ulogic;
        .EMIOENET0GMIITXER(),   // out std_ulogic;
        .EMIOENET0MDIOMDC(),   // out std_ulogic;
        .EMIOENET0MDIOO(),   // out std_ulogic;
        .EMIOENET0MDIOTN(),   // out std_ulogic;
        .EMIOENET0PTPDELAYREQRX(),   // out std_ulogic;
        .EMIOENET0PTPDELAYREQTX(),   // out std_ulogic;
        .EMIOENET0PTPPDELAYREQRX(),   // out std_ulogic;
        .EMIOENET0PTPPDELAYREQTX(),   // out std_ulogic;
        .EMIOENET0PTPPDELAYRESPRX(),   // out std_ulogic;
        .EMIOENET0PTPPDELAYRESPTX(),   // out std_ulogic;
        .EMIOENET0PTPSYNCFRAMERX(),   // out std_ulogic;
        .EMIOENET0PTPSYNCFRAMETX(),   // out std_ulogic;
        .EMIOENET0SOFRX(),   // out std_ulogic;
        .EMIOENET0SOFTX(),   // out std_ulogic;
        .EMIOENET1GMIITXD(),   // out std_logic_vector(7 downto 0);
        .EMIOENET1GMIITXEN(),   // out std_ulogic;
        .EMIOENET1GMIITXER(),   // out std_ulogic;
        .EMIOENET1MDIOMDC(),   // out std_ulogic;
        .EMIOENET1MDIOO(),   // out std_ulogic;
        .EMIOENET1MDIOTN(),   // out std_ulogic;
        .EMIOENET1PTPDELAYREQRX(),   // out std_ulogic;
        .EMIOENET1PTPDELAYREQTX(),   // out std_ulogic;
        .EMIOENET1PTPPDELAYREQRX(),   // out std_ulogic;
        .EMIOENET1PTPPDELAYREQTX(),   // out std_ulogic;
        .EMIOENET1PTPPDELAYRESPRX(),   // out std_ulogic;
        .EMIOENET1PTPPDELAYRESPTX(),   // out std_ulogic;
        .EMIOENET1PTPSYNCFRAMERX(),   // out std_ulogic;
        .EMIOENET1PTPSYNCFRAMETX(),   // out std_ulogic;
        .EMIOENET1SOFRX(),   // out std_ulogic;
        .EMIOENET1SOFTX(),   // out std_ulogic;
        .EMIOGPIOO(),    // out std_logic_vector(63 downto 0);
        .EMIOGPIOTN(),  // out std_logic_vector(63 downto 0);
        .EMIOI2C0SCLO(),    // out std_ulogic;
        .EMIOI2C0SCLTN(),  // out std_ulogic;
        .EMIOI2C0SDAO(),    // out std_ulogic;
        .EMIOI2C0SDATN(),  // out std_ulogic;
        .EMIOI2C1SCLO(),    // out std_ulogic;
        .EMIOI2C1SCLTN(),  // out std_ulogic;
        .EMIOI2C1SDAO(),    // out std_ulogic;
        .EMIOI2C1SDATN(),  // out std_ulogic;
        .EMIOPJTAGTDO(),   // out std_ulogic;
        .EMIOPJTAGTDTN(),   // out std_ulogic;
        .EMIOSDIO0BUSPOW(),   // out std_ulogic;
        .EMIOSDIO0BUSVOLT(),   // out std_logic_vector(2 downto 0);
        .EMIOSDIO0CLK(),   // out std_ulogic;
        .EMIOSDIO0CMDO(),   // out std_ulogic;
        .EMIOSDIO0CMDTN(),   // out std_ulogic;
        .EMIOSDIO0DATAO(),   // out std_logic_vector(3 downto 0);
        .EMIOSDIO0DATATN(),   // out std_logic_vector(3 downto 0);
        .EMIOSDIO0LED(),   // out std_ulogic;
        .EMIOSDIO1BUSPOW(),   // out std_ulogic;
        .EMIOSDIO1BUSVOLT(),   // out std_logic_vector(2 downto 0);
        .EMIOSDIO1CLK(),   // out std_ulogic;
        .EMIOSDIO1CMDO(),   // out std_ulogic;
        .EMIOSDIO1CMDTN(),   // out std_ulogic;
        .EMIOSDIO1DATAO(),   // out std_logic_vector(3 downto 0);
        .EMIOSDIO1DATATN(),   // out std_logic_vector(3 downto 0);
        .EMIOSDIO1LED(),   // out std_ulogic;
        .EMIOSPI0MO(),   // out std_ulogic;
        .EMIOSPI0MOTN(),   // out std_ulogic;
        .EMIOSPI0SCLKO(),   // out std_ulogic;
        .EMIOSPI0SCLKTN(),   // out std_ulogic;
        .EMIOSPI0SO(),   // out std_ulogic;
        .EMIOSPI0SSNTN(),   // out std_ulogic;
        .EMIOSPI0SSON(),   // out std_logic_vector(2 downto 0);
        .EMIOSPI0STN(),   // out std_ulogic;
        .EMIOSPI1MO(),   // out std_ulogic;
        .EMIOSPI1MOTN(),   // out std_ulogic;
        .EMIOSPI1SCLKO(),   // out std_ulogic;
        .EMIOSPI1SCLKTN(),   // out std_ulogic;
        .EMIOSPI1SO(),   // out std_ulogic;
        .EMIOSPI1SSNTN(),   // out std_ulogic;
        .EMIOSPI1SSON(),   // out std_logic_vector(2 downto 0);
        .EMIOSPI1STN(),   // out std_ulogic;
        .EMIOTRACECTL(),   // out std_ulogic;
        .EMIOTRACEDATA(),   // out std_logic_vector(31 downto 0);
        .EMIOTTC0WAVEO(),   // out std_logic_vector(2 downto 0);
        .EMIOTTC1WAVEO(),   // out std_logic_vector(2 downto 0);
        .EMIOUART0DTRN(),   // out std_ulogic;
        .EMIOUART0RTSN(),   // out std_ulogic;
        .EMIOUART0TX(),   // out std_ulogic;
        .EMIOUART1DTRN(),   // out std_ulogic;
        .EMIOUART1RTSN(),   // out std_ulogic;
        .EMIOUART1TX(),   // out std_ulogic;
        .EMIOUSB0PORTINDCTL(),   // out std_logic_vector(1 downto 0);
        .EMIOUSB0VBUSPWRSELECT(),   // out std_ulogic;
        .EMIOUSB1PORTINDCTL(),   // out std_logic_vector(1 downto 0);
        .EMIOUSB1VBUSPWRSELECT(),   // out std_ulogic;
        .EMIOWDTRSTO(),   // out std_ulogic;
        .EVENTEVENTO(),   // out std_ulogic;
        .EVENTSTANDBYWFE(),   // out std_logic_vector(1 downto 0);
        .EVENTSTANDBYWFI(),   // out std_logic_vector(1 downto 0);
        .FCLKCLK(FCLKCLK),    // out std_logic_vector(3 downto 0);
        .FCLKRESETN(FCLKRESETN),   // out std_logic_vector(3 downto 0);
        .FTMTF2PTRIGACK(),   // out std_logic_vector(3 downto 0);
        .FTMTP2FDEBUG(),   // out std_logic_vector(31 downto 0);
        .FTMTP2FTRIG(),   // out std_logic_vector(3 downto 0);
        .IRQP2F(),   // out std_logic_vector(28 downto 0);
        
        .DDRA(DDR_Addr),   // inout std_logic_vector(14 downto 0);
        .DDRBA(DDR_BankAddr), // inout std_logic_vector(2 downto 0);
        .DDRCASB(DDR_CAS_n),   // inout std_ulogic;
        .DDRCKE(DDR_CKE),   // inout std_ulogic;
        .DDRCKN(DDR_Clk_n),   // inout std_ulogic;
        .DDRCKP(DDR_Clk),   // inout std_ulogic;
        .DDRCSB(DDR_CS_n),   // inout std_ulogic;
        .DDRDM(DDR_DM),   // inout std_logic_vector(3 downto 0);
        .DDRDQ(DDR_DQ),   // inout std_logic_vector(31 downto 0);
        .DDRDQSN(DDR_DQS_n),   // inout std_logic_vector(3 downto 0);
        .DDRDQSP(DDR_DQS),   // inout std_logic_vector(3 downto 0);
        .DDRDRSTB(DDR_DRSTB),   // inout std_ulogic;
        .DDRODT(DDR_ODT),   // inout std_ulogic;
        .DDRRASB(DDR_RAS_n),   // inout std_ulogic;
        .DDRVRN(DDR_VRN),   // inout std_ulogic;
        .DDRVRP(DDR_VRP),   // inout std_ulogic;
        .DDRWEB(DDR_WEB),   // inout std_ulogic;
        .MIO(MIO),   // inout std_logic_vector(53 downto 0);
        .PSCLK(PS_CLK),   // inout std_ulogic;
        .PSPORB(PS_PORB),   // inout std_ulogic;
        .PSSRSTB(PS_SRSTB),   // inout std_ulogic;
        .DDRARB(4'b0),  // in std_logic_vector(3 downto 0);
        .DMA0ACLK(1'b0),     // in std_ulogic;
        .DMA0DAREADY(1'b0),     // in std_ulogic;
        .DMA0DRLAST(1'b0),     // in std_ulogic;
        .DMA0DRTYPE(2'b0),  // in std_logic_vector(1 downto 0);
        .DMA0DRVALID(1'b0),     // in std_ulogic;
        .DMA1ACLK(1'b0),     // in std_ulogic;
        .DMA1DAREADY(1'b0),     // in std_ulogic;
        .DMA1DRLAST(1'b0),     // in std_ulogic;
        .DMA1DRTYPE(2'b0),  // in std_logic_vector(1 downto 0);
        .DMA1DRVALID(1'b0),     // in std_ulogic;
        .DMA2ACLK(1'b0),     // in std_ulogic;
        .DMA2DAREADY(1'b0),     // in std_ulogic;
        .DMA2DRLAST(1'b0),     // in std_ulogic;
        .DMA2DRTYPE(2'b0),  // in std_logic_vector(1 downto 0);
        .DMA2DRVALID(1'b0),     // in std_ulogic;
        .DMA3ACLK(1'b0),     // in std_ulogic;
        .DMA3DAREADY(1'b0),     // in std_ulogic;
        .DMA3DRLAST(1'b0),     // in std_ulogic;
        .DMA3DRTYPE(2'b0),  // in std_logic_vector(1 downto 0);
        .DMA3DRVALID(1'b0),     // in std_ulogic;
        .EMIOCAN0PHYRX(1'b0),     // in std_ulogic;
        .EMIOCAN1PHYRX(1'b0),     // in std_ulogic;
        .EMIOENET0EXTINTIN(1'b0),     // in std_ulogic;
        .EMIOENET0GMIICOL(1'b0),     // in std_ulogic;
        .EMIOENET0GMIICRS(1'b0),     // in std_ulogic;
        .EMIOENET0GMIIRXCLK(1'b0),     // in std_ulogic;
        .EMIOENET0GMIIRXD(8'b0),  // in std_logic_vector(7 downto 0);
        .EMIOENET0GMIIRXDV(1'b0),     // in std_ulogic;
        .EMIOENET0GMIIRXER(1'b0),     // in std_ulogic;
        .EMIOENET0GMIITXCLK(1'b0),     // in std_ulogic;
        .EMIOENET0MDIOI(1'b0),     // in std_ulogic;
        .EMIOENET1EXTINTIN(1'b0),     // in std_ulogic;
        .EMIOENET1GMIICOL(1'b0),     // in std_ulogic;
        .EMIOENET1GMIICRS(1'b0),     // in std_ulogic;
        .EMIOENET1GMIIRXCLK(1'b0),     // in std_ulogic;
        .EMIOENET1GMIIRXD(8'b0),  // in std_logic_vector(7 downto 0);
        .EMIOENET1GMIIRXDV(1'b0),     // in std_ulogic;
        .EMIOENET1GMIIRXER(1'b0),     // in std_ulogic;
        .EMIOENET1GMIITXCLK(1'b0),     // in std_ulogic;
        .EMIOENET1MDIOI(1'b0),     // in std_ulogic;
        .EMIOGPIOI(64'b0),   // in std_logic_vector(63 downto 0);
        .EMIOI2C0SCLI(1'b0),   // in std_ulogic;
        .EMIOI2C0SDAI(1'b0),   // in std_ulogic;
        .EMIOI2C1SCLI(1'b0),   // in std_ulogic;
        .EMIOI2C1SDAI(1'b0),   // in std_ulogic;
        .EMIOPJTAGTCK(1'b0),     // in std_ulogic;
        .EMIOPJTAGTDI(1'b0),     // in std_ulogic;
        .EMIOPJTAGTMS(1'b0),     // in std_ulogic;
        .EMIOSDIO0CDN(1'b0),     // in std_ulogic;
        .EMIOSDIO0CLKFB(1'b0),     // in std_ulogic;
        .EMIOSDIO0CMDI(1'b0),     // in std_ulogic;
        .EMIOSDIO0DATAI(4'b0),  // in std_logic_vector(3 downto 0);
        .EMIOSDIO0WP(1'b0),     // in std_ulogic;
        .EMIOSDIO1CDN(1'b0),     // in std_ulogic;
        .EMIOSDIO1CLKFB(1'b0),     // in std_ulogic;
        .EMIOSDIO1CMDI(1'b0),     // in std_ulogic;
        .EMIOSDIO1DATAI(4'b0),  // in std_logic_vector(3 downto 0);
        .EMIOSDIO1WP(1'b0),     // in std_ulogic;
        .EMIOSPI0MI(1'b0),     // in std_ulogic;
        .EMIOSPI0SCLKI(1'b0),     // in std_ulogic;
        .EMIOSPI0SI(1'b0),     // in std_ulogic;
        .EMIOSPI0SSIN(1'b0),     // in std_ulogic;
        .EMIOSPI1MI(1'b0),     // in std_ulogic;
        .EMIOSPI1SCLKI(1'b0),     // in std_ulogic;
        .EMIOSPI1SI(1'b0),     // in std_ulogic;
        .EMIOSPI1SSIN(1'b0),     // in std_ulogic;
        .EMIOSRAMINTIN(1'b0),     // in std_ulogic;
        .EMIOTRACECLK(1'b0),     // in std_ulogic;
        .EMIOTTC0CLKI(3'b0),  // in std_logic_vector(2 downto 0);
        .EMIOTTC1CLKI(3'b0),  // in std_logic_vector(2 downto 0);
        .EMIOUART0CTSN(1'b0),     // in std_ulogic;
        .EMIOUART0DCDN(1'b0),     // in std_ulogic;
        .EMIOUART0DSRN(1'b0),     // in std_ulogic;
        .EMIOUART0RIN(1'b0),     // in std_ulogic;
        .EMIOUART0RX(1'b0),     // in std_ulogic;
        .EMIOUART1CTSN(1'b0),     // in std_ulogic;
        .EMIOUART1DCDN(1'b0),     // in std_ulogic;
        .EMIOUART1DSRN(1'b0),     // in std_ulogic;
        .EMIOUART1RIN(1'b0),     // in std_ulogic;
        .EMIOUART1RX(1'b0),     // in std_ulogic;
        .EMIOUSB0VBUSPWRFAULT(1'b0),     // in std_ulogic;
        .EMIOUSB1VBUSPWRFAULT(1'b0),     // in std_ulogic;
        .EMIOWDTCLKI(1'b0),     // in std_ulogic;
        .EVENTEVENTI(1'b0),     // in std_ulogic;
        .FCLKCLKTRIGN(4'b0),  // in std_logic_vector(3 downto 0);
        .FPGAIDLEN(1'b0),     // in std_ulogic;
        .FTMDTRACEINATID(4'b0),  // in std_logic_vector(3 downto 0);
        .FTMDTRACEINCLOCK(1'b0),     // in std_ulogic;
        .FTMDTRACEINDATA(32'b0),  // in std_logic_vector(31 downto 0);
        .FTMDTRACEINVALID(1'b0),     // in std_ulogic;
        .FTMTF2PDEBUG(32'b0),  // in std_logic_vector(31 downto 0);
        .FTMTF2PTRIG(4'b0),  // in std_logic_vector(3 downto 0);
        .FTMTP2FTRIGACK(4'b0),  // in std_logic_vector(3 downto 0);
        .IRQF2P(20'h0),  // in std_logic_vector(19 downto 0);
        
        .MAXIGP0ACLK(S2M_GP0_AXI_ACLK),  // in std_ulogic;
        .MAXIGP0ARADDR(S2M_GP0_AXI_ARADDR), // out std_logic_vector(31 downto 0);
        .MAXIGP0ARBURST(),  // out std_logic_vector(1 downto 0);
        .MAXIGP0ARCACHE(),  // out std_logic_vector(3 downto 0);
        .MAXIGP0ARESETN(),  // out std_ulogic;
        .MAXIGP0ARID(S2M_GP0_AXI_ARID),   // out std_logic_vector(11 downto 0);
        .MAXIGP0ARLEN(),  // out std_logic_vector(3 downto 0);
        .MAXIGP0ARLOCK(),  // out std_logic_vector(1 downto 0);
        .MAXIGP0ARPROT(),  // out std_logic_vector(2 downto 0);
        .MAXIGP0ARQOS(),  // out std_logic_vector(3 downto 0);
        .MAXIGP0ARREADY(S2M_GP0_AXI_ARREADY),// in std_ulogic;
        .MAXIGP0ARSIZE(),  // out std_logic_vector(1 downto 0);
        .MAXIGP0ARVALID(S2M_GP0_AXI_ARVALID), // out std_ulogic;
        .MAXIGP0AWADDR(S2M_GP0_AXI_AWADDR), // out std_logic_vector(31 downto 0);
        .MAXIGP0AWBURST(),  // out std_logic_vector(1 downto 0);
        .MAXIGP0AWCACHE(),  // out std_logic_vector(3 downto 0);
        .MAXIGP0AWID(S2M_GP0_AXI_AWID),   // out std_logic_vector(11 downto 0);
        .MAXIGP0AWLEN(),  // out std_logic_vector(3 downto 0);
        .MAXIGP0AWLOCK(),  // out std_logic_vector(1 downto 0);
        .MAXIGP0AWPROT(),  // out std_logic_vector(2 downto 0);
        .MAXIGP0AWQOS(),  // out std_logic_vector(3 downto 0);
        .MAXIGP0AWREADY(S2M_GP0_AXI_AWREADY),// in std_ulogic;
        .MAXIGP0AWSIZE(),  // out std_logic_vector(1 downto 0);
        .MAXIGP0AWVALID(S2M_GP0_AXI_AWVALID), // out std_ulogic;
        .MAXIGP0BID(S2M_GP0_AXI_BID),  // in std_logic_vector(11 downto 0);
        .MAXIGP0BREADY(S2M_GP0_AXI_BREADY), // out std_ulogic;
        .MAXIGP0BRESP(S2M_GP0_AXI_BRESP),// in std_logic_vector(1 downto 0);
        .MAXIGP0BVALID(S2M_GP0_AXI_BVALID),// in std_ulogic;
        .MAXIGP0RDATA(S2M_GP0_AXI_RDATA),// in std_logic_vector(31 downto 0);
        .MAXIGP0RID(S2M_GP0_AXI_RID),  // in std_logic_vector(11 downto 0);
        .MAXIGP0RLAST(S2M_GP0_AXI_RLAST),// in std_ulogic;
        .MAXIGP0RREADY(S2M_GP0_AXI_RREADY), // out std_ulogic;
        .MAXIGP0RRESP(S2M_GP0_AXI_RRESP),// in std_logic_vector(1 downto 0);    
        .MAXIGP0RVALID(S2M_GP0_AXI_RVALID),// in std_ulogic;
        .MAXIGP0WDATA(S2M_GP0_AXI_WDATA), // out std_logic_vector(31 downto 0);
        .MAXIGP0WID(),    // out std_logic_vector(11 downto 0);
        .MAXIGP0WLAST(),  // out std_ulogic;
        .MAXIGP0WREADY(S2M_GP0_AXI_WREADY),// in std_ulogic;
        .MAXIGP0WSTRB(S2M_GP0_AXI_WSTRB), // out std_logic_vector(3 downto 0);
        .MAXIGP0WVALID(S2M_GP0_AXI_WVALID), // out std_ulogic;

        .MAXIGP1ACLK(S2M_GP1_AXI_ACLK),  // in std_ulogic;
        .MAXIGP1ARADDR(S2M_GP1_AXI_ARADDR), // out std_logic_vector(31 downto 0);
        .MAXIGP1ARBURST(),  // out std_logic_vector(1 downto 0);
        .MAXIGP1ARCACHE(),  // out std_logic_vector(3 downto 0);
        .MAXIGP1ARESETN(),  // out std_ulogic;
        .MAXIGP1ARID(S2M_GP1_AXI_ARID),   // out std_logic_vector(11 downto 0);
        .MAXIGP1ARLEN(),  // out std_logic_vector(3 downto 0);
        .MAXIGP1ARLOCK(),  // out std_logic_vector(1 downto 0);
        .MAXIGP1ARPROT(),  // out std_logic_vector(2 downto 0);
        .MAXIGP1ARQOS(),  // out std_logic_vector(3 downto 0);
        .MAXIGP1ARREADY(S2M_GP1_AXI_ARREADY),// in std_ulogic;
        .MAXIGP1ARSIZE(),  // out std_logic_vector(1 downto 0);
        .MAXIGP1ARVALID(S2M_GP1_AXI_ARVALID), // out std_ulogic;
        .MAXIGP1AWADDR(S2M_GP1_AXI_AWADDR), // out std_logic_vector(31 downto 0);
        .MAXIGP1AWBURST(),  // out std_logic_vector(1 downto 0);
        .MAXIGP1AWCACHE(),  // out std_logic_vector(3 downto 0);
        .MAXIGP1AWID(S2M_GP1_AXI_AWID),   // out std_logic_vector(11 downto 0);
        .MAXIGP1AWLEN(),  // out std_logic_vector(3 downto 0);
        .MAXIGP1AWLOCK(),  // out std_logic_vector(1 downto 0);
        .MAXIGP1AWPROT(),  // out std_logic_vector(2 downto 0);
        .MAXIGP1AWQOS(),  // out std_logic_vector(3 downto 0);
        .MAXIGP1AWREADY(S2M_GP1_AXI_AWREADY),// in std_ulogic;
        .MAXIGP1AWSIZE(),  // out std_logic_vector(1 downto 0);
        .MAXIGP1AWVALID(S2M_GP1_AXI_AWVALID), // out std_ulogic;
        .MAXIGP1BID(S2M_GP1_AXI_BID),  // in std_logic_vector(11 downto 0);
        .MAXIGP1BREADY(S2M_GP1_AXI_BREADY), // out std_ulogic;
        .MAXIGP1BRESP(S2M_GP1_AXI_BRESP),// in std_logic_vector(1 downto 0);
        .MAXIGP1BVALID(S2M_GP1_AXI_BVALID),// in std_ulogic;
        .MAXIGP1RDATA(S2M_GP1_AXI_RDATA),// in std_logic_vector(31 downto 0);
        .MAXIGP1RID(S2M_GP1_AXI_RID),  // in std_logic_vector(11 downto 0);
        .MAXIGP1RLAST(S2M_GP1_AXI_RLAST),// in std_ulogic;
        .MAXIGP1RREADY(S2M_GP1_AXI_RREADY), // out std_ulogic;
        .MAXIGP1RRESP(S2M_GP1_AXI_RRESP),// in std_logic_vector(1 downto 0);    
        .MAXIGP1RVALID(S2M_GP1_AXI_RVALID),// in std_ulogic;
        .MAXIGP1WDATA(S2M_GP1_AXI_WDATA), // out std_logic_vector(31 downto 0);
        .MAXIGP1WID(),    // out std_logic_vector(11 downto 0);
        .MAXIGP1WLAST(),  // out std_ulogic;
        .MAXIGP1WREADY(S2M_GP1_AXI_WREADY),// in std_ulogic;
        .MAXIGP1WSTRB(S2M_GP1_AXI_WSTRB), // out std_logic_vector(3 downto 0);
        .MAXIGP1WVALID(S2M_GP1_AXI_WVALID), // out std_ulogic;
        
        .SAXIGP0ACLK(M2S_GP0_AXI_ACLK),     // in std_ulogic;
        .SAXIGP0ARADDR(M2S_GP0_AXI_ARADDR),  // in std_logic_vector(31 downto 0);
        .SAXIGP0ARBURST(M2S_GP0_AXI_ARBURST),  // in std_logic_vector(1 downto 0);
        .SAXIGP0ARCACHE(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIGP0ARID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIGP0ARLEN(M2S_GP0_AXI_ARLEN),  // in std_logic_vector(3 downto 0);
        .SAXIGP0ARLOCK(2'b0),  // in std_logic_vector(1 downto 0);
        .SAXIGP0ARPROT(3'b0),  // in std_logic_vector(2 downto 0);
        .SAXIGP0ARQOS(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIGP0ARSIZE(M2S_GP0_AXI_ARSIZE),  // in std_logic_vector(1 downto 0);
        .SAXIGP0ARVALID(M2S_GP0_AXI_ARVALID),     // in std_ulogic;
        .SAXIGP0AWADDR(M2S_GP0_AXI_AWADDR),  // in std_logic_vector(31 downto 0);
        .SAXIGP0AWBURST(M2S_GP0_AXI_AWBURST),  // in std_logic_vector(1 downto 0);
        .SAXIGP0AWCACHE(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIGP0AWID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIGP0AWLEN(M2S_GP0_AXI_AWLEN),  // in std_logic_vector(3 downto 0);
        .SAXIGP0AWLOCK(2'b0),  // in std_logic_vector(1 downto 0);
        .SAXIGP0AWPROT(3'b0),  // in std_logic_vector(2 downto 0);
        .SAXIGP0AWQOS(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIGP0AWSIZE(M2S_GP0_AXI_AWSIZE),  // in std_logic_vector(1 downto 0);
        .SAXIGP0AWVALID(M2S_GP0_AXI_AWVALID),     // in std_ulogic;
        .SAXIGP0BREADY(M2S_GP0_AXI_BREADY),     // in std_ulogic;
        .SAXIGP0RREADY(M2S_GP0_AXI_RREADY),     // in std_ulogic;
        .SAXIGP0WDATA(M2S_GP0_AXI_WDATA),  // in std_logic_vector(31 downto 0);
        .SAXIGP0WID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIGP0WLAST(M2S_GP0_AXI_WLAST),     // in std_ulogic;
        .SAXIGP0WSTRB(M2S_GP0_AXI_WSTRB),  // in std_logic_vector(3 downto 0);
        .SAXIGP0WVALID(M2S_GP0_AXI_WVALID),     // in std_ulogic;
        .SAXIGP0ARESETN(),   // out std_ulogic;
        .SAXIGP0ARREADY(M2S_GP0_AXI_ARREADY),   // out std_ulogic;
        .SAXIGP0AWREADY(M2S_GP0_AXI_AWREADY),   // out std_ulogic;
        .SAXIGP0BID(),   // out std_logic_vector(5 downto 0);
        .SAXIGP0BRESP(M2S_GP0_AXI_BRESP),   // out std_logic_vector(1 downto 0);
        .SAXIGP0BVALID(M2S_GP0_AXI_BVALID),   // out std_ulogic;
        .SAXIGP0RDATA(M2S_GP0_AXI_RDATA),   // out std_logic_vector(31 downto 0);
        .SAXIGP0RID(),   // out std_logic_vector(5 downto 0);
        .SAXIGP0RLAST(M2S_GP0_AXI_RLAST),   // out std_ulogic;
        .SAXIGP0RRESP(M2S_GP0_AXI_RRESP),   // out std_logic_vector(1 downto 0);
        .SAXIGP0RVALID(M2S_GP0_AXI_RVALID),   // out std_ulogic;
        .SAXIGP0WREADY(M2S_GP0_AXI_WREADY),   // out std_ulogic;
        
        .SAXIGP1ACLK(M2S_GP1_AXI_ACLK),     // in std_ulogic;
        .SAXIGP1ARADDR(M2S_GP1_AXI_ARADDR),  // in std_logic_vector(31 downto 0);
        .SAXIGP1ARBURST(M2S_GP1_AXI_ARBURST),  // in std_logic_vector(1 downto 0);
        .SAXIGP1ARCACHE(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIGP1ARID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIGP1ARLEN(M2S_GP1_AXI_ARLEN),  // in std_logic_vector(3 downto 0);
        .SAXIGP1ARLOCK(2'b0),  // in std_logic_vector(1 downto 0);
        .SAXIGP1ARPROT(3'b0),  // in std_logic_vector(2 downto 0);
        .SAXIGP1ARQOS(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIGP1ARSIZE(M2S_GP1_AXI_ARSIZE),  // in std_logic_vector(1 downto 0);
        .SAXIGP1ARVALID(M2S_GP1_AXI_ARVALID),     // in std_ulogic;
        .SAXIGP1AWADDR(M2S_GP1_AXI_AWADDR),  // in std_logic_vector(31 downto 0);
        .SAXIGP1AWBURST(M2S_GP1_AXI_AWBURST),  // in std_logic_vector(1 downto 0);
        .SAXIGP1AWCACHE(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIGP1AWID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIGP1AWLEN(M2S_GP1_AXI_AWLEN),  // in std_logic_vector(3 downto 0);
        .SAXIGP1AWLOCK(2'b0),  // in std_logic_vector(1 downto 0);
        .SAXIGP1AWPROT(3'b0),  // in std_logic_vector(2 downto 0);
        .SAXIGP1AWQOS(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIGP1AWSIZE(M2S_GP1_AXI_AWSIZE),  // in std_logic_vector(1 downto 0);
        .SAXIGP1AWVALID(M2S_GP1_AXI_AWVALID),     // in std_ulogic;
        .SAXIGP1BREADY(M2S_GP1_AXI_BREADY),     // in std_ulogic;
        .SAXIGP1RREADY(M2S_GP1_AXI_RREADY),     // in std_ulogic;
        .SAXIGP1WDATA(M2S_GP1_AXI_WDATA),  // in std_logic_vector(31 downto 0);
        .SAXIGP1WID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIGP1WLAST(M2S_GP1_AXI_WLAST),     // in std_ulogic;
        .SAXIGP1WSTRB(M2S_GP1_AXI_WSTRB),  // in std_logic_vector(3 downto 0);
        .SAXIGP1WVALID(M2S_GP1_AXI_WVALID),     // in std_ulogic;
        .SAXIGP1ARESETN(),   // out std_ulogic;
        .SAXIGP1ARREADY(M2S_GP1_AXI_ARREADY),   // out std_ulogic;
        .SAXIGP1AWREADY(M2S_GP1_AXI_AWREADY),   // out std_ulogic;
        .SAXIGP1BID(),   // out std_logic_vector(5 downto 0);
        .SAXIGP1BRESP(M2S_GP1_AXI_BRESP),   // out std_logic_vector(1 downto 0);
        .SAXIGP1BVALID(M2S_GP1_AXI_BVALID),   // out std_ulogic;
        .SAXIGP1RDATA(M2S_GP1_AXI_RDATA),   // out std_logic_vector(31 downto 0);
        .SAXIGP1RID(),   // out std_logic_vector(5 downto 0);
        .SAXIGP1RLAST(M2S_GP1_AXI_RLAST),   // out std_ulogic;
        .SAXIGP1RRESP(M2S_GP1_AXI_RRESP),   // out std_logic_vector(1 downto 0);
        .SAXIGP1RVALID(M2S_GP1_AXI_RVALID),   // out std_ulogic;
        .SAXIGP1WREADY(M2S_GP1_AXI_WREADY),   // out std_ulogic;
 

        .SAXIHP0ACLK(M2S_HP0_AXI_ACLK),     // in std_ulogic;
        .SAXIHP0ARADDR(M2S_HP0_AXI_ARADDR),  // in std_logic_vector(31 downto 0);
        .SAXIHP0ARBURST(M2S_HP0_AXI_ARBURST),  // in std_logic_vector(1 downto 0);
        .SAXIHP0ARCACHE(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIHP0ARESETN(),   // out std_ulogic;
        .SAXIHP0ARID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIHP0ARLEN(M2S_HP0_AXI_ARLEN),  // in std_logic_vector(3 downto 0);
        .SAXIHP0ARLOCK(2'b0),  // in std_logic_vector(1 downto 0);
        .SAXIHP0ARPROT(3'b0),  // in std_logic_vector(2 downto 0);
        .SAXIHP0ARQOS(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIHP0ARREADY(M2S_HP0_AXI_ARREADY),   // out std_ulogic;
        .SAXIHP0ARSIZE(M2S_HP0_AXI_ARSIZE),  // in std_logic_vector(1 downto 0);
        .SAXIHP0ARVALID(M2S_HP0_AXI_ARVALID),     // in std_ulogic;
        .SAXIHP0AWADDR(M2S_HP0_AXI_AWADDR),  // in std_logic_vector(31 downto 0);
        .SAXIHP0AWBURST(M2S_HP0_AXI_AWBURST),  // in std_logic_vector(1 downto 0);
        .SAXIHP0AWCACHE(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIHP0AWID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIHP0AWLEN(M2S_HP0_AXI_AWLEN),  // in std_logic_vector(3 downto 0);
        .SAXIHP0AWLOCK(2'b0),  // in std_logic_vector(1 downto 0);
        .SAXIHP0AWPROT(3'b0),  // in std_logic_vector(2 downto 0);
        .SAXIHP0AWQOS(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIHP0AWREADY(M2S_HP0_AXI_AWREADY),   // out std_ulogic;
        .SAXIHP0AWSIZE(M2S_HP0_AXI_AWSIZE),  // in std_logic_vector(1 downto 0);
        .SAXIHP0AWVALID(M2S_HP0_AXI_AWVALID),     // in std_ulogic;
        .SAXIHP0BID(),   // out std_logic_vector(2 downto 0);
        .SAXIHP0BREADY(M2S_HP0_AXI_BREADY),     // in std_ulogic;
        .SAXIHP0BRESP(M2S_HP0_AXI_BRESP),   // out std_logic_vector(1 downto 0);
        .SAXIHP0BVALID(M2S_HP0_AXI_BVALID),   // out std_ulogic;
        .SAXIHP0RDATA(M2S_HP0_AXI_RDATA),   // out std_logic_vector(63 downto 0);
        .SAXIHP0RID(),   // out std_logic_vector(2 downto 0);
        .SAXIHP0RLAST(M2S_HP0_AXI_RLAST),   // out std_ulogic;
        .SAXIHP0RREADY(M2S_HP0_AXI_RREADY),     // in std_ulogic;
        .SAXIHP0RRESP(M2S_HP0_AXI_RRESP),   // out std_logic_vector(1 downto 0);
        .SAXIHP0RVALID(M2S_HP0_AXI_RVALID),   // out std_ulogic;
        .SAXIHP0WDATA(M2S_HP0_AXI_WDATA),  // in std_logic_vector(63 downto 0);
        .SAXIHP0WID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIHP0WLAST(M2S_HP0_AXI_WLAST),     // in std_ulogic;
        .SAXIHP0WREADY(M2S_HP0_AXI_WREADY),   // out std_ulogic;
        .SAXIHP0WSTRB(M2S_HP0_AXI_WSTRB),  // in std_logic_vector(7 downto 0);
        .SAXIHP0WVALID(M2S_HP0_AXI_WVALID),     // in std_ulogic;
        .SAXIHP0RDISSUECAP1EN(1'b0),     // in std_ulogic;
        .SAXIHP0WRISSUECAP1EN(1'b0),     // in std_ulogic;
        .SAXIHP0RACOUNT(),  // out std_logic_vector(2 downto 0);
        .SAXIHP0RCOUNT(),  // out std_logic_vector(7 downto 0);
        .SAXIHP0WACOUNT(),  // out std_logic_vector(5 downto 0);
        .SAXIHP0WCOUNT(),  // out std_logic_vector(7 downto 0);

        .SAXIHP1ACLK(M2S_HP1_AXI_ACLK),     // in std_ulogic;
        .SAXIHP1ARADDR(M2S_HP1_AXI_ARADDR),  // in std_logic_vector(31 downto 0);
        .SAXIHP1ARBURST(M2S_HP1_AXI_ARBURST),  // in std_logic_vector(1 downto 0);
        .SAXIHP1ARCACHE(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIHP1ARESETN(),   // out std_ulogic;
        .SAXIHP1ARID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIHP1ARLEN(M2S_HP1_AXI_ARLEN),  // in std_logic_vector(3 downto 0);
        .SAXIHP1ARLOCK(2'b0),  // in std_logic_vector(1 downto 0);
        .SAXIHP1ARPROT(3'b0),  // in std_logic_vector(2 downto 0);
        .SAXIHP1ARQOS(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIHP1ARREADY(M2S_HP1_AXI_ARREADY),   // out std_ulogic;
        .SAXIHP1ARSIZE(M2S_HP1_AXI_ARSIZE),  // in std_logic_vector(1 downto 0);
        .SAXIHP1ARVALID(M2S_HP1_AXI_ARVALID),     // in std_ulogic;
        .SAXIHP1AWADDR(M2S_HP1_AXI_AWADDR),  // in std_logic_vector(31 downto 0);
        .SAXIHP1AWBURST(M2S_HP1_AXI_AWBURST),  // in std_logic_vector(1 downto 0);
        .SAXIHP1AWCACHE(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIHP1AWID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIHP1AWLEN(M2S_HP1_AXI_AWLEN),  // in std_logic_vector(3 downto 0);
        .SAXIHP1AWLOCK(2'b0),  // in std_logic_vector(1 downto 0);
        .SAXIHP1AWPROT(3'b0),  // in std_logic_vector(2 downto 0);
        .SAXIHP1AWQOS(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIHP1AWREADY(M2S_HP1_AXI_AWREADY),   // out std_ulogic;
        .SAXIHP1AWSIZE(M2S_HP1_AXI_AWSIZE),  // in std_logic_vector(1 downto 0);
        .SAXIHP1AWVALID(M2S_HP1_AXI_AWVALID),     // in std_ulogic;
        .SAXIHP1BID(),   // out std_logic_vector(2 downto 0);
        .SAXIHP1BREADY(M2S_HP1_AXI_BREADY),     // in std_ulogic;
        .SAXIHP1BRESP(M2S_HP1_AXI_BRESP),   // out std_logic_vector(1 downto 0);
        .SAXIHP1BVALID(M2S_HP1_AXI_BVALID),   // out std_ulogic;
        .SAXIHP1RDATA(M2S_HP1_AXI_RDATA),   // out std_logic_vector(63 downto 0);
        .SAXIHP1RID(),   // out std_logic_vector(2 downto 0);
        .SAXIHP1RLAST(M2S_HP1_AXI_RLAST),   // out std_ulogic;
        .SAXIHP1RREADY(M2S_HP1_AXI_RREADY),     // in std_ulogic;
        .SAXIHP1RRESP(M2S_HP1_AXI_RRESP),   // out std_logic_vector(1 downto 0);
        .SAXIHP1RVALID(M2S_HP1_AXI_RVALID),   // out std_ulogic;
        .SAXIHP1WDATA(M2S_HP1_AXI_WDATA),  // in std_logic_vector(63 downto 0);
        .SAXIHP1WID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIHP1WLAST(M2S_HP1_AXI_WLAST),     // in std_ulogic;
        .SAXIHP1WREADY(M2S_HP1_AXI_WREADY),   // out std_ulogic;
        .SAXIHP1WSTRB(M2S_HP1_AXI_WSTRB),  // in std_logic_vector(7 downto 0);
        .SAXIHP1WVALID(M2S_HP1_AXI_WVALID),     // in std_ulogic;
        .SAXIHP1RDISSUECAP1EN(1'b0),     // in std_ulogic;
        .SAXIHP1WRISSUECAP1EN(1'b0),     // in std_ulogic;
        .SAXIHP1RACOUNT(),  // out std_logic_vector(2 downto 0);
        .SAXIHP1RCOUNT(),  // out std_logic_vector(7 downto 0);
        .SAXIHP1WACOUNT(),  // out std_logic_vector(5 downto 0);
        .SAXIHP1WCOUNT(),  // out std_logic_vector(7 downto 0);

        .SAXIHP2ACLK(M2S_HP2_AXI_ACLK),     // in std_ulogic;
        .SAXIHP2ARADDR(M2S_HP2_AXI_ARADDR),  // in std_logic_vector(31 downto 0);
        .SAXIHP2ARBURST(M2S_HP2_AXI_ARBURST),  // in std_logic_vector(1 downto 0);
        .SAXIHP2ARCACHE(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIHP2ARESETN(),   // out std_ulogic;
        .SAXIHP2ARID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIHP2ARLEN(M2S_HP2_AXI_ARLEN),  // in std_logic_vector(3 downto 0);
        .SAXIHP2ARLOCK(2'b0),  // in std_logic_vector(1 downto 0);
        .SAXIHP2ARPROT(3'b0),  // in std_logic_vector(2 downto 0);
        .SAXIHP2ARQOS(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIHP2ARREADY(M2S_HP2_AXI_ARREADY),   // out std_ulogic;
        .SAXIHP2ARSIZE(M2S_HP2_AXI_ARSIZE),  // in std_logic_vector(1 downto 0);
        .SAXIHP2ARVALID(M2S_HP2_AXI_ARVALID),     // in std_ulogic;
        .SAXIHP2AWADDR(M2S_HP2_AXI_AWADDR),  // in std_logic_vector(31 downto 0);
        .SAXIHP2AWBURST(M2S_HP2_AXI_AWBURST),  // in std_logic_vector(1 downto 0);
        .SAXIHP2AWCACHE(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIHP2AWID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIHP2AWLEN(M2S_HP2_AXI_AWLEN),  // in std_logic_vector(3 downto 0);
        .SAXIHP2AWLOCK(2'b0),  // in std_logic_vector(1 downto 0);
        .SAXIHP2AWPROT(3'b0),  // in std_logic_vector(2 downto 0);
        .SAXIHP2AWQOS(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIHP2AWREADY(M2S_HP2_AXI_AWREADY),   // out std_ulogic;
        .SAXIHP2AWSIZE(M2S_HP2_AXI_AWSIZE),  // in std_logic_vector(1 downto 0);
        .SAXIHP2AWVALID(M2S_HP2_AXI_AWVALID),     // in std_ulogic;
        .SAXIHP2BID(),   // out std_logic_vector(2 downto 0);
        .SAXIHP2BREADY(M2S_HP2_AXI_BREADY),     // in std_ulogic;
        .SAXIHP2BRESP(M2S_HP2_AXI_BRESP),   // out std_logic_vector(1 downto 0);
        .SAXIHP2BVALID(M2S_HP2_AXI_BVALID),   // out std_ulogic;
        .SAXIHP2RDATA(M2S_HP2_AXI_RDATA),   // out std_logic_vector(63 downto 0);
        .SAXIHP2RID(),   // out std_logic_vector(2 downto 0);
        .SAXIHP2RLAST(M2S_HP2_AXI_RLAST),   // out std_ulogic;
        .SAXIHP2RREADY(M2S_HP2_AXI_RREADY),     // in std_ulogic;
        .SAXIHP2RRESP(M2S_HP2_AXI_RRESP),   // out std_logic_vector(1 downto 0);
        .SAXIHP2RVALID(M2S_HP2_AXI_RVALID),   // out std_ulogic;
        .SAXIHP2WDATA(M2S_HP2_AXI_WDATA),  // in std_logic_vector(63 downto 0);
        .SAXIHP2WID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIHP2WLAST(M2S_HP2_AXI_WLAST),     // in std_ulogic;
        .SAXIHP2WREADY(M2S_HP2_AXI_WREADY),   // out std_ulogic;
        .SAXIHP2WSTRB(M2S_HP2_AXI_WSTRB),  // in std_logic_vector(7 downto 0);
        .SAXIHP2WVALID(M2S_HP2_AXI_WVALID),     // in std_ulogic;
        .SAXIHP2RDISSUECAP1EN(1'b0),     // in std_ulogic;
        .SAXIHP2WRISSUECAP1EN(1'b0),     // in std_ulogic;
        .SAXIHP2RACOUNT(),  // out std_logic_vector(2 downto 0);
        .SAXIHP2RCOUNT(),  // out std_logic_vector(7 downto 0);
        .SAXIHP2WACOUNT(),  // out std_logic_vector(5 downto 0);
        .SAXIHP2WCOUNT(),  // out std_logic_vector(7 downto 0);


        .SAXIHP3ACLK(M2S_HP3_AXI_ACLK),     // in std_ulogic;
        .SAXIHP3ARADDR(M2S_HP3_AXI_ARADDR),  // in std_logic_vector(31 downto 0);
        .SAXIHP3ARBURST(M2S_HP3_AXI_ARBURST),  // in std_logic_vector(1 downto 0);
        .SAXIHP3ARCACHE(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIHP3ARESETN(),   // out std_ulogic;
        .SAXIHP3ARID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIHP3ARLEN(M2S_HP3_AXI_ARLEN),  // in std_logic_vector(3 downto 0);
        .SAXIHP3ARLOCK(2'b0),  // in std_logic_vector(1 downto 0);
        .SAXIHP3ARPROT(3'b0),  // in std_logic_vector(2 downto 0);
        .SAXIHP3ARQOS(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIHP3ARREADY(M2S_HP3_AXI_ARREADY),   // out std_ulogic;
        .SAXIHP3ARSIZE(M2S_HP3_AXI_ARSIZE),  // in std_logic_vector(1 downto 0);
        .SAXIHP3ARVALID(M2S_HP3_AXI_ARVALID),     // in std_ulogic;
        .SAXIHP3AWADDR(M2S_HP3_AXI_AWADDR),  // in std_logic_vector(31 downto 0);
        .SAXIHP3AWBURST(M2S_HP3_AXI_AWBURST),  // in std_logic_vector(1 downto 0);
        .SAXIHP3AWCACHE(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIHP3AWID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIHP3AWLEN(M2S_HP3_AXI_AWLEN),  // in std_logic_vector(3 downto 0);
        .SAXIHP3AWLOCK(2'b0),  // in std_logic_vector(1 downto 0);
        .SAXIHP3AWPROT(3'b0),  // in std_logic_vector(2 downto 0);
        .SAXIHP3AWQOS(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIHP3AWREADY(M2S_HP3_AXI_AWREADY),   // out std_ulogic;
        .SAXIHP3AWSIZE(M2S_HP3_AXI_AWSIZE),  // in std_logic_vector(1 downto 0);
        .SAXIHP3AWVALID(M2S_HP3_AXI_AWVALID),     // in std_ulogic;
        .SAXIHP3BID(),   // out std_logic_vector(2 downto 0);
        .SAXIHP3BREADY(M2S_HP3_AXI_BREADY),     // in std_ulogic;
        .SAXIHP3BRESP(M2S_HP3_AXI_BRESP),   // out std_logic_vector(1 downto 0);
        .SAXIHP3BVALID(M2S_HP3_AXI_BVALID),   // out std_ulogic;
        .SAXIHP3RDATA(M2S_HP3_AXI_RDATA),   // out std_logic_vector(63 downto 0);
        .SAXIHP3RID(),   // out std_logic_vector(2 downto 0);
        .SAXIHP3RLAST(M2S_HP3_AXI_RLAST),   // out std_ulogic;
        .SAXIHP3RREADY(M2S_HP3_AXI_RREADY),     // in std_ulogic;
        .SAXIHP3RRESP(M2S_HP3_AXI_RRESP),   // out std_logic_vector(1 downto 0);
        .SAXIHP3RVALID(M2S_HP3_AXI_RVALID),   // out std_ulogic;
        .SAXIHP3WDATA(M2S_HP3_AXI_WDATA),  // in std_logic_vector(63 downto 0);
        .SAXIHP3WID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIHP3WLAST(M2S_HP3_AXI_WLAST),     // in std_ulogic;
        .SAXIHP3WREADY(M2S_HP3_AXI_WREADY),   // out std_ulogic;
        .SAXIHP3WSTRB(M2S_HP3_AXI_WSTRB),  // in std_logic_vector(7 downto 0);
        .SAXIHP3WVALID(M2S_HP3_AXI_WVALID),     // in std_ulogic;
        .SAXIHP3RDISSUECAP1EN(1'b0),     // in std_ulogic;
        .SAXIHP3WRISSUECAP1EN(1'b0),     // in std_ulogic;
        .SAXIHP3RACOUNT(),  // out std_logic_vector(2 downto 0);
        .SAXIHP3RCOUNT(),  // out std_logic_vector(7 downto 0);
        .SAXIHP3WACOUNT(),  // out std_logic_vector(5 downto 0);
        .SAXIHP3WCOUNT(),  // out std_logic_vector(7 downto 0);


        .SAXIACPARUSER(5'b0),  // in std_logic_vector(4 downto 0);
        .SAXIACPAWUSER(5'b0),  // in std_logic_vector(4 downto 0);
        .SAXIACPACLK(M2S_ACP_AXI_ACLK),   // in std_ulogic;
        .SAXIACPARADDR(M2S_ACP_AXI_ARADDR),
        .SAXIACPARBURST(M2S_ACP_AXI_ARBURST), // in std_logic_vector(1 downto 0);
        .SAXIACPARCACHE(4'b0), // in std_logic_vector(3 downto 0);
        .SAXIACPARESETN(),  // out std_ulogic;
        .SAXIACPARID(3'b0),   // in std_logic_vector(2 downto 0);
        .SAXIACPARLEN(M2S_ACP_AXI_ARLEN), // in std_logic_vector(3 downto 0);
        .SAXIACPARLOCK(2'b0), // in std_logic_vector(1 downto 0);
        .SAXIACPARPROT(3'b0), // in std_logic_vector(2 downto 0);
        .SAXIACPARQOS(4'b0), // in std_logic_vector(3 downto 0);
        .SAXIACPARREADY(M2S_ACP_AXI_ARREADY),
        .SAXIACPARSIZE(M2S_ACP_AXI_ARSIZE), // in std_logic_vector(1 downto 0);
        .SAXIACPARVALID(M2S_ACP_AXI_ARVALID),
        .SAXIACPAWADDR(M2S_ACP_AXI_AWADDR),
        .SAXIACPAWBURST(M2S_ACP_AXI_AWBURST), // in std_logic_vector(1 downto 0);
        .SAXIACPAWCACHE(4'b0), // in std_logic_vector(3 downto 0);
        .SAXIACPAWID(3'b0),   // in std_logic_vector(2 downto 0);
        .SAXIACPAWLEN(M2S_ACP_AXI_AWLEN), // in std_logic_vector(3 downto 0);
        .SAXIACPAWLOCK(2'b0), // in std_logic_vector(1 downto 0);
        .SAXIACPAWPROT(3'b0), // in std_logic_vector(2 downto 0);
        .SAXIACPAWQOS(4'b0), // in std_logic_vector(3 downto 0);
        .SAXIACPAWREADY(M2S_ACP_AXI_AWREADY),
        .SAXIACPAWSIZE(M2S_ACP_AXI_AWSIZE), // in std_logic_vector(1 downto 0);
        .SAXIACPAWVALID(M2S_ACP_AXI_AWVALID),
        .SAXIACPBID(),    // out std_logic_vector(5 downto 0);
        .SAXIACPBREADY(M2S_ACP_AXI_BREADY),
        .SAXIACPBRESP(M2S_ACP_AXI_BRESP),
        .SAXIACPBVALID(M2S_ACP_AXI_BVALID),
        .SAXIACPRDATA(M2S_ACP_AXI_RDATA),
        .SAXIACPRID(),    // out std_logic_vector(5 downto 0);
        .SAXIACPRLAST(M2S_ACP_AXI_RLAST),  // out std_ulogic;
        .SAXIACPRREADY(M2S_ACP_AXI_RREADY),
        .SAXIACPRRESP(M2S_ACP_AXI_RRESP),
        .SAXIACPRVALID(M2S_ACP_AXI_RVALID),
        .SAXIACPWDATA(M2S_ACP_AXI_WDATA),
        .SAXIACPWID(3'b0),   // in std_logic_vector(2 downto 0);
        .SAXIACPWLAST(M2S_ACP_AXI_WLAST), // in std_ulogic;
        .SAXIACPWREADY(M2S_ACP_AXI_WREADY),
        .SAXIACPWSTRB(M2S_ACP_AXI_WSTRB),
        .SAXIACPWVALID(M2S_ACP_AXI_WVALID)
    );


endmodule : ps7_wrap
module ps7_stub (inout [53:0] MIO, output  DDR_WEB, inout  DDR_VRP, inout  DDR_VRN, inout  DDR_RAS_n, inout  DDR_ODT, inout  DDR_DRSTB, inout [3:0] DDR_DQS, inout [3:0] DDR_DQS_n, inout [31:0] DDR_DQ, inout [3:0] DDR_DM, inout  DDR_CS_n, inout  DDR_CKE, inout  DDR_Clk, inout  DDR_Clk_n, inout  DDR_CAS_n, inout [2:0] DDR_BankAddr, inout [14:0] DDR_Addr, inout  PS_PORB, inout  PS_SRSTB, inout  PS_CLK, output  CLK, output  RST_n);
//module ps7_stub(
//
//    // Non-Axi PS7 signals
//    inout [53:0] MIO,
//    inout PS_SRSTB,
//    inout PS_CLK,
//    inout PS_PORB,
//    inout DDR_Clk,
//    inout DDR_Clk_n,
//    inout DDR_CKE,
//    inout DDR_CS_n,
//    inout DDR_RAS_n,
//    inout DDR_CAS_n,
//    output DDR_WEB,
//    inout [2:0] DDR_BankAddr,
//    inout [14:0] DDR_Addr,
//    inout DDR_ODT,
//    inout DDR_DRSTB,
//    inout [31:0] DDR_DQ,
//    inout [3:0] DDR_DM,
//    inout [3:0] DDR_DQS,
//    inout [3:0] DDR_DQS_n,
//    inout DDR_VRN,
//    inout DDR_VRP,
//    output CLK
//)


    wire [3:0] FCLKCLK;
    wire [3:0] FCLKRESETN;

    assign CLK = FCLKCLK[0];
    assign RST_n = FCLKRESETN[0];
/////////////////////////////////////
// Slave -> Master GP0
/////////////////////////////////////
    wire S2M_GP0_AXI_ACLK;

    // Read interface
    wire S2M_GP0_AXI_ARVALID;
    wire S2M_GP0_AXI_ARREADY;
    wire [31:0] S2M_GP0_AXI_ARADDR;
    wire [11:0] S2M_GP0_AXI_ARID;

    wire S2M_GP0_AXI_RVALID;
    wire S2M_GP0_AXI_RREADY;
    wire S2M_GP0_AXI_RLAST;
    wire [31:0] S2M_GP0_AXI_RDATA;
    wire [11:0] S2M_GP0_AXI_RID;

    wire [1:0] S2M_GP0_AXI_RRESP;


    //write interface
    wire S2M_GP0_AXI_AWVALID;
    wire S2M_GP0_AXI_AWREADY;
    wire [31:0] S2M_GP0_AXI_AWADDR;
    wire [11:0] S2M_GP0_AXI_AWID;

    wire S2M_GP0_AXI_WVALID;
    wire S2M_GP0_AXI_WREADY;
    wire [31:0] S2M_GP0_AXI_WDATA;
    wire [3:0] S2M_GP0_AXI_WSTRB;

    wire S2M_GP0_AXI_BVALID;
    wire S2M_GP0_AXI_BREADY;
    wire [1:0] S2M_GP0_AXI_BRESP;
    wire [11:0] S2M_GP0_AXI_BID;

/////////////////////////////////////
// Slave -> Master GP1
/////////////////////////////////////
    wire S2M_GP1_AXI_ACLK;

    // Read interface
    wire S2M_GP1_AXI_ARVALID;
    wire S2M_GP1_AXI_ARREADY;
    wire [31:0] S2M_GP1_AXI_ARADDR;
    wire [11:0] S2M_GP1_AXI_ARID;

    wire S2M_GP1_AXI_RVALID;
    wire S2M_GP1_AXI_RREADY;
    wire S2M_GP1_AXI_RLAST;
    wire [31:0] S2M_GP1_AXI_RDATA;
    wire [11:0] S2M_GP1_AXI_RID;

    wire [1:0] S2M_GP1_AXI_RRESP;

    //write interface
    wire S2M_GP1_AXI_AWVALID;
    wire S2M_GP1_AXI_AWREADY;
    wire [31:0] S2M_GP1_AXI_AWADDR;
    wire [11:0] S2M_GP1_AXI_AWID;

    wire S2M_GP1_AXI_WVALID;
    wire S2M_GP1_AXI_WREADY;
    wire [31:0] S2M_GP1_AXI_WDATA;
    wire [3:0] S2M_GP1_AXI_WSTRB;

    wire S2M_GP1_AXI_BVALID;
    wire S2M_GP1_AXI_BREADY;
    wire [1:0] S2M_GP1_AXI_BRESP;
    wire [11:0] S2M_GP1_AXI_BID;

    
/////////////////////////////////////
// Master -> Slave interface GP0
/////////////////////////////////////
    wire M2S_GP0_AXI_ACLK;
    
    //Read M2S_GP0_AXI_transation
    
    wire M2S_GP0_AXI_ARVALID;
    wire M2S_GP0_AXI_ARREADY;
    wire [31:0] M2S_GP0_AXI_ARADDR;
    wire [1:0] M2S_GP0_AXI_ARBURST;
    wire [3:0] M2S_GP0_AXI_ARLEN;
    wire [1:0] M2S_GP0_AXI_ARSIZE;
    //
    wire M2S_GP0_AXI_RVALID;
    wire M2S_GP0_AXI_RREADY;
    wire M2S_GP0_AXI_RLAST;
    wire [31:0] M2S_GP0_AXI_RDATA;
    //
    wire [1:0] M2S_GP0_AXI_RRESP;
   
    // Write M2S_GP0_AXI_Transaction
    wire M2S_GP0_AXI_AWVALID;
    wire M2S_GP0_AXI_AWREADY;
    wire [31:0] M2S_GP0_AXI_AWADDR;
    wire [1:0] M2S_GP0_AXI_AWBURST;
    wire [3:0] M2S_GP0_AXI_AWLEN;
    wire [1:0] M2S_GP0_AXI_AWSIZE;
    //
    wire M2S_GP0_AXI_WVALID;
    wire M2S_GP0_AXI_WREADY;
    wire M2S_GP0_AXI_WLAST;
    wire [31:0] M2S_GP0_AXI_WDATA;
    wire [3:0] M2S_GP0_AXI_WSTRB;
    //
    wire M2S_GP0_AXI_BVALID;
    wire M2S_GP0_AXI_BREADY;
    wire [1:0] M2S_GP0_AXI_BRESP;

/////////////////////////////////////
// Master -> Slave interface GP1
/////////////////////////////////////
    wire M2S_GP1_AXI_ACLK;
    
    //Read M2S_GP1_AXI_transation
    
    wire M2S_GP1_AXI_ARVALID;
    wire M2S_GP1_AXI_ARREADY;
    wire [31:0] M2S_GP1_AXI_ARADDR;
    wire [1:0] M2S_GP1_AXI_ARBURST;
    wire [3:0] M2S_GP1_AXI_ARLEN;
    wire [1:0] M2S_GP1_AXI_ARSIZE;
    //
    wire M2S_GP1_AXI_RVALID;
    wire M2S_GP1_AXI_RREADY;
    wire M2S_GP1_AXI_RLAST;
    wire [31:0] M2S_GP1_AXI_RDATA;
    //
    wire [1:0] M2S_GP1_AXI_RRESP;
   
    // Write M2S_GP1_AXI_Transaction
    wire M2S_GP1_AXI_AWVALID;
    wire M2S_GP1_AXI_AWREADY;
    wire [31:0] M2S_GP1_AXI_AWADDR;
    wire [1:0] M2S_GP1_AXI_AWBURST;
    wire [3:0] M2S_GP1_AXI_AWLEN;
    wire [1:0] M2S_GP1_AXI_AWSIZE;
    //
    wire M2S_GP1_AXI_WVALID;
    wire M2S_GP1_AXI_WREADY;
    wire M2S_GP1_AXI_WLAST;
    wire [31:0] M2S_GP1_AXI_WDATA;
    wire [3:0] M2S_GP1_AXI_WSTRB;
    //
    wire M2S_GP1_AXI_BVALID;
    wire M2S_GP1_AXI_BREADY;
    wire [1:0] M2S_GP1_AXI_BRESP;

/////////////////////////////////////
// Master -> Slave interface HP0
/////////////////////////////////////
    wire M2S_HP0_AXI_ACLK;
    
    //Read M2S_HP0_AXI_transation
    
    wire M2S_HP0_AXI_ARVALID;
    wire M2S_HP0_AXI_ARREADY;
    wire [31:0] M2S_HP0_AXI_ARADDR;
    wire [1:0] M2S_HP0_AXI_ARBURST;
    wire [3:0] M2S_HP0_AXI_ARLEN;
    wire [1:0] M2S_HP0_AXI_ARSIZE;
    //
    wire M2S_HP0_AXI_RVALID;
    wire M2S_HP0_AXI_RREADY;
    wire M2S_HP0_AXI_RLAST;
    wire [63:0] M2S_HP0_AXI_RDATA;
    //
    wire [1:0] M2S_HP0_AXI_RRESP;
   
    // Write M2S_HP0_AXI_Transaction
    wire M2S_HP0_AXI_AWVALID;
    wire M2S_HP0_AXI_AWREADY;
    wire [31:0] M2S_HP0_AXI_AWADDR;
    wire [1:0] M2S_HP0_AXI_AWBURST;
    wire [3:0] M2S_HP0_AXI_AWLEN;
    wire [1:0] M2S_HP0_AXI_AWSIZE;
    //
    wire M2S_HP0_AXI_WVALID;
    wire M2S_HP0_AXI_WREADY;
    wire M2S_HP0_AXI_WLAST;
    wire [63:0] M2S_HP0_AXI_WDATA;
    wire [7:0] M2S_HP0_AXI_WSTRB;
    //
    wire M2S_HP0_AXI_BVALID;
    wire M2S_HP0_AXI_BREADY;
    wire [1:0] M2S_HP0_AXI_BRESP;

/////////////////////////////////////
// Master -> Slave interface HP1
/////////////////////////////////////
    wire M2S_HP1_AXI_ACLK;
    
    //Read M2S_HP1_AXI_transation
    
    wire M2S_HP1_AXI_ARVALID;
    wire M2S_HP1_AXI_ARREADY;
    wire [31:0] M2S_HP1_AXI_ARADDR;
    wire [1:0] M2S_HP1_AXI_ARBURST;
    wire [3:0] M2S_HP1_AXI_ARLEN;
    wire [1:0] M2S_HP1_AXI_ARSIZE;
    //
    wire M2S_HP1_AXI_RVALID;
    wire M2S_HP1_AXI_RREADY;
    wire M2S_HP1_AXI_RLAST;
    wire [63:0] M2S_HP1_AXI_RDATA;
    //
    wire [1:0] M2S_HP1_AXI_RRESP;
   
    // Write M2S_HP1_AXI_Transaction
    wire M2S_HP1_AXI_AWVALID;
    wire M2S_HP1_AXI_AWREADY;
    wire [31:0] M2S_HP1_AXI_AWADDR;
    wire [1:0] M2S_HP1_AXI_AWBURST;
    wire [3:0] M2S_HP1_AXI_AWLEN;
    wire [1:0] M2S_HP1_AXI_AWSIZE;
    //
    wire M2S_HP1_AXI_WVALID;
    wire M2S_HP1_AXI_WREADY;
    wire M2S_HP1_AXI_WLAST;
    wire [63:0] M2S_HP1_AXI_WDATA;
    wire [7:0] M2S_HP1_AXI_WSTRB;
    //
    wire M2S_HP1_AXI_BVALID;
    wire M2S_HP1_AXI_BREADY;
    wire [1:0] M2S_HP1_AXI_BRESP;

/////////////////////////////////////
// Master -> Slave interface HP2
/////////////////////////////////////
    wire M2S_HP2_AXI_ACLK;
    
    //Read M2S_HP2_AXI_transation
    
    wire M2S_HP2_AXI_ARVALID;
    wire M2S_HP2_AXI_ARREADY;
    wire [31:0] M2S_HP2_AXI_ARADDR;
    wire [1:0] M2S_HP2_AXI_ARBURST;
    wire [3:0] M2S_HP2_AXI_ARLEN;
    wire [1:0] M2S_HP2_AXI_ARSIZE;
    //
    wire M2S_HP2_AXI_RVALID;
    wire M2S_HP2_AXI_RREADY;
    wire M2S_HP2_AXI_RLAST;
    wire [63:0] M2S_HP2_AXI_RDATA;
    //
    wire [1:0] M2S_HP2_AXI_RRESP;
   
    // Write M2S_HP2_AXI_Transaction
    wire M2S_HP2_AXI_AWVALID;
    wire M2S_HP2_AXI_AWREADY;
    wire [31:0] M2S_HP2_AXI_AWADDR;
    wire [1:0] M2S_HP2_AXI_AWBURST;
    wire [3:0] M2S_HP2_AXI_AWLEN;
    wire [1:0] M2S_HP2_AXI_AWSIZE;
    //
    wire M2S_HP2_AXI_WVALID;
    wire M2S_HP2_AXI_WREADY;
    wire M2S_HP2_AXI_WLAST;
    wire [63:0] M2S_HP2_AXI_WDATA;
    wire [7:0] M2S_HP2_AXI_WSTRB;
    //
    wire M2S_HP2_AXI_BVALID;
    wire M2S_HP2_AXI_BREADY;
    wire [1:0] M2S_HP2_AXI_BRESP;

/////////////////////////////////////
// Master -> Slave interface HP3
/////////////////////////////////////
    wire M2S_HP3_AXI_ACLK;
    
    //Read M2S_HP3_AXI_transation
    
    wire M2S_HP3_AXI_ARVALID;
    wire M2S_HP3_AXI_ARREADY;
    wire [31:0] M2S_HP3_AXI_ARADDR;
    wire [1:0] M2S_HP3_AXI_ARBURST;
    wire [3:0] M2S_HP3_AXI_ARLEN;
    wire [1:0] M2S_HP3_AXI_ARSIZE;
    //
    wire M2S_HP3_AXI_RVALID;
    wire M2S_HP3_AXI_RREADY;
    wire M2S_HP3_AXI_RLAST;
    wire [63:0] M2S_HP3_AXI_RDATA;
    //
    wire [1:0] M2S_HP3_AXI_RRESP;
   
    // Write M2S_HP3_AXI_Transaction
    wire M2S_HP3_AXI_AWVALID;
    wire M2S_HP3_AXI_AWREADY;
    wire [31:0] M2S_HP3_AXI_AWADDR;
    wire [1:0] M2S_HP3_AXI_AWBURST;
    wire [3:0] M2S_HP3_AXI_AWLEN;
    wire [1:0] M2S_HP3_AXI_AWSIZE;
    //
    wire M2S_HP3_AXI_WVALID;
    wire M2S_HP3_AXI_WREADY;
    wire M2S_HP3_AXI_WLAST;
    wire [63:0] M2S_HP3_AXI_WDATA;
    wire [7:0] M2S_HP3_AXI_WSTRB;
    //
    wire M2S_HP3_AXI_BVALID;
    wire M2S_HP3_AXI_BREADY;
    wire [1:0] M2S_HP3_AXI_BRESP;

/////////////////////////////////////
// Master -> Slave interface ACP
/////////////////////////////////////
    wire M2S_ACP_AXI_ACLK;
    
    //Read M2S_ACP_AXI_transation
    
    wire M2S_ACP_AXI_ARVALID;
    wire M2S_ACP_AXI_ARREADY;
    wire [31:0] M2S_ACP_AXI_ARADDR;
    wire [1:0] M2S_ACP_AXI_ARBURST;
    wire [3:0] M2S_ACP_AXI_ARLEN;
    wire [1:0] M2S_ACP_AXI_ARSIZE;
    //
    wire M2S_ACP_AXI_RVALID;
    wire M2S_ACP_AXI_RREADY;
    wire M2S_ACP_AXI_RLAST;
    wire [63:0] M2S_ACP_AXI_RDATA;
    //
    wire [1:0] M2S_ACP_AXI_RRESP;
   
    // Write M2S_ACP_AXI_Transaction
    wire M2S_ACP_AXI_AWVALID;
    wire M2S_ACP_AXI_AWREADY;
    wire [31:0] M2S_ACP_AXI_AWADDR;
    wire [1:0] M2S_ACP_AXI_AWBURST;
    wire [3:0] M2S_ACP_AXI_AWLEN;
    wire [1:0] M2S_ACP_AXI_AWSIZE;
    //
    wire M2S_ACP_AXI_WVALID;
    wire M2S_ACP_AXI_WREADY;
    wire M2S_ACP_AXI_WLAST;
    wire [63:0] M2S_ACP_AXI_WDATA;
    wire [7:0] M2S_ACP_AXI_WSTRB;
    //
    wire M2S_ACP_AXI_BVALID;
    wire M2S_ACP_AXI_BREADY;
    wire [1:0] M2S_ACP_AXI_BRESP;

    ps7_wrap ps7_wrap_inst(
        .MIO(MIO),
        .PS_SRSTB(PS_SRSTB),
        .PS_CLK(PS_CLK),
        .PS_PORB(PS_PORB),
        .DDR_Clk(DDR_Clk),
        .DDR_Clk_n(DDR_Clk_n),
        .DDR_CKE(DDR_CKE),
        .DDR_CS_n(DDR_CS_n),
        .DDR_RAS_n(DDR_RAS_n),
        .DDR_CAS_n(DDR_CAS_n),
        .DDR_WEB(DDR_WEB),
        .DDR_BankAddr(DDR_BankAddr),
        .DDR_Addr(DDR_Addr),
        .DDR_ODT(DDR_ODT),
        .DDR_DRSTB(DDR_DRSTB),
        .DDR_DQ(DDR_DQ),
        .DDR_DM(DDR_DM),
        .DDR_DQS(DDR_DQS),
        .DDR_DQS_n(DDR_DQS_n),
        .DDR_VRN(DDR_VRN),
        .DDR_VRP(DDR_VRP),

        .FCLKCLK(FCLKCLK[3:0]),
        .FCLKRESETN(FCLKRESETN[3:0]),

    /////////////////////////////////////
    // Slave -> Master GP0
    /////////////////////////////////////
        .S2M_GP0_AXI_ACLK(S2M_GP0_AXI_ACLK),

        // Read interface
        .S2M_GP0_AXI_ARVALID(S2M_GP0_AXI_ARVALID),
        .S2M_GP0_AXI_ARREADY(S2M_GP0_AXI_ARREADY),
        .S2M_GP0_AXI_ARADDR(S2M_GP0_AXI_ARADDR[31:0]),
        .S2M_GP0_AXI_ARID(S2M_GP0_AXI_ARID[11:0]),

        .S2M_GP0_AXI_RVALID(S2M_GP0_AXI_RVALID),
        .S2M_GP0_AXI_RREADY(S2M_GP0_AXI_RREADY),
        .S2M_GP0_AXI_RLAST(S2M_GP0_AXI_RLAST),
        .S2M_GP0_AXI_RDATA(S2M_GP0_AXI_RDATA[31:0]),
        .S2M_GP0_AXI_RID(S2M_GP0_AXI_RID[11:0]),

        .S2M_GP0_AXI_RRESP(S2M_GP0_AXI_RRESP[1:0]),


        //write interface
        .S2M_GP0_AXI_AWVALID(S2M_GP0_AXI_AWVALID),
        .S2M_GP0_AXI_AWREADY(S2M_GP0_AXI_AWREADY),
        .S2M_GP0_AXI_AWADDR(S2M_GP0_AXI_AWADDR[31:0]),
        .S2M_GP0_AXI_AWID(S2M_GP0_AXI_AWID[11:0]),

        .S2M_GP0_AXI_WVALID(S2M_GP0_AXI_WVALID),
        .S2M_GP0_AXI_WREADY(S2M_GP0_AXI_WREADY),
        .S2M_GP0_AXI_WDATA(S2M_GP0_AXI_WDATA[31:0]),
        .S2M_GP0_AXI_WSTRB(S2M_GP0_AXI_WSTRB[3:0]),

        .S2M_GP0_AXI_BVALID(S2M_GP0_AXI_BVALID),
        .S2M_GP0_AXI_BREADY(S2M_GP0_AXI_BREADY),
        .S2M_GP0_AXI_BRESP(S2M_GP0_AXI_BRESP[1:0]),
        .S2M_GP0_AXI_BID(S2M_GP0_AXI_BID[11:0]),

    /////////////////////////////////////
    // Slave -> Master GP1
    /////////////////////////////////////
        .S2M_GP1_AXI_ACLK(S2M_GP1_AXI_ACLK),

        // Read interface
        .S2M_GP1_AXI_ARVALID(S2M_GP1_AXI_ARVALID),
        .S2M_GP1_AXI_ARREADY(S2M_GP1_AXI_ARREADY),
        .S2M_GP1_AXI_ARADDR(S2M_GP1_AXI_ARADDR[31:0]),
        .S2M_GP1_AXI_ARID(S2M_GP1_AXI_ARID[11:0]),

        .S2M_GP1_AXI_RVALID(S2M_GP1_AXI_RVALID),
        .S2M_GP1_AXI_RREADY(S2M_GP1_AXI_RREADY),
        .S2M_GP1_AXI_RLAST(S2M_GP1_AXI_RLAST),
        .S2M_GP1_AXI_RDATA(S2M_GP1_AXI_RDATA[31:0]),
        .S2M_GP1_AXI_RID(S2M_GP1_AXI_RID[11:0]),

        .S2M_GP1_AXI_RRESP(S2M_GP1_AXI_RRESP[1:0]),

        //write interface
        .S2M_GP1_AXI_AWVALID(S2M_GP1_AXI_AWVALID),
        .S2M_GP1_AXI_AWREADY(S2M_GP1_AXI_AWREADY),
        .S2M_GP1_AXI_AWADDR(S2M_GP1_AXI_AWADDR[31:0]),
        .S2M_GP1_AXI_AWID(S2M_GP1_AXI_AWID[11:0]),

        .S2M_GP1_AXI_WVALID(S2M_GP1_AXI_WVALID),
        .S2M_GP1_AXI_WREADY(S2M_GP1_AXI_WREADY),
        .S2M_GP1_AXI_WDATA(S2M_GP1_AXI_WDATA[31:0]),
        .S2M_GP1_AXI_WSTRB(S2M_GP1_AXI_WSTRB[3:0]),

        .S2M_GP1_AXI_BVALID(S2M_GP1_AXI_BVALID),
        .S2M_GP1_AXI_BREADY(S2M_GP1_AXI_BREADY),
        .S2M_GP1_AXI_BRESP(S2M_GP1_AXI_BRESP[1:0]),
        .S2M_GP1_AXI_BID(S2M_GP1_AXI_BID[11:0]),

        
    /////////////////////////////////////
    // Master -> Slave interface GP0
    /////////////////////////////////////
        .M2S_GP0_AXI_ACLK(M2S_GP0_AXI_ACLK),
        
        //Read M2S_GP0_AXI_transation
        
        .M2S_GP0_AXI_ARVALID(M2S_GP0_AXI_ARVALID),
        .M2S_GP0_AXI_ARREADY(M2S_GP0_AXI_ARREADY),
        .M2S_GP0_AXI_ARADDR(M2S_GP0_AXI_ARADDR[31:0]),
        .M2S_GP0_AXI_ARBURST(M2S_GP0_AXI_ARBURST[1:0]),
        .M2S_GP0_AXI_ARLEN(M2S_GP0_AXI_ARLEN[3:0]),
        .M2S_GP0_AXI_ARSIZE(M2S_GP0_AXI_ARSIZE[1:0]),
        //
        .M2S_GP0_AXI_RVALID(M2S_GP0_AXI_RVALID),
        .M2S_GP0_AXI_RREADY(M2S_GP0_AXI_RREADY),
        .M2S_GP0_AXI_RLAST(M2S_GP0_AXI_RLAST),
        .M2S_GP0_AXI_RDATA(M2S_GP0_AXI_RDATA[31:0]),
        //
        .M2S_GP0_AXI_RRESP(M2S_GP0_AXI_RRESP[1:0]),
       
        // Write M2S_GP0_AXI_Transaction
        .M2S_GP0_AXI_AWVALID(M2S_GP0_AXI_AWVALID),
        .M2S_GP0_AXI_AWREADY(M2S_GP0_AXI_AWREADY),
        .M2S_GP0_AXI_AWADDR(M2S_GP0_AXI_AWADDR[31:0]),
        .M2S_GP0_AXI_AWBURST(M2S_GP0_AXI_AWBURST[1:0]),
        .M2S_GP0_AXI_AWLEN(M2S_GP0_AXI_AWLEN[3:0]),
        .M2S_GP0_AXI_AWSIZE(M2S_GP0_AXI_AWSIZE[1:0]),
        //
        .M2S_GP0_AXI_WVALID(M2S_GP0_AXI_WVALID),
        .M2S_GP0_AXI_WREADY(M2S_GP0_AXI_WREADY),
        .M2S_GP0_AXI_WLAST(M2S_GP0_AXI_WLAST),
        .M2S_GP0_AXI_WDATA(M2S_GP0_AXI_WDATA[31:0]),
        .M2S_GP0_AXI_WSTRB(M2S_GP0_AXI_WSTRB[3:0]),
        //
        .M2S_GP0_AXI_BVALID(M2S_GP0_AXI_BVALID),
        .M2S_GP0_AXI_BREADY(M2S_GP0_AXI_BREADY),
        .M2S_GP0_AXI_BRESP(M2S_GP0_AXI_BRESP[1:0]),

    /////////////////////////////////////
    // Master -> Slave interface GP1
    /////////////////////////////////////
        .M2S_GP1_AXI_ACLK(M2S_GP1_AXI_ACLK),
        
        //Read M2S_GP1_AXI_transation
        
        .M2S_GP1_AXI_ARVALID(M2S_GP1_AXI_ARVALID),
        .M2S_GP1_AXI_ARREADY(M2S_GP1_AXI_ARREADY),
        .M2S_GP1_AXI_ARADDR(M2S_GP1_AXI_ARADDR[31:0]),
        .M2S_GP1_AXI_ARBURST(M2S_GP1_AXI_ARBURST[1:0]),
        .M2S_GP1_AXI_ARLEN(M2S_GP1_AXI_ARLEN[3:0]),
        .M2S_GP1_AXI_ARSIZE(M2S_GP1_AXI_ARSIZE[1:0]),
        //
        .M2S_GP1_AXI_RVALID(M2S_GP1_AXI_RVALID),
        .M2S_GP1_AXI_RREADY(M2S_GP1_AXI_RREADY),
        .M2S_GP1_AXI_RLAST(M2S_GP1_AXI_RLAST),
        .M2S_GP1_AXI_RDATA(M2S_GP1_AXI_RDATA[31:0]),
        //
        .M2S_GP1_AXI_RRESP(M2S_GP1_AXI_RRESP[1:0]),
       
        // Write M2S_GP1_AXI_Transaction
        .M2S_GP1_AXI_AWVALID(M2S_GP1_AXI_AWVALID),
        .M2S_GP1_AXI_AWREADY(M2S_GP1_AXI_AWREADY),
        .M2S_GP1_AXI_AWADDR(M2S_GP1_AXI_AWADDR[31:0]),
        .M2S_GP1_AXI_AWBURST(M2S_GP1_AXI_AWBURST[1:0]),
        .M2S_GP1_AXI_AWLEN(M2S_GP1_AXI_AWLEN[3:0]),
        .M2S_GP1_AXI_AWSIZE(M2S_GP1_AXI_AWSIZE[1:0]),
        //
        .M2S_GP1_AXI_WVALID(M2S_GP1_AXI_WVALID),
        .M2S_GP1_AXI_WREADY(M2S_GP1_AXI_WREADY),
        .M2S_GP1_AXI_WLAST(M2S_GP1_AXI_WLAST),
        .M2S_GP1_AXI_WDATA(M2S_GP1_AXI_WDATA[31:0]),
        .M2S_GP1_AXI_WSTRB(M2S_GP1_AXI_WSTRB[3:0]),
        //
        .M2S_GP1_AXI_BVALID(M2S_GP1_AXI_BVALID),
        .M2S_GP1_AXI_BREADY(M2S_GP1_AXI_BREADY),
        .M2S_GP1_AXI_BRESP(M2S_GP1_AXI_BRESP[1:0]),

    /////////////////////////////////////
    // Master -> Slave interface HP0
    /////////////////////////////////////
        .M2S_HP0_AXI_ACLK(M2S_HP0_AXI_ACLK),
        
        //Read M2S_HP0_AXI_transation
        
        .M2S_HP0_AXI_ARVALID(M2S_HP0_AXI_ARVALID),
        .M2S_HP0_AXI_ARREADY(M2S_HP0_AXI_ARREADY),
        .M2S_HP0_AXI_ARADDR(M2S_HP0_AXI_ARADDR[31:0]),
        .M2S_HP0_AXI_ARBURST(M2S_HP0_AXI_ARBURST[1:0]),
        .M2S_HP0_AXI_ARLEN(M2S_HP0_AXI_ARLEN[3:0]),
        .M2S_HP0_AXI_ARSIZE(M2S_HP0_AXI_ARSIZE[1:0]),
        //
        .M2S_HP0_AXI_RVALID(M2S_HP0_AXI_RVALID),
        .M2S_HP0_AXI_RREADY(M2S_HP0_AXI_RREADY),
        .M2S_HP0_AXI_RLAST(M2S_HP0_AXI_RLAST),
        .M2S_HP0_AXI_RDATA(M2S_HP0_AXI_RDATA[63:0]),
        //
        .M2S_HP0_AXI_RRESP(M2S_HP0_AXI_RRESP[1:0]),
       
        // Write M2S_HP0_AXI_Transaction
        .M2S_HP0_AXI_AWVALID(M2S_HP0_AXI_AWVALID),
        .M2S_HP0_AXI_AWREADY(M2S_HP0_AXI_AWREADY),
        .M2S_HP0_AXI_AWADDR(M2S_HP0_AXI_AWADDR[31:0]),
        .M2S_HP0_AXI_AWBURST(M2S_HP0_AXI_AWBURST[1:0]),
        .M2S_HP0_AXI_AWLEN(M2S_HP0_AXI_AWLEN[3:0]),
        .M2S_HP0_AXI_AWSIZE(M2S_HP0_AXI_AWSIZE[1:0]),
        //
        .M2S_HP0_AXI_WVALID(M2S_HP0_AXI_WVALID),
        .M2S_HP0_AXI_WREADY(M2S_HP0_AXI_WREADY),
        .M2S_HP0_AXI_WLAST(M2S_HP0_AXI_WLAST),
        .M2S_HP0_AXI_WDATA(M2S_HP0_AXI_WDATA[63:0]),
        .M2S_HP0_AXI_WSTRB(M2S_HP0_AXI_WSTRB[7:0]),
        //
        .M2S_HP0_AXI_BVALID(M2S_HP0_AXI_BVALID),
        .M2S_HP0_AXI_BREADY(M2S_HP0_AXI_BREADY),
        .M2S_HP0_AXI_BRESP(M2S_HP0_AXI_BRESP[1:0]),

    /////////////////////////////////////
    // Master -> Slave interface HP1
    /////////////////////////////////////
        .M2S_HP1_AXI_ACLK(M2S_HP1_AXI_ACLK),
        
        //Read M2S_HP1_AXI_transation
        
        .M2S_HP1_AXI_ARVALID(M2S_HP1_AXI_ARVALID),
        .M2S_HP1_AXI_ARREADY(M2S_HP1_AXI_ARREADY),
        .M2S_HP1_AXI_ARADDR(M2S_HP1_AXI_ARADDR[31:0]),
        .M2S_HP1_AXI_ARBURST(M2S_HP1_AXI_ARBURST[1:0]),
        .M2S_HP1_AXI_ARLEN(M2S_HP1_AXI_ARLEN[3:0]),
        .M2S_HP1_AXI_ARSIZE(M2S_HP1_AXI_ARSIZE[1:0]),
        //
        .M2S_HP1_AXI_RVALID(M2S_HP1_AXI_RVALID),
        .M2S_HP1_AXI_RREADY(M2S_HP1_AXI_RREADY),
        .M2S_HP1_AXI_RLAST(M2S_HP1_AXI_RLAST),
        .M2S_HP1_AXI_RDATA(M2S_HP1_AXI_RDATA[63:0]),
        //
        .M2S_HP1_AXI_RRESP(M2S_HP1_AXI_RRESP[1:0]),
       
        // Write M2S_HP1_AXI_Transaction
        .M2S_HP1_AXI_AWVALID(M2S_HP1_AXI_AWVALID),
        .M2S_HP1_AXI_AWREADY(M2S_HP1_AXI_AWREADY),
        .M2S_HP1_AXI_AWADDR(M2S_HP1_AXI_AWADDR[31:0]),
        .M2S_HP1_AXI_AWBURST(M2S_HP1_AXI_AWBURST[1:0]),
        .M2S_HP1_AXI_AWLEN(M2S_HP1_AXI_AWLEN[3:0]),
        .M2S_HP1_AXI_AWSIZE(M2S_HP1_AXI_AWSIZE[1:0]),
        //
        .M2S_HP1_AXI_WVALID(M2S_HP1_AXI_WVALID),
        .M2S_HP1_AXI_WREADY(M2S_HP1_AXI_WREADY),
        .M2S_HP1_AXI_WLAST(M2S_HP1_AXI_WLAST),
        .M2S_HP1_AXI_WDATA(M2S_HP1_AXI_WDATA[63:0]),
        .M2S_HP1_AXI_WSTRB(M2S_HP1_AXI_WSTRB[7:0]),
        //
        .M2S_HP1_AXI_BVALID(M2S_HP1_AXI_BVALID),
        .M2S_HP1_AXI_BREADY(M2S_HP1_AXI_BREADY),
        .M2S_HP1_AXI_BRESP(M2S_HP1_AXI_BRESP[1:0]),

    /////////////////////////////////////
    // Master -> Slave interface HP2
    /////////////////////////////////////
        .M2S_HP2_AXI_ACLK(M2S_HP2_AXI_ACLK),
        
        //Read M2S_HP2_AXI_transation
        
        .M2S_HP2_AXI_ARVALID(M2S_HP2_AXI_ARVALID),
        .M2S_HP2_AXI_ARREADY(M2S_HP2_AXI_ARREADY),
        .M2S_HP2_AXI_ARADDR(M2S_HP2_AXI_ARADDR[31:0]),
        .M2S_HP2_AXI_ARBURST(M2S_HP2_AXI_ARBURST[1:0]),
        .M2S_HP2_AXI_ARLEN(M2S_HP2_AXI_ARLEN[3:0]),
        .M2S_HP2_AXI_ARSIZE(M2S_HP2_AXI_ARSIZE[1:0]),
        //
        .M2S_HP2_AXI_RVALID(M2S_HP2_AXI_RVALID),
        .M2S_HP2_AXI_RREADY(M2S_HP2_AXI_RREADY),
        .M2S_HP2_AXI_RLAST(M2S_HP2_AXI_RLAST),
        .M2S_HP2_AXI_RDATA(M2S_HP2_AXI_RDATA[63:0]),
        //
        .M2S_HP2_AXI_RRESP(M2S_HP2_AXI_RRESP[1:0]),
       
        // Write M2S_HP2_AXI_Transaction
        .M2S_HP2_AXI_AWVALID(M2S_HP2_AXI_AWVALID),
        .M2S_HP2_AXI_AWREADY(M2S_HP2_AXI_AWREADY),
        .M2S_HP2_AXI_AWADDR(M2S_HP2_AXI_AWADDR[31:0]),
        .M2S_HP2_AXI_AWBURST(M2S_HP2_AXI_AWBURST[1:0]),
        .M2S_HP2_AXI_AWLEN(M2S_HP2_AXI_AWLEN[3:0]),
        .M2S_HP2_AXI_AWSIZE(M2S_HP2_AXI_AWSIZE[1:0]),
        //
        .M2S_HP2_AXI_WVALID(M2S_HP2_AXI_WVALID),
        .M2S_HP2_AXI_WREADY(M2S_HP2_AXI_WREADY),
        .M2S_HP2_AXI_WLAST(M2S_HP2_AXI_WLAST),
        .M2S_HP2_AXI_WDATA(M2S_HP2_AXI_WDATA[63:0]),
        .M2S_HP2_AXI_WSTRB(M2S_HP2_AXI_WSTRB[7:0]),
        //
        .M2S_HP2_AXI_BVALID(M2S_HP2_AXI_BVALID),
        .M2S_HP2_AXI_BREADY(M2S_HP2_AXI_BREADY),
        .M2S_HP2_AXI_BRESP(M2S_HP2_AXI_BRESP[1:0]),

    /////////////////////////////////////
    // Master -> Slave interface HP3
    /////////////////////////////////////
        .M2S_HP3_AXI_ACLK(M2S_HP3_AXI_ACLK),
        
        //Read M2S_HP3_AXI_transation
        
        .M2S_HP3_AXI_ARVALID(M2S_HP3_AXI_ARVALID),
        .M2S_HP3_AXI_ARREADY(M2S_HP3_AXI_ARREADY),
        .M2S_HP3_AXI_ARADDR(M2S_HP3_AXI_ARADDR[31:0]),
        .M2S_HP3_AXI_ARBURST(M2S_HP3_AXI_ARBURST[1:0]),
        .M2S_HP3_AXI_ARLEN(M2S_HP3_AXI_ARLEN[3:0]),
        .M2S_HP3_AXI_ARSIZE(M2S_HP3_AXI_ARSIZE[1:0]),
        //
        .M2S_HP3_AXI_RVALID(M2S_HP3_AXI_RVALID),
        .M2S_HP3_AXI_RREADY(M2S_HP3_AXI_RREADY),
        .M2S_HP3_AXI_RLAST(M2S_HP3_AXI_RLAST),
        .M2S_HP3_AXI_RDATA(M2S_HP3_AXI_RDATA[63:0]),
        //
        .M2S_HP3_AXI_RRESP(M2S_HP3_AXI_RRESP[1:0]),
       
        // Write M2S_HP3_AXI_Transaction
        .M2S_HP3_AXI_AWVALID(M2S_HP3_AXI_AWVALID),
        .M2S_HP3_AXI_AWREADY(M2S_HP3_AXI_AWREADY),
        .M2S_HP3_AXI_AWADDR(M2S_HP3_AXI_AWADDR[31:0]),
        .M2S_HP3_AXI_AWBURST(M2S_HP3_AXI_AWBURST[1:0]),
        .M2S_HP3_AXI_AWLEN(M2S_HP3_AXI_AWLEN[3:0]),
        .M2S_HP3_AXI_AWSIZE(M2S_HP3_AXI_AWSIZE[1:0]),
        //
        .M2S_HP3_AXI_WVALID(M2S_HP3_AXI_WVALID),
        .M2S_HP3_AXI_WREADY(M2S_HP3_AXI_WREADY),
        .M2S_HP3_AXI_WLAST(M2S_HP3_AXI_WLAST),
        .M2S_HP3_AXI_WDATA(M2S_HP3_AXI_WDATA[63:0]),
        .M2S_HP3_AXI_WSTRB(M2S_HP3_AXI_WSTRB[7:0]),
        //
        .M2S_HP3_AXI_BVALID(M2S_HP3_AXI_BVALID),
        .M2S_HP3_AXI_BREADY(M2S_HP3_AXI_BREADY),
        .M2S_HP3_AXI_BRESP(M2S_HP3_AXI_BRESP[1:0]),

    /////////////////////////////////////
    // Master -> Slave interface ACP
    /////////////////////////////////////
        .M2S_ACP_AXI_ACLK(M2S_ACP_AXI_ACLK),
        
        //Read M2S_ACP_AXI_transation
        
        .M2S_ACP_AXI_ARVALID(M2S_ACP_AXI_ARVALID),
        .M2S_ACP_AXI_ARREADY(M2S_ACP_AXI_ARREADY),
        .M2S_ACP_AXI_ARADDR(M2S_ACP_AXI_ARADDR[31:0]),
        .M2S_ACP_AXI_ARBURST(M2S_ACP_AXI_ARBURST[1:0]),
        .M2S_ACP_AXI_ARLEN(M2S_ACP_AXI_ARLEN[3:0]),
        .M2S_ACP_AXI_ARSIZE(M2S_ACP_AXI_ARSIZE[1:0]),
        //
        .M2S_ACP_AXI_RVALID(M2S_ACP_AXI_RVALID),
        .M2S_ACP_AXI_RREADY(M2S_ACP_AXI_RREADY),
        .M2S_ACP_AXI_RLAST(M2S_ACP_AXI_RLAST),
        .M2S_ACP_AXI_RDATA(M2S_ACP_AXI_RDATA[63:0]),
        //
        .M2S_ACP_AXI_RRESP(M2S_ACP_AXI_RRESP[1:0]),
       
        // Write M2S_ACP_AXI_Transaction
        .M2S_ACP_AXI_AWVALID(M2S_ACP_AXI_AWVALID),
        .M2S_ACP_AXI_AWREADY(M2S_ACP_AXI_AWREADY),
        .M2S_ACP_AXI_AWADDR(M2S_ACP_AXI_AWADDR[31:0]),
        .M2S_ACP_AXI_AWBURST(M2S_ACP_AXI_AWBURST[1:0]),
        .M2S_ACP_AXI_AWLEN(M2S_ACP_AXI_AWLEN[3:0]),
        .M2S_ACP_AXI_AWSIZE(M2S_ACP_AXI_AWSIZE[1:0]),
        //
        .M2S_ACP_AXI_WVALID(M2S_ACP_AXI_WVALID),
        .M2S_ACP_AXI_WREADY(M2S_ACP_AXI_WREADY),
        .M2S_ACP_AXI_WLAST(M2S_ACP_AXI_WLAST),
        .M2S_ACP_AXI_WDATA(M2S_ACP_AXI_WDATA[63:0]),
        .M2S_ACP_AXI_WSTRB(M2S_ACP_AXI_WSTRB[7:0]),
        //
        .M2S_ACP_AXI_BVALID(M2S_ACP_AXI_BVALID),
        .M2S_ACP_AXI_BREADY(M2S_ACP_AXI_BREADY),
        .M2S_ACP_AXI_BRESP(M2S_ACP_AXI_BRESP[1:0])
    ); // ps7_inst

    /////////////////////////////////////////
// instantiate stubs
///////////////////////////////////////


    // Slave GP0
    // Being used by MMIO_slave
    axi_slave_stub axi_slave_GP0_stub(    
        .S2M_AXI_ACLK(S2M_GP0_AXI_ACLK),
        // Read interface
        .S2M_AXI_ARVALID(S2M_GP0_AXI_ARVALID),
        .S2M_AXI_ARREADY(S2M_GP0_AXI_ARREADY),
        .S2M_AXI_ARADDR(S2M_GP0_AXI_ARADDR[31:0]),
        .S2M_AXI_ARID(S2M_GP0_AXI_ARID[11:0]),

        .S2M_AXI_RVALID(S2M_GP0_AXI_RVALID),
        .S2M_AXI_RREADY(S2M_GP0_AXI_RREADY),
        .S2M_AXI_RLAST(S2M_GP0_AXI_RLAST),
        .S2M_AXI_RDATA(S2M_GP0_AXI_RDATA[31:0]),
        .S2M_AXI_RID(S2M_GP0_AXI_RID[11:0]),

        .S2M_AXI_RRESP(S2M_GP0_AXI_RRESP[1:0]),

        //write interface
        .S2M_AXI_AWVALID(S2M_GP0_AXI_AWVALID),
        .S2M_AXI_AWREADY(S2M_GP0_AXI_AWREADY),
        .S2M_AXI_AWADDR(S2M_GP0_AXI_AWADDR[31:0]),
        .S2M_AXI_AWID(S2M_GP0_AXI_AWID[11:0]),

        .S2M_AXI_WVALID(S2M_GP0_AXI_WVALID),
        .S2M_AXI_WREADY(S2M_GP0_AXI_WREADY),
        .S2M_AXI_WDATA(S2M_GP0_AXI_WDATA[31:0]),
        .S2M_AXI_WSTRB(S2M_GP0_AXI_WSTRB[3:0]),

        .S2M_AXI_BVALID(S2M_GP0_AXI_BVALID),
        .S2M_AXI_BREADY(S2M_GP0_AXI_BREADY),
        .S2M_AXI_BRESP(S2M_GP0_AXI_BRESP[1:0]),
        .S2M_AXI_BID(S2M_GP0_AXI_BID[11:0])
    );

    // Slave GP1
    axi_slave_stub axi_slave_GP1_stub(    
        .S2M_AXI_ACLK(S2M_GP1_AXI_ACLK),
        // Read interface
        .S2M_AXI_ARVALID(S2M_GP1_AXI_ARVALID),
        .S2M_AXI_ARREADY(S2M_GP1_AXI_ARREADY),
        .S2M_AXI_ARADDR(S2M_GP1_AXI_ARADDR[31:0]),
        .S2M_AXI_ARID(S2M_GP1_AXI_ARID[11:0]),

        .S2M_AXI_RVALID(S2M_GP1_AXI_RVALID),
        .S2M_AXI_RREADY(S2M_GP1_AXI_RREADY),
        .S2M_AXI_RLAST(S2M_GP1_AXI_RLAST),
        .S2M_AXI_RDATA(S2M_GP1_AXI_RDATA[31:0]),
        .S2M_AXI_RID(S2M_GP1_AXI_RID[11:0]),

        .S2M_AXI_RRESP(S2M_GP1_AXI_RRESP[1:0]),

        //write interface
        .S2M_AXI_AWVALID(S2M_GP1_AXI_AWVALID),
        .S2M_AXI_AWREADY(S2M_GP1_AXI_AWREADY),
        .S2M_AXI_AWADDR(S2M_GP1_AXI_AWADDR[31:0]),
        .S2M_AXI_AWID(S2M_GP1_AXI_AWID[11:0]),

        .S2M_AXI_WVALID(S2M_GP1_AXI_WVALID),
        .S2M_AXI_WREADY(S2M_GP1_AXI_WREADY),
        .S2M_AXI_WDATA(S2M_GP1_AXI_WDATA[31:0]),
        .S2M_AXI_WSTRB(S2M_GP1_AXI_WSTRB[3:0]),

        .S2M_AXI_BVALID(S2M_GP1_AXI_BVALID),
        .S2M_AXI_BREADY(S2M_GP1_AXI_BREADY),
        .S2M_AXI_BRESP(S2M_GP1_AXI_BRESP[1:0]),
        .S2M_AXI_BID(S2M_GP1_AXI_BID[11:0])
    );



    // Master GP0
    axi_master32_stub axi_master_GP0_stub (
        .M2S_AXI_ACLK(M2S_GP0_AXI_ACLK),

        //Read Transaction

        .M2S_AXI_ARVALID(M2S_GP0_AXI_ARVALID),
        .M2S_AXI_ARREADY(M2S_GP0_AXI_ARREADY),
        .M2S_AXI_ARADDR(M2S_GP0_AXI_ARADDR[31:0]),
        .M2S_AXI_ARBURST(M2S_GP0_AXI_ARBURST[1:0]),
        .M2S_AXI_ARLEN(M2S_GP0_AXI_ARLEN[3:0]),
        .M2S_AXI_ARSIZE(M2S_GP0_AXI_ARSIZE[1:0]),
        //
        .M2S_AXI_RVALID(M2S_GP0_AXI_RVALID),
        .M2S_AXI_RREADY(M2S_GP0_AXI_RREADY),
        .M2S_AXI_RLAST(M2S_GP0_AXI_RLAST),
        .M2S_AXI_RDATA(M2S_GP0_AXI_RDATA[31:0]),
        //
        .M2S_AXI_RRESP(M2S_GP0_AXI_RRESP[1:0]),

        // Write Transaction
        .M2S_AXI_AWVALID(M2S_GP0_AXI_AWVALID),
        .M2S_AXI_AWREADY(M2S_GP0_AXI_AWREADY),
        .M2S_AXI_AWADDR(M2S_GP0_AXI_AWADDR[31:0]),
        .M2S_AXI_AWBURST(M2S_GP0_AXI_AWBURST[1:0]),
        .M2S_AXI_AWLEN(M2S_GP0_AXI_AWLEN[3:0]),
        .M2S_AXI_AWSIZE(M2S_GP0_AXI_AWSIZE[1:0]),
        //
        .M2S_AXI_WVALID(M2S_GP0_AXI_WVALID),
        .M2S_AXI_WREADY(M2S_GP0_AXI_WREADY),
        .M2S_AXI_WLAST(M2S_GP0_AXI_WLAST),
        .M2S_AXI_WDATA(M2S_GP0_AXI_WDATA[31:0]),
        .M2S_AXI_WSTRB(M2S_GP0_AXI_WSTRB[3:0]),
        //
        .M2S_AXI_BVALID(M2S_GP0_AXI_BVALID),
        .M2S_AXI_BREADY(M2S_GP0_AXI_BREADY),
        .M2S_AXI_BRESP(M2S_GP0_AXI_BRESP[1:0])
    );

    // Master GP1
    axi_master32_stub axi_master_GP1_stub (
        .M2S_AXI_ACLK(M2S_GP1_AXI_ACLK),

        //Read Transaction

        .M2S_AXI_ARVALID(M2S_GP1_AXI_ARVALID),
        .M2S_AXI_ARREADY(M2S_GP1_AXI_ARREADY),
        .M2S_AXI_ARADDR(M2S_GP1_AXI_ARADDR[31:0]),
        .M2S_AXI_ARBURST(M2S_GP1_AXI_ARBURST[1:0]),
        .M2S_AXI_ARLEN(M2S_GP1_AXI_ARLEN[3:0]),
        .M2S_AXI_ARSIZE(M2S_GP1_AXI_ARSIZE[1:0]),
        //
        .M2S_AXI_RVALID(M2S_GP1_AXI_RVALID),
        .M2S_AXI_RREADY(M2S_GP1_AXI_RREADY),
        .M2S_AXI_RLAST(M2S_GP1_AXI_RLAST),
        .M2S_AXI_RDATA(M2S_GP1_AXI_RDATA[31:0]),
        //
        .M2S_AXI_RRESP(M2S_GP1_AXI_RRESP[1:0]),

        // Write Transaction
        .M2S_AXI_AWVALID(M2S_GP1_AXI_AWVALID),
        .M2S_AXI_AWREADY(M2S_GP1_AXI_AWREADY),
        .M2S_AXI_AWADDR(M2S_GP1_AXI_AWADDR[31:0]),
        .M2S_AXI_AWBURST(M2S_GP1_AXI_AWBURST[1:0]),
        .M2S_AXI_AWLEN(M2S_GP1_AXI_AWLEN[3:0]),
        .M2S_AXI_AWSIZE(M2S_GP1_AXI_AWSIZE[1:0]),
        //
        .M2S_AXI_WVALID(M2S_GP1_AXI_WVALID),
        .M2S_AXI_WREADY(M2S_GP1_AXI_WREADY),
        .M2S_AXI_WLAST(M2S_GP1_AXI_WLAST),
        .M2S_AXI_WDATA(M2S_GP1_AXI_WDATA[31:0]),
        .M2S_AXI_WSTRB(M2S_GP1_AXI_WSTRB[3:0]),
        //
        .M2S_AXI_BVALID(M2S_GP1_AXI_BVALID),
        .M2S_AXI_BREADY(M2S_GP1_AXI_BREADY),
        .M2S_AXI_BRESP(M2S_GP1_AXI_BRESP[1:0])
    );

    // Master HP0
    
    axi_master_stub axi_master_HP0_stub (
        .M2S_AXI_ACLK(M2S_HP0_AXI_ACLK),

        //Read Transaction

        .M2S_AXI_ARVALID(M2S_HP0_AXI_ARVALID),
        .M2S_AXI_ARREADY(M2S_HP0_AXI_ARREADY),
        .M2S_AXI_ARADDR(M2S_HP0_AXI_ARADDR[31:0]),
        .M2S_AXI_ARBURST(M2S_HP0_AXI_ARBURST[1:0]),
        .M2S_AXI_ARLEN(M2S_HP0_AXI_ARLEN[3:0]),
        .M2S_AXI_ARSIZE(M2S_HP0_AXI_ARSIZE[1:0]),
        //
        .M2S_AXI_RVALID(M2S_HP0_AXI_RVALID),
        .M2S_AXI_RREADY(M2S_HP0_AXI_RREADY),
        .M2S_AXI_RLAST(M2S_HP0_AXI_RLAST),
        .M2S_AXI_RDATA(M2S_HP0_AXI_RDATA[63:0]),
        //
        .M2S_AXI_RRESP(M2S_HP0_AXI_RRESP[1:0]),

        // Write Transaction
        .M2S_AXI_AWVALID(M2S_HP0_AXI_AWVALID),
        .M2S_AXI_AWREADY(M2S_HP0_AXI_AWREADY),
        .M2S_AXI_AWADDR(M2S_HP0_AXI_AWADDR[31:0]),
        .M2S_AXI_AWBURST(M2S_HP0_AXI_AWBURST[1:0]),
        .M2S_AXI_AWLEN(M2S_HP0_AXI_AWLEN[3:0]),
        .M2S_AXI_AWSIZE(M2S_HP0_AXI_AWSIZE[1:0]),
        //
        .M2S_AXI_WVALID(M2S_HP0_AXI_WVALID),
        .M2S_AXI_WREADY(M2S_HP0_AXI_WREADY),
        .M2S_AXI_WLAST(M2S_HP0_AXI_WLAST),
        .M2S_AXI_WDATA(M2S_HP0_AXI_WDATA[63:0]),
        .M2S_AXI_WSTRB(M2S_HP0_AXI_WSTRB[7:0]),
        //
        .M2S_AXI_BVALID(M2S_HP0_AXI_BVALID),
        .M2S_AXI_BREADY(M2S_HP0_AXI_BREADY),
        .M2S_AXI_BRESP(M2S_HP0_AXI_BRESP[1:0])
    );

    // Master HP1
    axi_master_stub axi_master_HP1_stub (
        .M2S_AXI_ACLK(M2S_HP1_AXI_ACLK),

        //Read Transaction

        .M2S_AXI_ARVALID(M2S_HP1_AXI_ARVALID),
        .M2S_AXI_ARREADY(M2S_HP1_AXI_ARREADY),
        .M2S_AXI_ARADDR(M2S_HP1_AXI_ARADDR[31:0]),
        .M2S_AXI_ARBURST(M2S_HP1_AXI_ARBURST[1:0]),
        .M2S_AXI_ARLEN(M2S_HP1_AXI_ARLEN[3:0]),
        .M2S_AXI_ARSIZE(M2S_HP1_AXI_ARSIZE[1:0]),
        //
        .M2S_AXI_RVALID(M2S_HP1_AXI_RVALID),
        .M2S_AXI_RREADY(M2S_HP1_AXI_RREADY),
        .M2S_AXI_RLAST(M2S_HP1_AXI_RLAST),
        .M2S_AXI_RDATA(M2S_HP1_AXI_RDATA[63:0]),
        //
        .M2S_AXI_RRESP(M2S_HP1_AXI_RRESP[1:0]),

        // Write Transaction
        .M2S_AXI_AWVALID(M2S_HP1_AXI_AWVALID),
        .M2S_AXI_AWREADY(M2S_HP1_AXI_AWREADY),
        .M2S_AXI_AWADDR(M2S_HP1_AXI_AWADDR[31:0]),
        .M2S_AXI_AWBURST(M2S_HP1_AXI_AWBURST[1:0]),
        .M2S_AXI_AWLEN(M2S_HP1_AXI_AWLEN[3:0]),
        .M2S_AXI_AWSIZE(M2S_HP1_AXI_AWSIZE[1:0]),
        //
        .M2S_AXI_WVALID(M2S_HP1_AXI_WVALID),
        .M2S_AXI_WREADY(M2S_HP1_AXI_WREADY),
        .M2S_AXI_WLAST(M2S_HP1_AXI_WLAST),
        .M2S_AXI_WDATA(M2S_HP1_AXI_WDATA[63:0]),
        .M2S_AXI_WSTRB(M2S_HP1_AXI_WSTRB[7:0]),
        //
        .M2S_AXI_BVALID(M2S_HP1_AXI_BVALID),
        .M2S_AXI_BREADY(M2S_HP1_AXI_BREADY),
        .M2S_AXI_BRESP(M2S_HP1_AXI_BRESP[1:0])
    );

    // Master HP2
    axi_master_stub axi_master_HP2_stub (
        .M2S_AXI_ACLK(M2S_HP2_AXI_ACLK),

        //Read Transaction

        .M2S_AXI_ARVALID(M2S_HP2_AXI_ARVALID),
        .M2S_AXI_ARREADY(M2S_HP2_AXI_ARREADY),
        .M2S_AXI_ARADDR(M2S_HP2_AXI_ARADDR[31:0]),
        .M2S_AXI_ARBURST(M2S_HP2_AXI_ARBURST[1:0]),
        .M2S_AXI_ARLEN(M2S_HP2_AXI_ARLEN[3:0]),
        .M2S_AXI_ARSIZE(M2S_HP2_AXI_ARSIZE[1:0]),
        //
        .M2S_AXI_RVALID(M2S_HP2_AXI_RVALID),
        .M2S_AXI_RREADY(M2S_HP2_AXI_RREADY),
        .M2S_AXI_RLAST(M2S_HP2_AXI_RLAST),
        .M2S_AXI_RDATA(M2S_HP2_AXI_RDATA[63:0]),
        //
        .M2S_AXI_RRESP(M2S_HP2_AXI_RRESP[1:0]),

        // Write Transaction
        .M2S_AXI_AWVALID(M2S_HP2_AXI_AWVALID),
        .M2S_AXI_AWREADY(M2S_HP2_AXI_AWREADY),
        .M2S_AXI_AWADDR(M2S_HP2_AXI_AWADDR[31:0]),
        .M2S_AXI_AWBURST(M2S_HP2_AXI_AWBURST[1:0]),
        .M2S_AXI_AWLEN(M2S_HP2_AXI_AWLEN[3:0]),
        .M2S_AXI_AWSIZE(M2S_HP2_AXI_AWSIZE[1:0]),
        //
        .M2S_AXI_WVALID(M2S_HP2_AXI_WVALID),
        .M2S_AXI_WREADY(M2S_HP2_AXI_WREADY),
        .M2S_AXI_WLAST(M2S_HP2_AXI_WLAST),
        .M2S_AXI_WDATA(M2S_HP2_AXI_WDATA[63:0]),
        .M2S_AXI_WSTRB(M2S_HP2_AXI_WSTRB[7:0]),
        //
        .M2S_AXI_BVALID(M2S_HP2_AXI_BVALID),
        .M2S_AXI_BREADY(M2S_HP2_AXI_BREADY),
        .M2S_AXI_BRESP(M2S_HP2_AXI_BRESP[1:0])
    );

    // Master HP3
     axi_master_stub axi_master_HP3_stub (
        .M2S_AXI_ACLK(M2S_HP3_AXI_ACLK),

        //Read Transaction

        .M2S_AXI_ARVALID(M2S_HP3_AXI_ARVALID),
        .M2S_AXI_ARREADY(M2S_HP3_AXI_ARREADY),
        .M2S_AXI_ARADDR(M2S_HP3_AXI_ARADDR[31:0]),
        .M2S_AXI_ARBURST(M2S_HP3_AXI_ARBURST[1:0]),
        .M2S_AXI_ARLEN(M2S_HP3_AXI_ARLEN[3:0]),
        .M2S_AXI_ARSIZE(M2S_HP3_AXI_ARSIZE[1:0]),
        //
        .M2S_AXI_RVALID(M2S_HP3_AXI_RVALID),
        .M2S_AXI_RREADY(M2S_HP3_AXI_RREADY),
        .M2S_AXI_RLAST(M2S_HP3_AXI_RLAST),
        .M2S_AXI_RDATA(M2S_HP3_AXI_RDATA[63:0]),
        //
        .M2S_AXI_RRESP(M2S_HP3_AXI_RRESP[1:0]),

        // Write Transaction
        .M2S_AXI_AWVALID(M2S_HP3_AXI_AWVALID),
        .M2S_AXI_AWREADY(M2S_HP3_AXI_AWREADY),
        .M2S_AXI_AWADDR(M2S_HP3_AXI_AWADDR[31:0]),
        .M2S_AXI_AWBURST(M2S_HP3_AXI_AWBURST[1:0]),
        .M2S_AXI_AWLEN(M2S_HP3_AXI_AWLEN[3:0]),
        .M2S_AXI_AWSIZE(M2S_HP3_AXI_AWSIZE[1:0]),
        //
        .M2S_AXI_WVALID(M2S_HP3_AXI_WVALID),
        .M2S_AXI_WREADY(M2S_HP3_AXI_WREADY),
        .M2S_AXI_WLAST(M2S_HP3_AXI_WLAST),
        .M2S_AXI_WDATA(M2S_HP3_AXI_WDATA[63:0]),
        .M2S_AXI_WSTRB(M2S_HP3_AXI_WSTRB[7:0]),
        //
        .M2S_AXI_BVALID(M2S_HP3_AXI_BVALID),
        .M2S_AXI_BREADY(M2S_HP3_AXI_BREADY),
        .M2S_AXI_BRESP(M2S_HP3_AXI_BRESP[1:0])
    );


    // Master ACP
    // Being used by camera (write) and vga (read)
    axi_master_stub axi_master_ACP_stub (
        .M2S_AXI_ACLK(M2S_ACP_AXI_ACLK),

        //Read Transaction

        .M2S_AXI_ARVALID(M2S_ACP_AXI_ARVALID),
        .M2S_AXI_ARREADY(M2S_ACP_AXI_ARREADY),
        .M2S_AXI_ARADDR(M2S_ACP_AXI_ARADDR[31:0]),
        .M2S_AXI_ARBURST(M2S_ACP_AXI_ARBURST[1:0]),
        .M2S_AXI_ARLEN(M2S_ACP_AXI_ARLEN[3:0]),
        .M2S_AXI_ARSIZE(M2S_ACP_AXI_ARSIZE[1:0]),
        //
        .M2S_AXI_RVALID(M2S_ACP_AXI_RVALID),
        .M2S_AXI_RREADY(M2S_ACP_AXI_RREADY),
        .M2S_AXI_RLAST(M2S_ACP_AXI_RLAST),
        .M2S_AXI_RDATA(M2S_ACP_AXI_RDATA[63:0]),
        //
        .M2S_AXI_RRESP(M2S_ACP_AXI_RRESP[1:0]),

        // Write Transaction
        .M2S_AXI_AWVALID(M2S_ACP_AXI_AWVALID),
        .M2S_AXI_AWREADY(M2S_ACP_AXI_AWREADY),
        .M2S_AXI_AWADDR(M2S_ACP_AXI_AWADDR[31:0]),
        .M2S_AXI_AWBURST(M2S_ACP_AXI_AWBURST[1:0]),
        .M2S_AXI_AWLEN(M2S_ACP_AXI_AWLEN[3:0]),
        .M2S_AXI_AWSIZE(M2S_ACP_AXI_AWSIZE[1:0]),
        //
        .M2S_AXI_WVALID(M2S_ACP_AXI_WVALID),
        .M2S_AXI_WREADY(M2S_ACP_AXI_WREADY),
        .M2S_AXI_WLAST(M2S_ACP_AXI_WLAST),
        .M2S_AXI_WDATA(M2S_ACP_AXI_WDATA[63:0]),
        .M2S_AXI_WSTRB(M2S_ACP_AXI_WSTRB[7:0]),
        //
        .M2S_AXI_BVALID(M2S_ACP_AXI_BVALID),
        .M2S_AXI_BREADY(M2S_ACP_AXI_BREADY),
        .M2S_AXI_BRESP(M2S_ACP_AXI_BRESP[1:0])
    );


//endmodule

endmodule

module Adders32x1_2_2_cinNone_cout1 (input [31:0] I0, output [31:0] O, input  CIN, output  COUT);
wire  inst0_O5;
wire  inst0_O6;
wire  inst1_O;
wire  inst2_O;
wire  inst3_O5;
wire  inst3_O6;
wire  inst4_O;
wire  inst5_O;
wire  inst6_O5;
wire  inst6_O6;
wire  inst7_O;
wire  inst8_O;
wire  inst9_O5;
wire  inst9_O6;
wire  inst10_O;
wire  inst11_O;
wire  inst12_O5;
wire  inst12_O6;
wire  inst13_O;
wire  inst14_O;
wire  inst15_O5;
wire  inst15_O6;
wire  inst16_O;
wire  inst17_O;
wire  inst18_O5;
wire  inst18_O6;
wire  inst19_O;
wire  inst20_O;
wire  inst21_O5;
wire  inst21_O6;
wire  inst22_O;
wire  inst23_O;
wire  inst24_O5;
wire  inst24_O6;
wire  inst25_O;
wire  inst26_O;
wire  inst27_O5;
wire  inst27_O6;
wire  inst28_O;
wire  inst29_O;
wire  inst30_O5;
wire  inst30_O6;
wire  inst31_O;
wire  inst32_O;
wire  inst33_O5;
wire  inst33_O6;
wire  inst34_O;
wire  inst35_O;
wire  inst36_O5;
wire  inst36_O6;
wire  inst37_O;
wire  inst38_O;
wire  inst39_O5;
wire  inst39_O6;
wire  inst40_O;
wire  inst41_O;
wire  inst42_O5;
wire  inst42_O6;
wire  inst43_O;
wire  inst44_O;
wire  inst45_O5;
wire  inst45_O6;
wire  inst46_O;
wire  inst47_O;
wire  inst48_O5;
wire  inst48_O6;
wire  inst49_O;
wire  inst50_O;
wire  inst51_O5;
wire  inst51_O6;
wire  inst52_O;
wire  inst53_O;
wire  inst54_O5;
wire  inst54_O6;
wire  inst55_O;
wire  inst56_O;
wire  inst57_O5;
wire  inst57_O6;
wire  inst58_O;
wire  inst59_O;
wire  inst60_O5;
wire  inst60_O6;
wire  inst61_O;
wire  inst62_O;
wire  inst63_O5;
wire  inst63_O6;
wire  inst64_O;
wire  inst65_O;
wire  inst66_O5;
wire  inst66_O6;
wire  inst67_O;
wire  inst68_O;
wire  inst69_O5;
wire  inst69_O6;
wire  inst70_O;
wire  inst71_O;
wire  inst72_O5;
wire  inst72_O6;
wire  inst73_O;
wire  inst74_O;
wire  inst75_O5;
wire  inst75_O6;
wire  inst76_O;
wire  inst77_O;
wire  inst78_O5;
wire  inst78_O6;
wire  inst79_O;
wire  inst80_O;
wire  inst81_O5;
wire  inst81_O6;
wire  inst82_O;
wire  inst83_O;
wire  inst84_O5;
wire  inst84_O6;
wire  inst85_O;
wire  inst86_O;
wire  inst87_O5;
wire  inst87_O6;
wire  inst88_O;
wire  inst89_O;
wire  inst90_O5;
wire  inst90_O6;
wire  inst91_O;
wire  inst92_O;
wire  inst93_O5;
wire  inst93_O6;
wire  inst94_O;
wire  inst95_O;
LUT6_2 #(.INIT(64'hAAAAAAAAAAAAAAAA)) inst0 (.I0(I0[0]), .I1(1'b1), .I2(1'b1), .I3(1'b1), .I4(1'b1), .I5(1'b1), .O5(inst0_O5), .O6(inst0_O6));
MUXCY inst1 (.DI(inst0_O5), .CI(CIN), .S(inst0_O6), .O(inst1_O));
XORCY inst2 (.LI(inst0_O6), .CI(CIN), .O(inst2_O));
LUT6_2 #(.INIT(64'hAAAAAAAAAAAAAAAA)) inst3 (.I0(I0[1]), .I1(1'b1), .I2(1'b1), .I3(1'b1), .I4(1'b1), .I5(1'b1), .O5(inst3_O5), .O6(inst3_O6));
MUXCY inst4 (.DI(inst3_O5), .CI(inst1_O), .S(inst3_O6), .O(inst4_O));
XORCY inst5 (.LI(inst3_O6), .CI(inst1_O), .O(inst5_O));
LUT6_2 #(.INIT(64'hAAAAAAAAAAAAAAAA)) inst6 (.I0(I0[2]), .I1(1'b1), .I2(1'b1), .I3(1'b1), .I4(1'b1), .I5(1'b1), .O5(inst6_O5), .O6(inst6_O6));
MUXCY inst7 (.DI(inst6_O5), .CI(inst4_O), .S(inst6_O6), .O(inst7_O));
XORCY inst8 (.LI(inst6_O6), .CI(inst4_O), .O(inst8_O));
LUT6_2 #(.INIT(64'hAAAAAAAAAAAAAAAA)) inst9 (.I0(I0[3]), .I1(1'b1), .I2(1'b1), .I3(1'b1), .I4(1'b1), .I5(1'b1), .O5(inst9_O5), .O6(inst9_O6));
MUXCY inst10 (.DI(inst9_O5), .CI(inst7_O), .S(inst9_O6), .O(inst10_O));
XORCY inst11 (.LI(inst9_O6), .CI(inst7_O), .O(inst11_O));
LUT6_2 #(.INIT(64'hAAAAAAAAAAAAAAAA)) inst12 (.I0(I0[4]), .I1(1'b1), .I2(1'b1), .I3(1'b1), .I4(1'b1), .I5(1'b1), .O5(inst12_O5), .O6(inst12_O6));
MUXCY inst13 (.DI(inst12_O5), .CI(inst10_O), .S(inst12_O6), .O(inst13_O));
XORCY inst14 (.LI(inst12_O6), .CI(inst10_O), .O(inst14_O));
LUT6_2 #(.INIT(64'hAAAAAAAAAAAAAAAA)) inst15 (.I0(I0[5]), .I1(1'b1), .I2(1'b1), .I3(1'b1), .I4(1'b1), .I5(1'b1), .O5(inst15_O5), .O6(inst15_O6));
MUXCY inst16 (.DI(inst15_O5), .CI(inst13_O), .S(inst15_O6), .O(inst16_O));
XORCY inst17 (.LI(inst15_O6), .CI(inst13_O), .O(inst17_O));
LUT6_2 #(.INIT(64'hAAAAAAAAAAAAAAAA)) inst18 (.I0(I0[6]), .I1(1'b1), .I2(1'b1), .I3(1'b1), .I4(1'b1), .I5(1'b1), .O5(inst18_O5), .O6(inst18_O6));
MUXCY inst19 (.DI(inst18_O5), .CI(inst16_O), .S(inst18_O6), .O(inst19_O));
XORCY inst20 (.LI(inst18_O6), .CI(inst16_O), .O(inst20_O));
LUT6_2 #(.INIT(64'hAAAAAAAAAAAAAAAA)) inst21 (.I0(I0[7]), .I1(1'b1), .I2(1'b1), .I3(1'b1), .I4(1'b1), .I5(1'b1), .O5(inst21_O5), .O6(inst21_O6));
MUXCY inst22 (.DI(inst21_O5), .CI(inst19_O), .S(inst21_O6), .O(inst22_O));
XORCY inst23 (.LI(inst21_O6), .CI(inst19_O), .O(inst23_O));
LUT6_2 #(.INIT(64'hAAAAAAAAAAAAAAAA)) inst24 (.I0(I0[8]), .I1(1'b1), .I2(1'b1), .I3(1'b1), .I4(1'b1), .I5(1'b1), .O5(inst24_O5), .O6(inst24_O6));
MUXCY inst25 (.DI(inst24_O5), .CI(inst22_O), .S(inst24_O6), .O(inst25_O));
XORCY inst26 (.LI(inst24_O6), .CI(inst22_O), .O(inst26_O));
LUT6_2 #(.INIT(64'hAAAAAAAAAAAAAAAA)) inst27 (.I0(I0[9]), .I1(1'b1), .I2(1'b1), .I3(1'b1), .I4(1'b1), .I5(1'b1), .O5(inst27_O5), .O6(inst27_O6));
MUXCY inst28 (.DI(inst27_O5), .CI(inst25_O), .S(inst27_O6), .O(inst28_O));
XORCY inst29 (.LI(inst27_O6), .CI(inst25_O), .O(inst29_O));
LUT6_2 #(.INIT(64'hAAAAAAAAAAAAAAAA)) inst30 (.I0(I0[10]), .I1(1'b1), .I2(1'b1), .I3(1'b1), .I4(1'b1), .I5(1'b1), .O5(inst30_O5), .O6(inst30_O6));
MUXCY inst31 (.DI(inst30_O5), .CI(inst28_O), .S(inst30_O6), .O(inst31_O));
XORCY inst32 (.LI(inst30_O6), .CI(inst28_O), .O(inst32_O));
LUT6_2 #(.INIT(64'hAAAAAAAAAAAAAAAA)) inst33 (.I0(I0[11]), .I1(1'b1), .I2(1'b1), .I3(1'b1), .I4(1'b1), .I5(1'b1), .O5(inst33_O5), .O6(inst33_O6));
MUXCY inst34 (.DI(inst33_O5), .CI(inst31_O), .S(inst33_O6), .O(inst34_O));
XORCY inst35 (.LI(inst33_O6), .CI(inst31_O), .O(inst35_O));
LUT6_2 #(.INIT(64'hAAAAAAAAAAAAAAAA)) inst36 (.I0(I0[12]), .I1(1'b1), .I2(1'b1), .I3(1'b1), .I4(1'b1), .I5(1'b1), .O5(inst36_O5), .O6(inst36_O6));
MUXCY inst37 (.DI(inst36_O5), .CI(inst34_O), .S(inst36_O6), .O(inst37_O));
XORCY inst38 (.LI(inst36_O6), .CI(inst34_O), .O(inst38_O));
LUT6_2 #(.INIT(64'hAAAAAAAAAAAAAAAA)) inst39 (.I0(I0[13]), .I1(1'b1), .I2(1'b1), .I3(1'b1), .I4(1'b1), .I5(1'b1), .O5(inst39_O5), .O6(inst39_O6));
MUXCY inst40 (.DI(inst39_O5), .CI(inst37_O), .S(inst39_O6), .O(inst40_O));
XORCY inst41 (.LI(inst39_O6), .CI(inst37_O), .O(inst41_O));
LUT6_2 #(.INIT(64'hAAAAAAAAAAAAAAAA)) inst42 (.I0(I0[14]), .I1(1'b1), .I2(1'b1), .I3(1'b1), .I4(1'b1), .I5(1'b1), .O5(inst42_O5), .O6(inst42_O6));
MUXCY inst43 (.DI(inst42_O5), .CI(inst40_O), .S(inst42_O6), .O(inst43_O));
XORCY inst44 (.LI(inst42_O6), .CI(inst40_O), .O(inst44_O));
LUT6_2 #(.INIT(64'hAAAAAAAAAAAAAAAA)) inst45 (.I0(I0[15]), .I1(1'b1), .I2(1'b1), .I3(1'b1), .I4(1'b1), .I5(1'b1), .O5(inst45_O5), .O6(inst45_O6));
MUXCY inst46 (.DI(inst45_O5), .CI(inst43_O), .S(inst45_O6), .O(inst46_O));
XORCY inst47 (.LI(inst45_O6), .CI(inst43_O), .O(inst47_O));
LUT6_2 #(.INIT(64'hAAAAAAAAAAAAAAAA)) inst48 (.I0(I0[16]), .I1(1'b1), .I2(1'b1), .I3(1'b1), .I4(1'b1), .I5(1'b1), .O5(inst48_O5), .O6(inst48_O6));
MUXCY inst49 (.DI(inst48_O5), .CI(inst46_O), .S(inst48_O6), .O(inst49_O));
XORCY inst50 (.LI(inst48_O6), .CI(inst46_O), .O(inst50_O));
LUT6_2 #(.INIT(64'hAAAAAAAAAAAAAAAA)) inst51 (.I0(I0[17]), .I1(1'b1), .I2(1'b1), .I3(1'b1), .I4(1'b1), .I5(1'b1), .O5(inst51_O5), .O6(inst51_O6));
MUXCY inst52 (.DI(inst51_O5), .CI(inst49_O), .S(inst51_O6), .O(inst52_O));
XORCY inst53 (.LI(inst51_O6), .CI(inst49_O), .O(inst53_O));
LUT6_2 #(.INIT(64'hAAAAAAAAAAAAAAAA)) inst54 (.I0(I0[18]), .I1(1'b1), .I2(1'b1), .I3(1'b1), .I4(1'b1), .I5(1'b1), .O5(inst54_O5), .O6(inst54_O6));
MUXCY inst55 (.DI(inst54_O5), .CI(inst52_O), .S(inst54_O6), .O(inst55_O));
XORCY inst56 (.LI(inst54_O6), .CI(inst52_O), .O(inst56_O));
LUT6_2 #(.INIT(64'hAAAAAAAAAAAAAAAA)) inst57 (.I0(I0[19]), .I1(1'b1), .I2(1'b1), .I3(1'b1), .I4(1'b1), .I5(1'b1), .O5(inst57_O5), .O6(inst57_O6));
MUXCY inst58 (.DI(inst57_O5), .CI(inst55_O), .S(inst57_O6), .O(inst58_O));
XORCY inst59 (.LI(inst57_O6), .CI(inst55_O), .O(inst59_O));
LUT6_2 #(.INIT(64'hAAAAAAAAAAAAAAAA)) inst60 (.I0(I0[20]), .I1(1'b1), .I2(1'b1), .I3(1'b1), .I4(1'b1), .I5(1'b1), .O5(inst60_O5), .O6(inst60_O6));
MUXCY inst61 (.DI(inst60_O5), .CI(inst58_O), .S(inst60_O6), .O(inst61_O));
XORCY inst62 (.LI(inst60_O6), .CI(inst58_O), .O(inst62_O));
LUT6_2 #(.INIT(64'hAAAAAAAAAAAAAAAA)) inst63 (.I0(I0[21]), .I1(1'b1), .I2(1'b1), .I3(1'b1), .I4(1'b1), .I5(1'b1), .O5(inst63_O5), .O6(inst63_O6));
MUXCY inst64 (.DI(inst63_O5), .CI(inst61_O), .S(inst63_O6), .O(inst64_O));
XORCY inst65 (.LI(inst63_O6), .CI(inst61_O), .O(inst65_O));
LUT6_2 #(.INIT(64'hAAAAAAAAAAAAAAAA)) inst66 (.I0(I0[22]), .I1(1'b1), .I2(1'b1), .I3(1'b1), .I4(1'b1), .I5(1'b1), .O5(inst66_O5), .O6(inst66_O6));
MUXCY inst67 (.DI(inst66_O5), .CI(inst64_O), .S(inst66_O6), .O(inst67_O));
XORCY inst68 (.LI(inst66_O6), .CI(inst64_O), .O(inst68_O));
LUT6_2 #(.INIT(64'hAAAAAAAAAAAAAAAA)) inst69 (.I0(I0[23]), .I1(1'b1), .I2(1'b1), .I3(1'b1), .I4(1'b1), .I5(1'b1), .O5(inst69_O5), .O6(inst69_O6));
MUXCY inst70 (.DI(inst69_O5), .CI(inst67_O), .S(inst69_O6), .O(inst70_O));
XORCY inst71 (.LI(inst69_O6), .CI(inst67_O), .O(inst71_O));
LUT6_2 #(.INIT(64'hAAAAAAAAAAAAAAAA)) inst72 (.I0(I0[24]), .I1(1'b1), .I2(1'b1), .I3(1'b1), .I4(1'b1), .I5(1'b1), .O5(inst72_O5), .O6(inst72_O6));
MUXCY inst73 (.DI(inst72_O5), .CI(inst70_O), .S(inst72_O6), .O(inst73_O));
XORCY inst74 (.LI(inst72_O6), .CI(inst70_O), .O(inst74_O));
LUT6_2 #(.INIT(64'hAAAAAAAAAAAAAAAA)) inst75 (.I0(I0[25]), .I1(1'b1), .I2(1'b1), .I3(1'b1), .I4(1'b1), .I5(1'b1), .O5(inst75_O5), .O6(inst75_O6));
MUXCY inst76 (.DI(inst75_O5), .CI(inst73_O), .S(inst75_O6), .O(inst76_O));
XORCY inst77 (.LI(inst75_O6), .CI(inst73_O), .O(inst77_O));
LUT6_2 #(.INIT(64'hAAAAAAAAAAAAAAAA)) inst78 (.I0(I0[26]), .I1(1'b1), .I2(1'b1), .I3(1'b1), .I4(1'b1), .I5(1'b1), .O5(inst78_O5), .O6(inst78_O6));
MUXCY inst79 (.DI(inst78_O5), .CI(inst76_O), .S(inst78_O6), .O(inst79_O));
XORCY inst80 (.LI(inst78_O6), .CI(inst76_O), .O(inst80_O));
LUT6_2 #(.INIT(64'hAAAAAAAAAAAAAAAA)) inst81 (.I0(I0[27]), .I1(1'b1), .I2(1'b1), .I3(1'b1), .I4(1'b1), .I5(1'b1), .O5(inst81_O5), .O6(inst81_O6));
MUXCY inst82 (.DI(inst81_O5), .CI(inst79_O), .S(inst81_O6), .O(inst82_O));
XORCY inst83 (.LI(inst81_O6), .CI(inst79_O), .O(inst83_O));
LUT6_2 #(.INIT(64'hAAAAAAAAAAAAAAAA)) inst84 (.I0(I0[28]), .I1(1'b1), .I2(1'b1), .I3(1'b1), .I4(1'b1), .I5(1'b1), .O5(inst84_O5), .O6(inst84_O6));
MUXCY inst85 (.DI(inst84_O5), .CI(inst82_O), .S(inst84_O6), .O(inst85_O));
XORCY inst86 (.LI(inst84_O6), .CI(inst82_O), .O(inst86_O));
LUT6_2 #(.INIT(64'hAAAAAAAAAAAAAAAA)) inst87 (.I0(I0[29]), .I1(1'b1), .I2(1'b1), .I3(1'b1), .I4(1'b1), .I5(1'b1), .O5(inst87_O5), .O6(inst87_O6));
MUXCY inst88 (.DI(inst87_O5), .CI(inst85_O), .S(inst87_O6), .O(inst88_O));
XORCY inst89 (.LI(inst87_O6), .CI(inst85_O), .O(inst89_O));
LUT6_2 #(.INIT(64'hAAAAAAAAAAAAAAAA)) inst90 (.I0(I0[30]), .I1(1'b1), .I2(1'b1), .I3(1'b1), .I4(1'b1), .I5(1'b1), .O5(inst90_O5), .O6(inst90_O6));
MUXCY inst91 (.DI(inst90_O5), .CI(inst88_O), .S(inst90_O6), .O(inst91_O));
XORCY inst92 (.LI(inst90_O6), .CI(inst88_O), .O(inst92_O));
LUT6_2 #(.INIT(64'hAAAAAAAAAAAAAAAA)) inst93 (.I0(I0[31]), .I1(1'b1), .I2(1'b1), .I3(1'b1), .I4(1'b1), .I5(1'b1), .O5(inst93_O5), .O6(inst93_O6));
MUXCY inst94 (.DI(inst93_O5), .CI(inst91_O), .S(inst93_O6), .O(inst94_O));
XORCY inst95 (.LI(inst93_O6), .CI(inst91_O), .O(inst95_O));
assign O = {inst95_O,inst92_O,inst89_O,inst86_O,inst83_O,inst80_O,inst77_O,inst74_O,inst71_O,inst68_O,inst65_O,inst62_O,inst59_O,inst56_O,inst53_O,inst50_O,inst47_O,inst44_O,inst41_O,inst38_O,inst35_O,inst32_O,inst29_O,inst26_O,inst23_O,inst20_O,inst17_O,inst14_O,inst11_O,inst8_O,inst5_O,inst2_O};
assign COUT = inst94_O;
endmodule

module Register32 (input [31:0] I, output [31:0] O, input  CLK);
wire  inst0_Q;
wire  inst1_Q;
wire  inst2_Q;
wire  inst3_Q;
wire  inst4_Q;
wire  inst5_Q;
wire  inst6_Q;
wire  inst7_Q;
wire  inst8_Q;
wire  inst9_Q;
wire  inst10_Q;
wire  inst11_Q;
wire  inst12_Q;
wire  inst13_Q;
wire  inst14_Q;
wire  inst15_Q;
wire  inst16_Q;
wire  inst17_Q;
wire  inst18_Q;
wire  inst19_Q;
wire  inst20_Q;
wire  inst21_Q;
wire  inst22_Q;
wire  inst23_Q;
wire  inst24_Q;
wire  inst25_Q;
wire  inst26_Q;
wire  inst27_Q;
wire  inst28_Q;
wire  inst29_Q;
wire  inst30_Q;
wire  inst31_Q;
FDRSE #(.INIT(1'h0)) inst0 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[0]), .Q(inst0_Q));
FDRSE #(.INIT(1'h0)) inst1 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[1]), .Q(inst1_Q));
FDRSE #(.INIT(1'h0)) inst2 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[2]), .Q(inst2_Q));
FDRSE #(.INIT(1'h0)) inst3 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[3]), .Q(inst3_Q));
FDRSE #(.INIT(1'h0)) inst4 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[4]), .Q(inst4_Q));
FDRSE #(.INIT(1'h0)) inst5 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[5]), .Q(inst5_Q));
FDRSE #(.INIT(1'h0)) inst6 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[6]), .Q(inst6_Q));
FDRSE #(.INIT(1'h0)) inst7 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[7]), .Q(inst7_Q));
FDRSE #(.INIT(1'h0)) inst8 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[8]), .Q(inst8_Q));
FDRSE #(.INIT(1'h0)) inst9 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[9]), .Q(inst9_Q));
FDRSE #(.INIT(1'h0)) inst10 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[10]), .Q(inst10_Q));
FDRSE #(.INIT(1'h0)) inst11 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[11]), .Q(inst11_Q));
FDRSE #(.INIT(1'h0)) inst12 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[12]), .Q(inst12_Q));
FDRSE #(.INIT(1'h0)) inst13 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[13]), .Q(inst13_Q));
FDRSE #(.INIT(1'h0)) inst14 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[14]), .Q(inst14_Q));
FDRSE #(.INIT(1'h0)) inst15 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[15]), .Q(inst15_Q));
FDRSE #(.INIT(1'h0)) inst16 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[16]), .Q(inst16_Q));
FDRSE #(.INIT(1'h0)) inst17 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[17]), .Q(inst17_Q));
FDRSE #(.INIT(1'h0)) inst18 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[18]), .Q(inst18_Q));
FDRSE #(.INIT(1'h0)) inst19 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[19]), .Q(inst19_Q));
FDRSE #(.INIT(1'h0)) inst20 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[20]), .Q(inst20_Q));
FDRSE #(.INIT(1'h0)) inst21 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[21]), .Q(inst21_Q));
FDRSE #(.INIT(1'h0)) inst22 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[22]), .Q(inst22_Q));
FDRSE #(.INIT(1'h0)) inst23 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[23]), .Q(inst23_Q));
FDRSE #(.INIT(1'h0)) inst24 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[24]), .Q(inst24_Q));
FDRSE #(.INIT(1'h0)) inst25 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[25]), .Q(inst25_Q));
FDRSE #(.INIT(1'h0)) inst26 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[26]), .Q(inst26_Q));
FDRSE #(.INIT(1'h0)) inst27 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[27]), .Q(inst27_Q));
FDRSE #(.INIT(1'h0)) inst28 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[28]), .Q(inst28_Q));
FDRSE #(.INIT(1'h0)) inst29 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[29]), .Q(inst29_Q));
FDRSE #(.INIT(1'h0)) inst30 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[30]), .Q(inst30_Q));
FDRSE #(.INIT(1'h0)) inst31 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[31]), .Q(inst31_Q));
assign O = {inst31_Q,inst30_Q,inst29_Q,inst28_Q,inst27_Q,inst26_Q,inst25_Q,inst24_Q,inst23_Q,inst22_Q,inst21_Q,inst20_Q,inst19_Q,inst18_Q,inst17_Q,inst16_Q,inst15_Q,inst14_Q,inst13_Q,inst12_Q,inst11_Q,inst10_Q,inst9_Q,inst8_Q,inst7_Q,inst6_Q,inst5_Q,inst4_Q,inst3_Q,inst2_Q,inst1_Q,inst0_Q};
endmodule

module Counter32_AAAAAAAAAAAAAAAA_AAAAAAAAAAAAAAAA (output [31:0] O, output  COUT, input  CLK);
wire [31:0] inst0_O;
wire  inst0_COUT;
wire [31:0] inst1_O;
Adders32x1_2_2_cinNone_cout1 inst0 (.I0(inst1_O), .O(inst0_O), .CIN(1'b1), .COUT(inst0_COUT));
Register32 inst1 (.I(inst0_O), .O(inst1_O), .CLK(CLK));
assign O = inst1_O;
assign COUT = inst0_COUT;
endmodule

module main (output [0:0] LED, inout  PS_CLK, inout  PS_PORB, inout  PS_SRSTB, input [53:0] MIO, inout  DDR_DRSTB, input [31:0] DDR_DQ, input [3:0] DDR_DM, input [3:0] DDR_DQS, input [3:0] DDR_DQS_n, inout  DDR_VRN, inout  DDR_VRP, inout  DDR_Clk, inout  DDR_Clk_n, input [14:0] DDR_Addr, input [2:0] DDR_BankAddr, inout  DDR_ODT, inout  DDR_CS_n, inout  DDR_CKE, output  DDR_WEB, inout  DDR_CAS_n, inout  DDR_RAS_n);
wire  inst0_DDR_WEB;
wire  inst0_CLK;
wire  inst0_RST_n;
wire  inst1_O;
wire [31:0] inst2_O;
wire  inst2_COUT;
ps7_stub inst0 (.MIO(inst0_MIO), .DDR_WEB(inst0_DDR_WEB), .DDR_VRP(inst0_DDR_VRP), .DDR_VRN(inst0_DDR_VRN), .DDR_RAS_n(inst0_DDR_RAS_n), .DDR_ODT(inst0_DDR_ODT), .DDR_DRSTB(inst0_DDR_DRSTB), .DDR_DQS(inst0_DDR_DQS), .DDR_DQS_n(inst0_DDR_DQS_n), .DDR_DQ(inst0_DDR_DQ), .DDR_DM(inst0_DDR_DM), .DDR_CS_n(inst0_DDR_CS_n), .DDR_CKE(inst0_DDR_CKE), .DDR_Clk(inst0_DDR_Clk), .DDR_Clk_n(inst0_DDR_Clk_n), .DDR_CAS_n(inst0_DDR_CAS_n), .DDR_BankAddr(inst0_DDR_BankAddr), .DDR_Addr(inst0_DDR_Addr), .PS_PORB(inst0_PS_PORB), .PS_SRSTB(inst0_PS_SRSTB), .PS_CLK(inst0_PS_CLK), .CLK(inst0_CLK), .RST_n(inst0_RST_n));
BUFG inst1 (.I(inst0_CLK), .O(inst1_O));
Counter32_AAAAAAAAAAAAAAAA_AAAAAAAAAAAAAAAA inst2 (.O(inst2_O), .COUT(inst2_COUT), .CLK(inst1_O));
assign LED = {inst2_O[24]};
assign DDR_WEB = inst0_DDR_WEB;
endmodule

