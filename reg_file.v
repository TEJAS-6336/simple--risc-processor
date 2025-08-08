`timescale 1ns / 1ps


module reg_file (
    input clk,
    input reg_write,
    input [2:0] rs1, rs2, rd,
    input [15:0] write_data,
    output [15:0] read_data1,
    output [15:0] read_data2
);
    // 8 general-purpose 16-bit registers: R0 to R7
    reg [15:0] registers [0:7];

    // Read operations (combinational)
    assign read_data1 = registers[rs1];
    assign read_data2 = registers[rs2];

    // Write operation (sequential)
    always @(posedge clk) begin
        if (reg_write && rd != 3'b000)  // optional: prevent writing to R0
            registers[rd] <= write_data;
    end
endmodule
