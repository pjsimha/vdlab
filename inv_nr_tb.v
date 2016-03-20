module inv_nr_tb;

reg [15:0] in;
reg clk;

wire [23:0] op;
wire op_v;

inv_nr nr1(op, op_v, in, clk);

initial begin 
  clk = 1'b0;
  forever #5 clk =~clk;
end

initial begin
  #5  in = 16'b0101111001100111;
  $display("in %b op %b \n",in,op);	
  //#50  in = 16'b0101011001100111;
  //$display("in %b op %b \n",in,op);	
  //#50  in = 16'b0100001001100111;
  //$display("in %b op %b \n",in,op);	
  #55 in = 16'b0100011110011001;
  $display("in %b op %b \n",in,op);	
  #10 in = 16'b0101111001111111;
  #10 in = 16'b0110010110000101;
  #10 in = 16'b0100011110011001;
  #60
  $display("in %b op %b \n",in,op);	
  $finish;	
end
endmodule
