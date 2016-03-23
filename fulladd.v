module fulladd(
  s,
  cout,
  a, 
  b, 
  cin
 );

input   a;
input   b;
input   cin;
output  s;
output  cout;

wire   a;
wire   b;
wire   cin;
wire  s;
wire  cout;

assign s    = a^b^cin; 
assign cout = (a&b) | (b&cin) | (a&cin);

endmodule
