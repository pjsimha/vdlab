
module booth24f_tb;

// internal ports
reg [23:0] a,b;
wire [23:0] s;

// instantiate booth 24 bit multiplier
booth24f booth1(a, b, s);

initial
begin
  //b = 24'b001001100100111101110110;  a = 24'b010011110010001011010000; //0.5986*1.2365

  //a = 24'b001001011010110101000010 ; b = 24'b001011100111010100100101; //0.5887*0.7259

  a = 24'b010011100100110000101111; b = 24'b011110001000101101000011; //1.2234*1.8834

  //a = 24'b000000000010100011110101; b = 24'b000000100011110101110000 ; //0.0025*0.035

        #30 $display("ans %b\n",s);
	$finish;
         

end

// monitor inputs and outputs
initial
begin
        $monitor($time, " a = %b, b = %b, s = %b\n",a,b,s);
end

endmodule

//1.0986998081207275390625
//1.474999904632568359375



