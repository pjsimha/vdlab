module rom_read(
data,
address,
);

parameter DATAWIDTH = 15;
parameter ADDRWIDTH = 6;
parameter TBLSZ = 1 << ADDRWIDTH;
 
input [ADDRWIDTH-1:0] address;
output [DATAWIDTH-1:0] data;

reg [DATAWIDTH-1:0] data;

always@(address) begin
  $display("rom read data bin %b dec %d ",address,address);
  case(address)
     0: data =15'h7E06;
     1: data =15'h7A35; 
     2: data =15'h768F; 
     3: data =15'h7312; 
     4: data =15'h6FBD; 
     5: data =15'h6C8B; 
     6: data =15'h697D; 
     7: data =15'h668F; 
     8: data =15'h63BF; 
     9: data =15'h610D; 
    10: data =15'h5E77; 
    11: data =15'h5BFA; 
    12: data =15'h5997; 
    13: data =15'h574B; 
    14: data =15'h5515; 
    15: data =15'h52F5; 
    16: data =15'h50E8; 
    17: data =15'h4EEF; 
    18: data =15'h4D08; 
    19: data =15'h4B33; 
    20: data =15'h496E; 
    21: data =15'h47B9; 
    22: data =15'h4613; 
    23: data =15'h447B; 
    24: data =15'h42F1; 
    25: data =15'h4174; 
    26: data =15'h4004; 
    27: data =15'h3EA0; 
    28: data =15'h3D47; 
    29: data =15'h3BF9; 
    30: data =15'h3AB6; 
    31: data =15'h397D; 
    32: data =15'h384E; 
    33: data =15'h3727; 
    34: data =15'h360A; 
    35: data =15'h34F6; 
    36: data =15'h33E9; 
    37: data =15'h32E5;
    38: data =15'h31E8;
    39: data =15'h30F2;
    40: data =15'h3003;
    41: data =15'h2F1B;
    42: data =15'h2E3A;
    43: data =15'h2D5F;
    44: data =15'h2C8A;
    45: data =15'h2BBA;
    46: data =15'h2AF1;
    47: data =15'h2A2C;
    48: data =15'h296D;
    49: data =15'h28B3;
    50: data =15'h27FE;
    51: data =15'h274E;
    52: data =15'h26A2;
    53: data =15'h25FA;
    54: data =15'h2557;
    55: data =15'h24B7;
    56: data =15'h241C;
    57: data =15'h2384;
    58: data =15'h22F1;
    59: data =15'h2260;
    60: data =15'h21D4;
    61: data =15'h214A;
    62: data =15'h20C4;
    63: data =15'h2041;
    default: data = 15'h0000;
  endcase
end
endmodule
