module alu(input [7:0] a,b,input[2:0] alu_ctrl,output reg [7:0] result);
always@(*)
begin
       case(alu_ctrl)
       3'b000:result=a+b;
       3'b001:result=a-b;
       3'b011:result=a&b;
       3'b100:result=a|b;
       3'b101:result=~a;
       default:result=7'b0;
       endcase
end
endmodule
       