
interface scaiev_interface;

    // Signals from/to fetch stage
    logic [31: 0] fetch_PC;



    // Signals from/to decode stage
    logic [31: 0] decode_PC;
    logic [31: 0] decode_RS1;
    logic [31: 0] decode_RS2;

    logic         decode_isSCAIEV;          // the instruction word was decoded by SCAL to be a valid ISAX
    logic         decode_isSCAIEV_usesRS1;  // the ISAX uses RS1 
    logic         decode_isSCAIEV_usesRS2;  // the ISAX uses RS2
    logic         decode_isSCAIEV_usesRD;   // the ISAX uses RD


    // Signals from/to execute stage
    logic [31: 0] execute_PC;
    logic [31: 0] execute_RS1;
    logic [31: 0] execute_RS2;



    // Signals from/to writeback stage
    logic [31:0] writeback_PC;



    modport core (
        input decode_isSCAIEV,
        decode_isSCAIEV_usesRS1,
        decode_isSCAIEV_usesRS2,
        decode_isSCAIEV_usesRD,

        output fetch_PC,
        decode_PC,
        decode_RS1,
        decode_RS2,

        execute_PC,
        execute_RS1,
        execute_RS2,

        writeback_PC
    
    );


    modport scal (
        output decode_isSCAIEV,
        decode_isSCAIEV_usesRS1,
        decode_isSCAIEV_usesRS2,
        decode_isSCAIEV_usesRD,

        input fetch_PC, 
        decode_PC,
        decode_RS1,
        decode_RS2,

        execute_PC,
        execute_RS1,
        execute_RS2,

        writeback_PC
    
    );


endinterface



