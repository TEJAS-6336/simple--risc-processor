`timescale 1ns / 1ps

module instr_mem (
    input  [7:0] addr,        // Address from PC
    output reg [15:0] instr   // Instruction output
);

always @(*) begin
    case(addr)
        // Program:
        // R1 = 5
        // R2 = 10
        // R3 = R1 + R2
        // MEM[0] = R3

        8'd0: instr = 16'b0100_0001_0000_0101; // LOAD R1, #5
        8'd1: instr = 16'b0100_0010_0000_1010; // LOAD R2, #10
        8'd2: instr = 16'b0000_0011_0001_0010; // ADD  R3, R1, R2
        8'd3: instr = 16'b0101_0011_0000_0000; // STORE R3 -> MEM[0]

        default: instr = 16'b0000_0000_0000_0000; // NOP
    endcase
end

endmodule

