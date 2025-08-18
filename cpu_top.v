module cpu_top (
    input clk,
    input reset
);
    // Program Counter
    wire [7:0] pc_val;
    pc PC (
        .clk(clk),
        .reset(reset),
        .pc(pc_val)
    );

    // Instruction Memory
    wire [15:0] instr;
    instr_mem IM (
        .addr(pc_val),
        .instr(instr)
    );

    // Decode fields
    wire [3:0] opcode = instr[15:12];
    wire [2:0] rs1    = instr[11:9];
    wire [2:0] rs2    = instr[8:6];
    wire [2:0] rd     = instr[5:3];

    // Control Unit
    wire reg_write, mem_write, alu_src, mem_to_reg, branch;
    wire [2:0] alu_op;
    control_unit CU (
        .opcode(opcode),
        .reg_write(reg_write),
        .mem_write(mem_write),
        .alu_src(alu_src),
        .mem_to_reg(mem_to_reg),
        .branch(branch),
        .alu_op(alu_op)
    );

    // Register File
    wire [15:0] read_data1, read_data2;
    wire [15:0] write_data;
    reg_file RF (
        .clk(clk),
        .reg_write(reg_write),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .write_data(write_data),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    // ALU
    wire [15:0] alu_result;
    wire carry_out;
    alu ALU (
        .a(read_data1),
        .b(read_data2),   // For now ignore alu_src immediate
        .alu_ctrl(sel),
        .result(alu_result),
        .carry_out(carry_out)
        
    );

    // Write-back
    assign write_data = alu_result;

    // For testbench visibility
    // (not synthesizable but helps simulation)
    // remove in final FPGA version
    wire [15:0] dbg_instr     = instr;
    wire [15:0] dbg_result    = alu_result;
    wire [15:0] dbg_read1     = read_data1;
    wire [15:0] dbg_read2     = read_data2;

endmodule

