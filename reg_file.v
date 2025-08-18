module reg_file(
    input clk,
    input reg_write,
    input [2:0] rs1, rs2, rd,
    input [15:0] write_data,
    output [15:0] read_data1,
    output [15:0] read_data2
);
    reg [15:0] regs [0:7]; // 8 registers R0-R7

    // Initialize registers with sample values
    initial begin
        regs[0] = 16'h0000;
        regs[1] = 16'h0005; // R1 = 5
        regs[2] = 16'h0003; // R2 = 3
        regs[3] = 16'h0000;
        regs[4] = 16'h0000;
        regs[5] = 16'h0000;
        regs[6] = 16'h0000;
        regs[7] = 16'h0000;
    end

    always @(posedge clk) begin
        if (reg_write) regs[rd] <= write_data;
    end

    assign read_data1 = regs[rs1];
    assign read_data2 = regs[rs2];

endmodule
