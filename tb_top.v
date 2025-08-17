`timescale 1ns / 1ps

module cpu_tb;

    reg clk;
    reg reset;

    // Instantiate the CPU
    cpu_top uut (
        .clk(clk),
        .reset(reset)
    );

    // Clock generation: 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        $display("Starting CPU Simulation...");
        reset = 1;
        #10;
        reset = 0;

        // Run for 100 clock cycles
        #1000;
        $finish;
    end

    // Monitor PC and some debug info (optional)
   initial begin
    $monitor("Time=%0t | PC=%d | R1=%d | R2=%d | R3=%d",
             $time,
             uut.pc_val,
             uut.reg_file.regs[1],
             uut.reg_file.regs[2],
             uut.reg_file.regs[3]);
end


endmodule

