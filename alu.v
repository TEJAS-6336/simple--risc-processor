module alu(input [15:0] a,b,input[3:0] alu_ctrl,output reg [15:0] result,output reg carry_out);
always@(*)
begin
       case(alu_ctrl)
       4'b0000:result=a+b;
       4'b0001:result=a-b;
       4'b0010:result=a&b;
       4'b0011:result=a|b;
       4'b0100:result=~a;
       default:result=16'b0;
       endcase
end
endmodule
       
       
