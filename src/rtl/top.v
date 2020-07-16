module top (
    input           sys_clk_p,
    input           sys_clk_n,
    output          fan_pwm,
    output [3:0]    led_tri_o
);

assign fan_pwm = 0;
//---------------------------------------------------
// general signals
// --------------------------------------------------
wire        sys_clk_200;
wire        rst_200;
wire        interrupt;
wire [3:0]  gpio;

reg [27:0]  cnt;
<<<<<<< HEAD

=======
>>>>>>> 96c048c0dc786443c119c21e83b6559b9e304d7c
//---------------------------------------------------
// cfg ram signals
// -------------------------------------------------- 
reg [10:0]      cfg_ram_addr;
wire            cfg_ram_clk;
wire            cfg_ram_rst;
reg [31:0]      cfg_ram_din;
wire [31:0]     cfg_ram_dout;
reg             cfg_ram_ena;
wire [3:0]      cfg_ram_byte_ena;


//---------------------------------------------------
// data mover signals
// --------------------------------------------------
wire            hp0_arready;
wire            hp0_awready;
wire [5:0]      hp0_bid;
wire [1:0]      hp0_bresp;
wire            hp0_bvalid;
wire [63:0]     hp0_rdata;
wire [3:0]      hp0_rid;
wire            hp0_rlast;
wire [1:0]      hp0_rresp;
wire            hp0_rvalid;
wire            hp0_rready;
 
wire [31:0]     hp0_araddr;
wire [1:0]      hp0_arburst;
wire [3:0]      hp0_arcache;
wire [3:0]      hp0_arid;
wire [7:0]      hp0_arlen;
wire [1:0]      hp0_arlock;
wire [2:0]      hp0_arprot;
wire [3:0]      hp0_arqos;
wire [2:0]      hp0_arsize;
wire            hp0_arvalid;

wire [31:0]     hp0_awaddr;
wire [1:0]      hp0_awburst;
wire [3:0]      hp0_awcache;
wire [3:0]      hp0_awid;
wire [7:0]      hp0_awlen;
wire [1:0]      hp0_awlock;
wire [2:0]      hp0_awprot;
wire [3:0]      hp0_awqos;
wire [2:0]      hp0_awsize;
wire            hp0_awvalid;
wire [3:0]      hp0_awuser;

wire [63:0]     hp0_wdata;
wire [5:0]      hp0_wid;
wire            hp0_wlast;
wire [7:0]      hp0_wstrb;
wire            hp0_wvalid;

wire            user_mm2s_rd_cmd_tvalid;
wire            user_mm2s_rd_cmd_tready;
wire [71:0]     user_mm2s_rd_cmd_tdata;
wire [63:0]     user_mm2s_rd_tdata;
wire [7:0]      user_mm2s_rd_tkeep;
wire            user_mm2s_rd_tlast;
wire            user_mm2s_rd_tready;

wire            user_s2mm_wr_cmd_tready;
wire            user_s2mm_wr_cmd_tvalid;
wire [71:0]     user_s2mm_wr_cmd_tdata;
wire            user_s2mm_wr_tvalid;
wire [63:0]     user_s2mm_wr_tdata;
wire            user_s2mm_wr_tready;
wire [7:0]      user_s2mm_wr_tkeep;
wire            user_s2mm_wr_tlast;

wire            user_s2mm_sts_tvalid;
wire [7:0]      user_s2mm_sts_tdata;
wire            user_s2mm_sts_tkeep;
wire            user_s2mm_sts_tlast;

//--------------------------------------------
// system clk
//--------------------------------------------
IBUFDS #(
    .DIFF_TERM("FALSE"),       // Differential Termination
    .IBUF_LOW_PWR("TRUE"),     // Low power="TRUE", Highest performance="FALSE" 
    .IOSTANDARD("DEFAULT")     // Specify the input I/O standard
) IBUFDS_inst (
    .O(sys_clk_200),  // Buffer output
    .I(sys_clk_p),  // Diff_p buffer input (connect directly to top-level port)
    .IB(sys_clk_n) // Diff_n buffer input (connect directly to top-level port)
);

<<<<<<< HEAD
always @(posedge sys_clk_200) begin
    if (rst_200) begin
        cnt <= 'h0;
    end else begin
        if (cnt == 28'hBEBC200) begin
            cnt <= 'h0;
        end else begin
            cnt <= cnt + 1'd1;
        end
    end
end

assign led_tri_o[3] = cnt[27];
=======

//---------------------------------------------------
// fpga device management
// --------------------------------------------------
localparam INTR_MSG_WIDTH = 8;
localparam TEMPER_WIDTH = 12;

wire                        usr_reg_wen;
wire [11:0]                 usr_reg_waddr;
wire [31:0]                 usr_reg_wdata;
wire                        usr_reg_ren;
wire [11:0]                 usr_reg_raddr;
wire [31:0]                 usr_reg_rdata;
wire [31:0]                 status_reg_data;
wire                        status_reg_valid;
wire [31:0]                 ctrl_reg_data;
wire                        ctrl_reg_valid;
wire                        intr_ready;
wire [INTR_MSG_WIDTH-1:0]   intr_msg;
wire [TEMPER_WIDTH-1:0]     temper;
wire                        temper_valid;
wire [31:0]                 version;
wire                        soft_rst;
wire                        fclk_100;
wire                        rst_fclk;
reg                         led_ctrl;
>>>>>>> 96c048c0dc786443c119c21e83b6559b9e304d7c

//--------------------------------------------
// block design
//--------------------------------------------

assign led_tri_o[2:0] = gpio[2:0];
<<<<<<< HEAD
=======

assign led_tri_o[3] = gpio[3] | led_ctrl;

>>>>>>> 96c048c0dc786443c119c21e83b6559b9e304d7c
assign interrupt = gpio[2];

system system_i (
    .gpio_tri_o(gpio),
    
    .hp0_araddr(hp0_araddr),
    .hp0_arburst(hp0_arburst),
    .hp0_arcache(hp0_arcache),
   // .hp0_arid(hp0_arid),
    .hp0_arlen(hp0_arlen),
    .hp0_arlock(hp0_arlock),
    .hp0_arprot(hp0_arprot),
    .hp0_arqos(hp0_arqos),
    .hp0_arready(hp0_arready),
    .hp0_arsize(hp0_arsize),
    .hp0_arvalid(hp0_arvalid),
    //AXI4 write addr
    .hp0_awaddr(hp0_awaddr),
    .hp0_awburst(hp0_awburst),
    .hp0_awcache(hp0_awcache),
  //  .hp0_awid(hp0_awid),
    .hp0_awlen(hp0_awlen),
    //.hp0_awlock(hp0_awlock),
    .hp0_awprot(hp0_awprot),
    //.hp0_awqos(hp0_awqos),
    .hp0_awready(hp0_awready),
    .hp0_awsize(hp0_awsize),
    .hp0_awvalid(hp0_awvalid),

    //.hp0_bid(hp0_bid),
    .hp0_bready(hp0_bready),
    .hp0_bresp(hp0_bresp),
    .hp0_bvalid(hp0_bvalid),
    //AXI4 read data interface
    .hp0_rdata(hp0_rdata),
    //.hp0_rid(hp0_rid),
    .hp0_rlast(hp0_rlast),
    .hp0_rready(hp0_rready),
    .hp0_rresp(hp0_rresp),
    .hp0_rvalid(hp0_rvalid),
    //AXI4 write data interface
    .hp0_wdata(hp0_wdata),
    //.hp0_wid(hp0_wid),
    .hp0_wlast(hp0_wlast),
    .hp0_wready(hp0_wready),
    .hp0_wstrb(hp0_wstrb),
    .hp0_wvalid(hp0_wvalid),

    .i_200m(sys_clk_200),
    .o_200m_reset(rst_200),
    .i_intr(interrupt),
    .cfg_ram_port_addr({{21'h0},cfg_ram_addr}),
    .cfg_ram_port_clk(cfg_ram_clk),
    .cfg_ram_port_din(cfg_ram_din),
    .cfg_ram_port_dout(cfg_ram_dout),
    .cfg_ram_port_en(cfg_ram_ena),
    .cfg_ram_port_rst(cfg_ram_rst),
<<<<<<< HEAD
    .cfg_ram_port_we(cfg_ram_byte_ena)
);

=======
    .cfg_ram_port_we(cfg_ram_byte_ena),
    
    //devive management
    .o_fclk_100(fclk_100),
    .o_rst_fclk(rst_fclk),
    .i_temper(12'h35a),
    .i_temper_valid(1'b1),
    .i_usr_reg_rdata(usr_reg_rdata),
    .i_version(32'h20200705),
    .o_soft_rst(soft_rst),
    .o_status_reg_data(status_reg_data),
    .o_status_reg_valid(status_reg_valid),
    .o_usr_reg_raddr(usr_reg_raddr),
    .o_usr_reg_ren(usr_reg_ren),
    .o_usr_reg_waddr(usr_reg_waddr),
    .o_usr_reg_wdata(usr_reg_wdata),
    .o_usr_reg_wen(usr_reg_wen)
);

/*
status register address:
    INTR_REG = 'h0;
    ERSION_REG = 'h4;
    EMP_REG    = 'h8;
    OFT_R_REG  = 'ha;logic

control register address:
    LED_REG = 'h40;
*/
localparam LED_REG = 'h40;


always @(posedge fclk_100) begin
    if (rst_fclk) begin
        led_ctrl <= 0;
    end else begin
        if ((usr_reg_waddr == LED_REG) & usr_reg_wen) begin
            led_ctrl <= usr_reg_wdata[0];
        end
    end
end

>>>>>>> 96c048c0dc786443c119c21e83b6559b9e304d7c
//--------------------------------------------
// cfg_ram 
//--------------------------------------------

reg     led0_r0;

always @(posedge sys_clk_200) begin
    led0_r0 <= gpio[0];
    cfg_ram_ena <= ~led0_r0 & gpio[0];
end

always @(*) begin
    if (cfg_ram_ena) begin
        cfg_ram_addr <= 'd1;
        cfg_ram_din <= 32'h12345678;
    end else begin
        cfg_ram_addr <= 'd0;
        cfg_ram_din <= 32'h0;
    end
end

assign cfg_ram_rst = rst_200;
assign cfg_ram_clk = sys_clk_200;
assign cfg_ram_byte_ena = 4'b1111;


//--------------------------------------------
// data mover
//--------------------------------------------
wire    [7:0]   m_axis_mm2s_sts_tdata;
wire            m_axis_mm2s_sts_tkeep;
wire            m_axis_mm2s_sts_tlast;
wire            m_axis_mm2s_sts_tvalid;

datamover datamover_hp0 (
    .m_axi_mm2s_aclk(sys_clk_200),                        // input wire m_axi_mm2s_aclk
    .m_axi_mm2s_aresetn(~rst_200),                  // input wire m_axi_mm2s_aresetn
    // AXI4 interface
    .mm2s_err(),                                      // output wire mm2s_err
    .m_axis_mm2s_cmdsts_aclk(sys_clk_200),        // input wire m_axis_mm2s_cmdsts_aclk
    .m_axis_mm2s_cmdsts_aresetn(~rst_200),  // input wire m_axis_mm2s_cmdsts_aresetn
    
    .m_axis_mm2s_sts_tvalid(m_axis_mm2s_sts_tvalid),          // output wire m_axis_mm2s_sts_tvalid
    .m_axis_mm2s_sts_tready(1'b1),          // input wire m_axis_mm2s_sts_tready
    .m_axis_mm2s_sts_tdata(m_axis_mm2s_sts_tdata),            // output wire [7 : 0] m_axis_mm2s_sts_tdata
    .m_axis_mm2s_sts_tkeep(m_axis_mm2s_sts_tkeep),            // output wire [0 : 0] m_axis_mm2s_sts_tkeep
    .m_axis_mm2s_sts_tlast(m_axis_mm2s_sts_tlast),            // output wire m_axis_mm2s_sts_tlast

    //AXI4 read addr interface

    .m_axi_mm2s_arid(hp0_arid),                        // output wire [3 : 0] m_axi_mm2s_arid
    .m_axi_mm2s_araddr(hp0_araddr),                    // output wire [31 : 0] m_axi_mm2s_araddr
    .m_axi_mm2s_arlen(hp0_arlen),                      // output wire [7 : 0] m_axi_mm2s_arlen
    .m_axi_mm2s_arsize(hp0_arsize),                    // output wire [2 : 0] m_axi_mm2s_arsize
    .m_axi_mm2s_arburst(hp0_arburst),                  // output wire [1 : 0] m_axi_mm2s_arburst
    .m_axi_mm2s_arprot(hp0_arprot),                    // output wire [2 : 0] m_axi_mm2s_arprot
    .m_axi_mm2s_arcache(hp0_arcache),                  // output wire [3 : 0] m_axi_mm2s_arcache
    .m_axi_mm2s_aruser(),                    // output wire [3 : 0] m_axi_mm2s_aruser
    .m_axi_mm2s_arvalid(hp0_arvalid),                  // output wire m_axi_mm2s_arvalid
    .m_axi_mm2s_arready(hp0_arready),                  // input wire m_axi_mm2s_arready

    .m_axi_mm2s_rdata(hp0_rdata),                      // input wire [63 : 0] m_axi_mm2s_rdata
    .m_axi_mm2s_rresp(hp0_rresp),                      // input wire [1 : 0] m_axi_mm2s_rresp
    .m_axi_mm2s_rlast(hp0_rlast),                      // input wire m_axi_mm2s_rlast
    .m_axi_mm2s_rvalid(hp0_rvalid),                    // input wire m_axi_mm2s_rvalid
    .m_axi_mm2s_rready(hp0_rready),                    // output wire m_axi_mm2s_rready
    // User interface
    
    .s_axis_mm2s_cmd_tvalid(user_mm2s_rd_cmd_tvalid),          // input wire s_axis_mm2s_cmd_tvalid
    .s_axis_mm2s_cmd_tready(user_mm2s_rd_cmd_tready),          // output wire s_axis_mm2s_cmd_tready
    .s_axis_mm2s_cmd_tdata(user_mm2s_rd_cmd_tdata),            // input wire [71 : 0] s_axis_mm2s_cmd_tdata

    .m_axis_mm2s_tdata(user_mm2s_rd_tdata),                    // output wire [63 : 0] m_axis_mm2s_tdata
    .m_axis_mm2s_tkeep(user_mm2s_rd_tkeep),                    // output wire [7 : 0] m_axis_mm2s_tkeep
    .m_axis_mm2s_tlast(user_mm2s_rd_tlast),                    // output wire m_axis_mm2s_tlast
    .m_axis_mm2s_tvalid(user_mm2s_rd_tvalid),                  // output wire m_axis_mm2s_tvalid
    .m_axis_mm2s_tready(user_mm2s_rd_tready),                  // input wire m_axis_mm2s_tready
    // AXI4 interface
    .m_axi_s2mm_aclk(sys_clk_200),                        // input wire m_axi_s2mm_aclk
    .m_axi_s2mm_aresetn(~rst_200),                  // input wire m_axi_s2mm_aresetn
    .s2mm_err(),                                      // output wire s2mm_err
    .m_axis_s2mm_cmdsts_awclk(sys_clk_200),      // input wire m_axis_s2mm_cmdsts_awclk
    .m_axis_s2mm_cmdsts_aresetn(~rst_200),  // input wire m_axis_s2mm_cmdsts_aresetn
   
    .m_axis_s2mm_sts_tvalid(user_s2mm_sts_tvalid),          // output wire m_axis_s2mm_sts_tvalid
    .m_axis_s2mm_sts_tready(1'b1),          // input wire m_axis_s2mm_sts_tready
    .m_axis_s2mm_sts_tdata(user_s2mm_sts_tdata),            // output wire [7 : 0] m_axis_s2mm_sts_tdata
    .m_axis_s2mm_sts_tkeep(user_s2mm_sts_tkeep),            // output wire [0 : 0] m_axis_s2mm_sts_tkeep
    .m_axis_s2mm_sts_tlast(user_s2mm_sts_tlast),            // output wire m_axis_s2mm_sts_tlast
    // AXI4 addr interface
   
    //.m_axi_s2mm_awid(hp0_awid),                        // output wire [3 : 0] m_axi_s2mm_awid
    .m_axi_s2mm_awaddr(hp0_awaddr),                    // output wire [31 : 0] m_axi_s2mm_awaddr
    .m_axi_s2mm_awlen(hp0_awlen),                      // output wire [7 : 0] m_axi_s2mm_awlen
    .m_axi_s2mm_awsize(hp0_awsize),                    // output wire [2 : 0] m_axi_s2mm_awsize
    .m_axi_s2mm_awburst(hp0_awburst),                  // output wire [1 : 0] m_axi_s2mm_awburst
    .m_axi_s2mm_awprot(hp0_awprot),                    // output wire [2 : 0] m_axi_s2mm_awprot
    .m_axi_s2mm_awcache(hp0_awcache),                  // output wire [3 : 0] m_axi_s2mm_awcache
    .m_axi_s2mm_awuser(hp0_awuser),                    // output wire [3 : 0] m_axi_s2mm_awuser
    .m_axi_s2mm_awvalid(hp0_awvalid),                  // output wire m_axi_s2mm_awvalid
    .m_axi_s2mm_awready(hp0_awready),                  // input wire m_axi_s2mm_awready
    
    //AXI4 data interface
    .m_axi_s2mm_wdata(hp0_wdata),                      // output wire [63 : 0] m_axi_s2mm_wdata
    .m_axi_s2mm_wstrb(hp0_wstrb),                      // output wire [7 : 0] m_axi_s2mm_wstrb
    .m_axi_s2mm_wlast(hp0_wlast),                      // output wire m_axi_s2mm_wlast
    .m_axi_s2mm_wvalid(hp0_wvalid),                    // output wire m_axi_s2mm_wvalid
    .m_axi_s2mm_wready(hp0_wready),                    // input wire m_axi_s2mm_wready
    .m_axi_s2mm_bresp(hp0_bresp),                      // input wire [1 : 0] m_axi_s2mm_bresp
    .m_axi_s2mm_bvalid(hp0_bvalid),                    // input wire m_axi_s2mm_bvalid
    .m_axi_s2mm_bready(hp0_bready),                    // output wire m_axi_s2mm_bready
    // User interface
    .s_axis_s2mm_cmd_tvalid(user_s2mm_wr_cmd_tvalid),          // input wire s_axis_s2mm_cmd_tvalid
    .s_axis_s2mm_cmd_tready(user_s2mm_wr_cmd_tready),          // output wire s_axis_s2mm_cmd_tready
    .s_axis_s2mm_cmd_tdata(user_s2mm_wr_cmd_tdata),            // input wire [71 : 0] s_axis_s2mm_cmd_tdata

    .s_axis_s2mm_tdata(user_s2mm_wr_tdata),                    // input wire [63 : 0] s_axis_s2mm_tdata
    .s_axis_s2mm_tkeep(user_s2mm_wr_tkeep),                    // input wire [7 : 0] s_axis_s2mm_tkeep
    .s_axis_s2mm_tlast(user_s2mm_wr_tlast),                    // input wire s_axis_s2mm_tlast
    .s_axis_s2mm_tvalid(user_s2mm_wr_tvalid),                  // input wire s_axis_s2mm_tvalid
    .s_axis_s2mm_tready(user_s2mm_wr_tready)                  // output wire s_axis_s2mm_tready
);

wire            dm_start;
reg [8:0]       dm_length;
reg [31:0]      dm_start_addr;
wire            dm_start_vio;
reg             dm_start_vio_r0;
reg             dm_start_vio_p;
wire [8:0]      dm_length_vio;
wire [31:0]     dm_start_addr_vio;

reg             dm_start_led1;
reg             led1_r0;

always @(posedge sys_clk_200) begin
    led1_r0 <= gpio[1];
    dm_start_led1 <= ~led1_r0 & gpio[1];
end

vio_datamover vio_datamover_inst (
  .clk(sys_clk_200),                // input wire clk
  .probe_out0(dm_start_vio),  // output wire [0 : 0] probe_out0
  .probe_out1(dm_length_vio),  // output wire [8 : 0] probe_out1
  .probe_out2(dm_start_addr_vio)  // output wire [31 : 0] probe_out2
);

assign dm_start = dm_start_vio | led1_r0;

always @(posedge sys_clk_200) begin
    dm_start_vio_r0 <= dm_start_vio;
    dm_start_vio_p <= ~dm_start_vio_r0 & dm_start_vio;
end

always @(posedge sys_clk_200) begin
    if (rst_200) begin
        dm_length <= 'h0;
        dm_start_addr <= 'h0;
    end else begin
        if (dm_start_led1) begin
            dm_length <= 9'h080;
<<<<<<< HEAD
            dm_start_addr <= 'h0;
=======
            dm_start_addr <= 32'h3000_0000;
>>>>>>> 96c048c0dc786443c119c21e83b6559b9e304d7c
        end else if (dm_start_vio_p) begin
            dm_length <= dm_length_vio;
            dm_start_addr<= dm_start_addr_vio;
        end
    end
    
end


datamover_validation  datamover_validation_inst(
    .clk(sys_clk_200),
    .rst(rst_200),

    .i_start(dm_start),
    .i_length(dm_length),
    .i_start_addr(dm_start_addr),

    .i_s2mm_wr_cmd_tready(user_s2mm_wr_cmd_tready),
    .o_s2mm_wr_cmd_tdata(user_s2mm_wr_cmd_tdata),
    .o_s2mm_wr_cmd_tvalid(user_s2mm_wr_cmd_tvalid),

    .o_s2mm_wr_tdata(user_s2mm_wr_tdata),
    .o_s2mm_wr_tkeep(user_s2mm_wr_tkeep),
    .o_s2mm_wr_tvalid(user_s2mm_wr_tvalid),
    .o_s2mm_wr_tlast(user_s2mm_wr_tlast),
    .i_s2mm_wr_tready(user_s2mm_wr_tready),

    .s2mm_sts_tdata(user_s2mm_sts_tdata),
    .s2mm_sts_tvalid(user_s2mm_sts_tvalid),
    .s2mm_sts_tkeep(user_s2mm_sts_tkeep),
    .s2mm_sts_tlast(user_s2mm_sts_tlast),


    .i_mm2s_rd_cmd_tready(user_mm2s_rd_cmd_tready),
    .o_mm2s_rd_cmd_tdata(user_mm2s_rd_cmd_tdata),
    .o_mm2s_rd_cmd_tvalid(user_mm2s_rd_cmd_tvalid),

    .i_mm2s_rd_tdata(user_mm2s_rd_tdata),
    .i_mms2_rd_tkeep(user_mm2s_rd_tkeep),
    .i_mm2s_rd_tvalid(user_mm2s_rd_tvalid),
    .i_mm2s_rd_tlast(user_mm2s_rd_tlast),
    .o_mm2s_rd_tready(user_mm2s_rd_tready)
);

ila_datamover ila_datamover_inst (
	.clk(sys_clk_200), // input wire clk

	.probe0(user_s2mm_wr_cmd_tready), // input wire [0:0]  probe0  
	.probe1(user_s2mm_wr_cmd_tdata), // input wire [71:0]  probe1 
	.probe2(user_s2mm_wr_cmd_tvalid), // input wire [0:0]  probe2 
	.probe3(user_s2mm_wr_tdata), // input wire [63:0]  probe3 
	.probe4(user_s2mm_wr_tkeep), // input wire [7:0]  probe4 
	.probe5(user_s2mm_wr_tlast), // input wire [0:0]  probe5 
	.probe6(user_s2mm_wr_tvalid), // input wire [0:0]  probe6 
	.probe7(user_s2mm_wr_tready), // input wire [0:0]  probe7 
	.probe8(user_s2mm_sts_tvalid), // input wire [0:0]  probe8 
	.probe9(user_s2mm_sts_tdata), // input wire [3:0]  probe9 
	.probe10(user_s2mm_sts_tlast), // input wire [0:0]  probe10 
	.probe11(user_mm2s_rd_tdata), // input wire [63:0]  probe11 
	.probe12(user_mm2s_rd_tkeep), // input wire [7:0]  probe12 
	.probe13(user_mm2s_rd_tlast), // input wire [0:0]  probe13 
	.probe14(user_mm2s_rd_tvalid), // input wire [0:0]  probe14 
	.probe15(user_mm2s_rd_cmd_tvalid), // input wire [0:0]  probe15 
	.probe16(user_mm2s_rd_cmd_tdata), // input wire [71:0]  probe16 
	.probe17(user_mm2s_rd_cmd_tready), // input wire [0:0]  probe17
	.probe18(rst_200),
    .probe19(m_axis_mm2s_sts_tkeep), // input wire [0:0]  probe19 
	.probe20(m_axis_mm2s_sts_tlast), // input wire [0:0]  probe20 
	.probe21(m_axis_mm2s_sts_tvalid), // input wire [0:0]  probe21 
	.probe22(m_axis_mm2s_sts_tdata) // input wire [7:0]  probe22
);


endmodule