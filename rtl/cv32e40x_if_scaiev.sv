
interface scaiev_interface;

    // Signals from/to fetch stage
    logic [31: 0] fetch_PC;                 // RdPC
    logic [31: 0] fetch_Instr;              // RdInstr
    logic         fetch_isKilled;           // RdFlush
    logic         fetch_isHalted;           // RdStall
    logic         fetch_doKill;             // WrFlush
    logic         fetch_doHalt;             // WrStall
    logic         fetch_valid;



    // Signals from/to decode stage
    logic [31: 0] decode_PC;                // RdPC
    logic [31: 0] decode_RS1;
    logic [31: 0] decode_RS2;
    logic [31: 0] decode_Instr;
    logic         decode_isKilled;          // RdFlush
    logic         decode_isHalted;          // RdStall
    logic         decode_doKill;            // WrFlush
    logic         decode_doHalt;            // WrStall
    logic [31: 0] decode_jmp_target;        // the jump target address for decode stage, WrPC
    logic         decode_jmp_target_valid;  // the jump target address for decode stage is valid, WrPC
    logic         decode_valid;

    // Signals to decoder for micro code generation
    logic         decode_isSCAIEV;          // the instruction word was decoded by SCAL to be a valid ISAX
    logic         decode_isSCAIEV_usesRS1;  // the ISAX uses RS1 
    logic         decode_isSCAIEV_usesRS2;  // the ISAX uses RS2
    logic         decode_isSCAIEV_usesRD;   // the ISAX uses RD
    logic         decode_isSCAIEV_jmp;      // the ISAX uses WrPC in decode stage
    logic         decode_isSCAIEV_bch;      // the ISAX uses WrPC in execute stage



    // Signals from/to execute stage
    logic [31: 0] execute_PC;               // RdPC
    logic [31: 0] execute_RS1;
    logic [31: 0] execute_RS2;
    logic [31: 0] execute_Instr;
    logic         execute_RD_valid;         // destination register update values is valid, WrRD
    logic [31: 0] execute_RD;               // destination register update value, WrRD
    logic [31: 0] execute_bch_target;       // the branch target address for execute stage, WrPC
    logic         execute_bch_target_valid; // the branch target address for execute stage is valid, WrPC
    logic         execute_isKilled;         // RdFlush
    logic         execute_isHalted;         // RdStall
    logic         execute_doKill;           // WrFlush
    logic         execute_doHalt;           // WrStall
    logic         execute_valid;



    modport core (
        input
        fetch_doKill,
        fetch_doHalt,

        decode_isSCAIEV,
        decode_isSCAIEV_usesRS1,
        decode_isSCAIEV_usesRS2,
        decode_isSCAIEV_usesRD,
        decode_isSCAIEV_jmp,
        decode_isSCAIEV_bch,
        
        decode_jmp_target,
        decode_jmp_target_valid,
        decode_doKill,
        decode_doHalt,

        execute_RD_valid,
        execute_RD,
        execute_bch_target,
        execute_bch_target_valid,
        execute_doKill,
        execute_doHalt,


        output
        fetch_PC,
        fetch_Instr,
        fetch_isKilled,
        fetch_isHalted,
        fetch_valid,

        decode_PC,
        decode_RS1,
        decode_RS2,
        decode_Instr,
        decode_isKilled,
        decode_isHalted,
        decode_valid,

        execute_PC,
        execute_RS1,
        execute_RS2,
        execute_Instr,
        execute_isKilled,
        execute_isHalted,
        execute_valid
    );


    modport scal (
        output
        fetch_doKill,
        fetch_doHalt,

        decode_isSCAIEV,
        decode_isSCAIEV_usesRS1,
        decode_isSCAIEV_usesRS2,
        decode_isSCAIEV_usesRD,
        decode_isSCAIEV_jmp,
        decode_isSCAIEV_bch,
        
        decode_jmp_target,
        decode_jmp_target_valid,
        decode_doKill,
        decode_doHalt,

        execute_RD_valid,
        execute_RD,
        execute_bch_target,
        execute_bch_target_valid,
        execute_doKill,
        execute_doHalt,

        input
        fetch_PC,
        fetch_Instr,
        fetch_isKilled,
        fetch_isHalted,
        fetch_valid,

        decode_PC,
        decode_RS1,
        decode_RS2,
        decode_Instr,
        decode_isKilled,
        decode_isHalted,
        decode_valid,

        execute_PC,
        execute_RS1,
        execute_RS2,
        execute_Instr,
        execute_isKilled,
        execute_isHalted,
        execute_valid
    );


endinterface



