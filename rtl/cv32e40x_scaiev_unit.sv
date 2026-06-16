

module cv32e40x_scaiev_unit
    import cv32e40x_pkg::*;
(
    input logic clk,
    input logic rst_n,


    input id_ex_pipe_t id_ex_pipe_i,

    input ctrl_fsm_t ctrl_fsm_i,

    output logic         ready_o,
    output logic         valid_o,
    output logic [31: 0] result_o,
    
    output logic [31: 0] branch_target_o,
    output logic         branch_decision_o,

    scaiev_interface.core scaiev

    

);

// valid when instruction is done, optionally data can be written then

// id_ex_pipe_i.rf_we && scaiev_en signal that the current scaiev instruction is about to use RD

// ready when no operation is ongoing, all results have been forwarded to wb
// TODO: Verify that EX is stalled as long as ISAX is ongoing, so ready will be ignored anyways
assign ready_o = 1'b1;

always_comb begin : Rd_Assign
    result_o = 'x;
    valid_o = 1'b0;
    if (id_ex_pipe_i.scaiev_en && id_ex_pipe_i.rf_we) begin
        // forward the result if the instruction uses WrRD, also assume that EX can be unstalled when WrRD happened
        result_o = scaiev.execute_RD;
        valid_o = scaiev.execute_RD_valid;
    
    end else if (id_ex_pipe_i.scaiev_en) begin
        // else simply set as valid
        // TODO: verify that without the multi-cycle signals (RdInstageID, WrInStageID,...) SCAL stalls execute until ISAX is finished
        valid_o = 1'b1;
    end
end

always_comb begin : PC_Assign
    branch_target_o = 'x;
    branch_decision_o = 1'b0;

    if (id_ex_pipe_i.scaiev_en && id_ex_pipe_i.scaiev_bch) begin
        // Note: we assume EX to be stalled from outside as long as branch target computation is not finished
        branch_target_o = scaiev.execute_bch_target;
        branch_decision_o = scaiev.execute_bch_target_valid;
    end

end



assign scaiev.execute_PC = id_ex_pipe_i.pc;
assign scaiev.execute_RS1 = id_ex_pipe_i.alu_operand_a;
assign scaiev.execute_RS2 = id_ex_pipe_i.alu_operand_b;
assign scaiev.execute_Instr = id_ex_pipe_i.instr.bus_resp.rdata;

endmodule