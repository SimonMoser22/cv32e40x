

module cv32e40x_scaiev_glue 
    import cv32e40x_pkg::*;

(
    input clk,
    input rst_n,


    scaiev_interface.scal scaiev
);




always_comb begin : WrRD_assign
    scaiev.execute_RD = '0;
    scaiev.execute_RD_valid = 0;

    // SCAIEV_INSERT_WRRD
end

// scaiev_interface outgoing IF signals
assign scaiev.fetch_doHalt = 1'b0;
assign scaiev.fetch_doKill = 1'b0;

// scaiev_interface outgoing ID signals
assign scaiev.decode_isSCAIEV = 1'b0;
assign scaiev.decode_isSCAIEV_usesRS1 = 1'b0;
assign scaiev.decode_isSCAIEV_usesRS2 = 1'b0;
assign scaiev.decode_isSCAIEV_usesRD = 1'b0;
assign scaiev.decode_doHalt = 1'b0;
assign scaiev.decode_doKill = 1'b0;

// scaiev_interface outgoing EX signals
assign scaiev.execute_doHalt = 1'b0;
assign scaiev.execute_doKill = 1'b0;

endmodule