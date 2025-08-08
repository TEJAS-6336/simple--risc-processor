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
        $monitor("Time: %0t | clk: %b | reset: %b", $time, clk, reset);
    end

endmodule
