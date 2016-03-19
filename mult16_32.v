module mult16_32(
res,
op_valid,
op1,
op2,
clk
);

parameter IPWRDLEN = 16;
parameter OPWRDLEN = 2*IPWRDLEN;

input [IPWRDLEN-1:0] op1, op2;
input clk;

output [OPWRDLEN-1:0] res;
output op_valid;

always@(posedge clk) begin
// code goes here
end

//temp workaround
assign res = op1*op2;

endmodule
