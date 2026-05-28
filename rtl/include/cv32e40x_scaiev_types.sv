

package scaiev_types;


endpackage


interface scaiev_interface;

    // Signals from/to fetch stage
    logic [31:0] fetch_PC;



    // Signals from/to decode stage
    logic [31:0] decode_PC;



    // Signals from/to execute stage
    logic [31:0] execute_PC;



    // Signals from/to writeback stage
    logic [31:0] writeback_PC;



    modport core (
        //input

        output fetch_PC,
        decode_PC, 
        execute_PC,
        writeback_PC
    
    );


    modport scal (
        //output

        input fetch_PC, 
        decode_PC, 
        execute_PC,
        writeback_PC
    
    );


endinterface



