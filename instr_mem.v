module instr_mem (
    input  [7:0] addr,         // Address from Program Counter (PC)
    output [15:0] instr        // Instruction fetched from memory
);
    reg [15:0] memory [0:255]; // 256 instructions, 16 bits each

    // Load instructions from a hex file at the start of simulation
    initial $readmemh("program.hex", memory);

    assign instr = memory[addr]; // Fetch instruction at PC address
endmodule
