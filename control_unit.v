module control_unit(
    input  [3:0] opcode,
    output reg reg_write,
    output reg mem_write,
    output reg alu_src,
    output reg mem_to_reg,
    output reg branch,
    output reg [2:0] alu_op
);

    always @(*) begin
        // Default values
        reg_write   = 0;
        mem_write   = 0;
        alu_src     = 0;
        mem_to_reg  = 0;
        branch      = 0;
        alu_op      = 3'b000;

        case (opcode)
            4'b0000: begin // ADD
                reg_write = 1;
                alu_op = 3'b000; // ADD
            end
            4'b0001: begin // SUB
                reg_write = 1;
                alu_op = 3'b001; // SUB
            end
            4'b0010: begin // AND
                reg_write = 1;
                alu_op = 3'b010; // AND
            end
            4'b0011: begin // OR
                reg_write = 1;
                alu_op = 3'b011; // OR
            end
            4'b0100: begin // LOAD
                reg_write  = 1;
                alu_src    = 1; // use immediate
                mem_to_reg = 1; // load from memory
                alu_op     = 3'b000; // ADD for address calculation
            end
            4'b0101: begin // STORE
                mem_write = 1;
                alu_src   = 1; // use immediate
                alu_op    = 3'b000; // ADD for address calculation
            end
            4'b0110: begin // BEQ (branch if equal)
                branch   = 1;
                alu_op   = 3'b001; // SUB for comparison
            end
            default: begin
                // no action (NOP or invalid opcode)
            end
        endcase
    end

endmodule
