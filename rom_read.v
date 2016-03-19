module rom_read(
data,
address,
);

parameter DATAWIDTH = 12;
parameter ADDRWIDTH = 6;
parameter TBLSZ = 1 << ADDRWIDTH;
 
input [ADDRWIDTH-1:0] address;
output [DATAWIDTH-1:0] data;

reg [DATAWIDTH-1:0] data;

always@* begin
  case(address)
    0: data = 12'h001;
    1: data = 12'h002;
    default: data = 12'h000;
  endcase
end
endmodule
