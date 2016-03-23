module halfadd(
  s,
  cout,
  a, 
  b 
 );

input   a;
input   b;
output  s;
output  cout;

wire  a;
wire  b;
wire  s;
wire  cout;

assign s    = a^b; 
assign cout = (a&b) ;

endmodule
