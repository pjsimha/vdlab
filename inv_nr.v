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
x_in_valid,
clk);

parameter OPWRDLEN = 24;
parameter IPWRDLEN = 16;
parameter ROMWRDLEN = 12;

output [OPWRDLEN-1:0] x_op;
output x_op_valid;

input [IPWRDLEN-1:0] x_in; // format Q1.15 ??
input x_in_valid;
input clk;

reg [OPWRDLEN-1:0] x_op;
reg x_valid;

wire [ROMWRDLEN-1:0] w_rom_op1;
wire [2*IPWRDLEN-1:0] w_mul1_op;
wire [OPWRDLEN-1:0] w_mul2_op;
wire w_mul1_op_valid, w_mul2_op_valid;

reg [IPWRDLEN-1:0] r_rom_op1;
reg [IPWRDLEN-1:0] r_rom_op2;
reg [2*IPWRDLEN-1:0] r_mul1_op;
reg [OPWRDLEN-1:0] mul;

rom_read rom1(rom_op1, x_ip[14:9]);
mult16_32 mul1(w_mul1_op, w_mul1_op_valid, r_rom_op1, x_ip, clk);
mult32_24 mul2(w_mul2_op, w_mul2_op_valid, r_rom_op1, r_mul1_op, clk);
   
// all of the below statements work subjected to the condition 
// that every clk o/p produces o/p.

always@(posedge clk) begin
  r_rom_op2 <= r_rom_op1;
  r_rom_op1 <= {1'b1,rom_op1,3'b0};
  r_mul1_op <= ~(w_mul1_op << 1);
  r_mul2_op <= w_mul2_op << 1;
end
endmodule
