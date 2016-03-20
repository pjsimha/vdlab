module mult16_32(
res,
op_valid,
op1,
op2,
clk
);

parameter IPWRDLEN = 16;
parameter OPWRDLEN = 2*IPWRDLEN;

input [IPWRDLEN-1:0] op1;
input [IPWRDLEN-1:0] op2; 
input clk;

//wire [OPWRDLEN-1:0] r_res; 
output [OPWRDLEN-1:0] res;
//reg [OPWRDLEN-1:0] res;
//reg [OPWRDLEN-1:0] res;
output op_valid;

//always@(posedge clk) begin
// code goes here
//  res = op1*op2;
//end

//temp workaround
assign res = op1*op2;
//assign res = {r_res[OPWRDLEN-2:0],1'b0};
assign op_valid = 1;
//$display("r_res %b res %b ",r_res,res)

endmodule
