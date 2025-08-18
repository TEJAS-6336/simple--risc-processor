`timescale 1ns/1ps

module cpu_top_tb;
    reg clk;
    reg reset;

    cpu_top uut (
        .clk(clk),
        .reset(reset)
    );

    // clock gen
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        #10 reset = 0;    // release reset

        #200 $finish;
    end

    initial begin
        $monitor("T=%0t | PC=%d | Instr=%h | ALU result=%h | R1=%h | R2=%h",
                  $time, uut.pc_val, uut.dbg_instr, uut.dbg_result,
                  uut.dbg_read1, uut.dbg_read2);
    end
endmodule


