

module cv32e40x_scaiev_glue 
    import cv32e40x_pkg::*;

(
    input clk,
    input rst_n,


    scaiev_interface.scal scaiev
);


logic decode_isHalted;
logic execute_isHalted;


assign decode_isHalted = scaiev.decode_isHalted;
assign execute_isHalted = scaiev.execute_isHalted;

// WrRD assign
assign scaiev.execute_RD = '0;
assign scaiev.execute_RD_valid = 1'b0;

// WrPC_1 assign
assign scaiev.decode_jmp_target = '0;
assign scaiev.decode_jmp_target_valid = 1'b0;

// WrPC_2 assign
assign scaiev.execute_bch_target = '0;
assign scaiev.execute_bch_target_valid = 1'b0;


// scaiev_interface outgoing IF signals
assign scaiev.fetch_doHalt = 1'b0;
assign scaiev.fetch_doKill = 1'b0;

// scaiev_interface outgoing ID signals
assign scaiev.decode_isSCAIEV = 1'b0;
assign scaiev.decode_isSCAIEV_usesRS1 = 1'b0;
assign scaiev.decode_isSCAIEV_usesRS2 = 1'b0;
assign scaiev.decode_isSCAIEV_usesRD = 1'b0;
assign scaiev.decode_isSCAIEV_jmp = 1'b0;
assign scaiev.decode_isSCAIEV_bch = 1'b0;
assign scaiev.decode_doHalt = 1'b0;
assign scaiev.decode_doKill = 1'b0;

// scaiev_interface outgoing EX signals
assign scaiev.execute_doHalt = 1'b0;
assign scaiev.execute_doKill = 1'b0;

endmodule