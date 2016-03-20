//
// Newton Raphson method for inversion
// Step 1: Use the first 6 bits after the first 1 as address for ROM.
// Step 2: x_op = x_rom(2-d*x_rom)
// Implementated as: x_rom*(~d*x_rom)
//

module inv_nr(
x_op,
x_op_valid,
x_in,
clk
);

parameter OP1WRDLEN = 32;
parameter OP2WRDLEN = 24;
parameter IPWRDLEN = 16;
parameter ROMWRDLEN = 15;

output [OP2WRDLEN-1:0] x_op;
output x_op_valid;

input [IPWRDLEN-1:0] x_in; // format Q1.15 ??
input clk;

reg [OP2WRDLEN-1:0] x_op;
reg x_valid;

wire [ROMWRDLEN-1:0] w_rom_op1;
wire [2*IPWRDLEN-1:0] w_mul1_op;
//wire [2*IPWRDLEN-1:0] w_inv_op;
wire [OP2WRDLEN-1:0] w_mul2_op;
wire w_mul1_op_valid, w_mul2_op_valid;

reg [IPWRDLEN-1:0] r_x_in; // format Q1.15 ??
reg [IPWRDLEN-1:0] r_rom_op1;
reg [IPWRDLEN-1:0] r_rom_op2;
reg [2*IPWRDLEN-1:0] r_mul1_op;

rom_read rom1(w_rom_op1, x_in[13:8]);
mult16_32 mul1(w_mul1_op, w_mul1_op_valid, r_rom_op1, r_x_in, clk);
mult32_24 mul2(w_mul2_op, w_mul2_op_valid, r_rom_op2, r_mul1_op, clk);
   
// all of the below statements work subjected to the condition 
// that every clk o/p produces o/p.

always@(posedge clk) begin
  r_x_in <= x_in;
  r_rom_op1 <= {1'b1,w_rom_op1};
  r_rom_op2 <= r_rom_op1;
  r_mul1_op <= ~{w_mul1_op[OP1WRDLEN-2:0],1'b0};
  x_op      <=  w_mul2_op;
  //$display("r_rom_op1 %b w_mul1_op %b r_rom_op2 %b r_mul1_op %b x_op %b ",r_rom_op1,w_mul1_op,r_rom_op2,r_mul1_op,x_op);
  $display("r_rom_op1 %h w_mul1_op %h r_rom_op2 %h r_mul1_op %h x_op %h ",r_rom_op1,w_mul1_op,r_rom_op2,r_mul1_op,x_op);
end

endmodule
