module instr_mem (
    input  [7:0] addr,       // PC address
    output reg [15:0] instr
);

    reg [15:0] memory [0:255];

    initial begin
        // --- Simple program ---
        memory[0] = 16'b0001_0001_0010_0011; // ADD R1, R2 -> R3
        memory[1] = 16'b0010_0011_0001_0100; // SUB R3, R1 -> R4
        memory[2] = 16'b1111_0000_0000_0000; // HALT
    end

    always @(*) begin
        instr = memory[addr];
    end

endmodule


