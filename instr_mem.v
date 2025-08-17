always @(*) begin
    case(addr)
        8'd0: instr = 16'b0100_0001_0000_0101; // LOAD R1, #5
        8'd1: instr = 16'b0100_0010_0000_1010; // LOAD R2, #10
        8'd2: instr = 16'b0000_0011_0001_0010; // ADD R3, R1, R2
        8'd3: instr = 16'b0101_0011_0000_0000; // STORE R3 -> MEM[0]
        default: instr = 16'b0000_0000_0000_0000;
    endcase
end


