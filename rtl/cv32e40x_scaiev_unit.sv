

module cv32e40x_scaiev_unit
    import cv32e40x_pkg::*;
(
    input logic clk,
    input logic rst_n,


    input id_ex_pipe_t id_ex_pipe,

    scaiev_interface.core scaiev

        

);

assign scaiev.execute_PC = id_ex_pipe.pc;
assign scaiev.execute_RS1 = id_ex_pipe.alu_operand_a;
assign scaiev.execute_RS2 = id_ex_pipe.alu_operand_b;


endmodule