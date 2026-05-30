
interface scaiev_interface;

    // Signals from/to fetch stage
    logic [31: 0] fetch_PC;
    logic [31: 0] fetch_Instr;
    logic         fetch_isKilled;           // RdFlush
    logic         fetch_isHalted;           // RdStall
    logic         fetch_doKill;             // WrFlush
    logic         fetch_doHalt;             // WrStall



    // Signals from/to decode stage
    logic [31: 0] decode_PC;
    logic [31: 0] decode_RS1;
    logic [31: 0] decode_RS2;
    logic [31: 0] decode_Instr;
    logic         decode_isKilled;          // RdFlush
    logic         decode_isHalted;          // RdStall
    logic         decode_doKill;            // WrFlush
    logic         decode_doHalt;            // WrStall

    logic         decode_isSCAIEV;          // the instruction word was decoded by SCAL to be a valid ISAX
    logic         decode_isSCAIEV_usesRS1;  // the ISAX uses RS1 
    logic         decode_isSCAIEV_usesRS2;  // the ISAX uses RS2
    logic         decode_isSCAIEV_usesRD;   // the ISAX uses RD


    // Signals from/to execute stage
    logic [31: 0] execute_PC;
    logic [31: 0] execute_RS1;
    logic [31: 0] execute_RS2;
    logic [31: 0] execute_Instr;
    logic         execute_isKilled;         // RdFlush
    logic         execute_isHalted;         // RdStall
    logic         execute_doKill;           // WrFlush
    logic         execute_doHalt;           // WrStall



    // Signals from/to writeback stage
    logic [31: 0] writeback_PC;
    logic [31: 0] writeback_Instr;
    logic         writeback_isKilled;       // RdFlush
    logic         writeback_isHalted;       // RdStall
    logic         writeback_doKill;         // WrFlush
    logic         writeback_doHalt;         // WrStall



    modport core (
        input
        fetch_doKill,
        fetch_doHalt,

        decode_isSCAIEV,
        decode_isSCAIEV_usesRS1,
        decode_isSCAIEV_usesRS2,
        decode_isSCAIEV_usesRD,
        decode_doKill,
        decode_doHalt,

        execute_doKill,
        execute_doHalt,

        writeback_doKill,
        writeback_doHalt,

        output
        fetch_PC,
        fetch_Instr,
        fetch_isKilled,
        fetch_isHalted,

        decode_PC,
        decode_RS1,
        decode_RS2,
        decode_Instr,
        decode_isKilled,
        decode_isHalted,

        execute_PC,
        execute_RS1,
        execute_RS2,
        execute_Instr,
        execute_isKilled,
        execute_isHalted,

        writeback_PC,
        writeback_Instr,
        writeback_isKilled,
        writeback_isHalted
    
    );


    modport scal (
        output
        fetch_doKill,
        fetch_doHalt,

        decode_isSCAIEV,
        decode_isSCAIEV_usesRS1,
        decode_isSCAIEV_usesRS2,
        decode_isSCAIEV_usesRD,
        decode_doKill,
        decode_doHalt,

        execute_doKill,
        execute_doHalt,

        writeback_doKill,
        writeback_doHalt,

        input
        fetch_PC,
        fetch_Instr,
        fetch_isKilled,
        fetch_isHalted,

        decode_PC,
        decode_RS1,
        decode_RS2,
        decode_Instr,
        decode_isKilled,
        decode_isHalted,

        execute_PC,
        execute_RS1,
        execute_RS2,
        execute_Instr,
        execute_isKilled,
        execute_isHalted,

        writeback_PC,
        writeback_Instr,
        writeback_isKilled,
        writeback_isHalted
    
    );


endinterface



