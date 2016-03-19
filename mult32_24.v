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

reg [OPWRDLEN-1:0] res_24;
reg [IP1WRDLEN+IP2WRDLEN-1:0] res_t;

always@(posedge clk) begin
res_t = op1_16*op2_32;
res_24 = res_t[47:24];
// code goes here
end

endmodule
