module pc(input clk,reset,output reg[7:0] pc);
always@(posedge clk)
    begin
    if(reset)
       pc=0;// if reset is high it sets program counter to zero
    else
       pc=pc+1;// if reset is low it increments the program counter
    end
 endmodule