// is 32 to 24 even possible ??
module mult32_24(
res_24,
op_valid,
op1_16,
op2_32,
clk
);

parameter IP1WRDLEN = 16;
parameter IP2WRDLEN = 32;
parameter OPWRDLEN = 24;

input [IP1WRDLEN-1:0] op1_16;
input [IP2WRDLEN-1:0] op2_32;
input clk;

output [OPWRDLEN-1:0] res_24;
output op_valid;

//wire [OPWRDLEN-1:0] res_24;
wire [IP1WRDLEN+IP2WRDLEN-1:0] res_t;

// making use of leading 1 i.e ignoring 1.xxxxxx
assign res_t = op1_16*op2_32;
assign res_24 = res_t[45:22];
assign op_valid = 1;
//$display("res_t %b res_24 %b ",res_t,res_24);

endmodule
