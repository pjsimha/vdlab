// behavioral model for a Booth-encoded 24x24 fixed width signed multiplier
// 24-bit output => interpreted as a 24-bit signed number

module booth24f(x, y, p);

input  [23:0] x, y;
//output [47:0] p;
output [23:0] p;

reg [24:0] a, b, c, d , e, f , g , h , i , j , k , l;
reg u0, u1, u2, u3, u4 , u5 , u6 ,  u7 , u8 , u9 , u10 , u11;
reg [11:0] y1;

wire [5:0] sum;
wire [47:0] pp0,pp1,pp2,pp3,pp4,pp5,pp6,pp7,pp8,pp9,pp10,pp11,pp12;
wire a_carry_0, a_carry_1 , a_carry_2 , a_carry_3 , a_carry_4 , a_carry_5;

wire [6:0]   s1;
wire [8:0]   s2;
wire [10:0]  s3;
wire [12:0]  s4;
wire [14:0]  s5;
wire [16:0]  s6;
wire [18:0]  s7;
wire [20:0]  s8;
wire [22:0]  s9;
wire [24:0]  s10;

wire [6:0]   c1;
wire [8:0]   c2;
wire [10:0]  c3;
wire [12:0]  c4;
wire [14:0]  c5;
wire [16:0]  c6;
wire [18:0]  c7;
wire [20:0]  c8;
wire [22:0]  c9;
wire [24:0]  c10;

// perform the booth encoding
always @(x or y) begin

case (y[1:0])
2'b00 : begin a = 25'b000000000000000000000000; u0 = 0; y1[0]=0; end // 0
2'b01 : begin a = {x[23], x[23:0]};  u0 = 0;            y1[0]=1; end // 1
2'b10 : begin a = {~x[23:0], 1'b1}; u0 = 1;             y1[0]=1; end // -2
2'b11 : begin a = {~x[23], ~x[23:0]}; u0 = 1;           y1[0]=1; end // -1
endcase

case (y[3:1])
3'b000 : begin b = 25'b000000000000000000000000; u1 = 0; y1[1] = 0; end // 0
3'b001 : begin b = {x[23], x[23:0]}; u1 = 0;  y1[1] = 1; end // 1
3'b010 : begin b = {x[23], x[23:0]}; u1 = 0; y1[1] = 1; end // 1
3'b011 : begin b = {x[23:0], 1'b0}; u1 = 0; y1[1] = 1; end // 2
3'b100 : begin b = {~x[23:0], 1'b1}; u1 = 1; y1[1] = 1; end // -2
3'b101 : begin b = {~x[23], ~x[23:0]}; u1 = 1; y1[1] = 1; end // -1
3'b110 : begin b = {~x[23], ~x[23:0]}; u1 = 1; y1[1] = 1; end // -1
3'b111 : begin b = 25'b000000000000000000000000; u1 = 0;  y1[1] = 0; end // 0
endcase

case (y[5:3])
3'b000 : begin c = 25'b000000000000000000000000; u2 = 0; y1[2] = 0; end // 0
3'b001 : begin c = {x[23], x[23:0]}; u2 = 0;  y1[2] = 1; end // 1
3'b010 : begin c = {x[23], x[23:0]}; u2 = 0; y1[2] = 1; end // 1
3'b011 : begin c = {x[23:0], 1'b0}; u2 = 0; y1[2] = 1; end // 2
3'b100 : begin c = {~x[23:0], 1'b1}; u2 = 1; y1[2] = 1; end // -2
3'b101 : begin c = {~x[23], ~x[23:0]}; u2 = 1; y1[2] = 1; end // -1
3'b110 : begin c = {~x[23], ~x[23:0]}; u2 = 1; y1[2] = 1; end // -1
3'b111 : begin c = 25'b000000000000000000000000; u2 = 0;  y1[2] = 0; end // 0
endcase

case (y[7:5])
3'b000 : begin d = 25'b000000000000000000000000; u3 = 0; y1[3] = 0; end // 0
3'b001 : begin d = {x[23], x[23:0]}; u3 = 0;  y1[3] = 1; end // 1
3'b010 : begin d = {x[23], x[23:0]}; u3 = 0; y1[3] = 1; end // 1
3'b011 : begin d = {x[23:0], 1'b0}; u3 = 0; y1[3] = 1; end // 2
3'b100 : begin d = {~x[23:0], 1'b1}; u3 = 1; y1[3] = 1; end // -2
3'b101 : begin d = {~x[23], ~x[23:0]}; u3 = 1; y1[3] = 1; end // -1
3'b110 : begin d = {~x[23], ~x[23:0]}; u3 = 1; y1[3] = 1; end // -1
3'b111 : begin d = 25'b000000000000000000000000; u3 = 0;  y1[3] = 0; end // 0
endcase


case (y[9:7])
3'b000 : begin e = 25'b000000000000000000000000; u4 = 0; y1[4] = 0; end // 0
3'b001 : begin e = {x[23], x[23:0]}; u4 = 0;  y1[4] = 1; end // 1
3'b010 : begin e = {x[23], x[23:0]}; u4 = 0; y1[4] = 1; end // 1
3'b011 : begin e = {x[23:0], 1'b0}; u4 = 0; y1[4] = 1; end // 2
3'b100 : begin e = {~x[23:0], 1'b1}; u4 = 1; y1[4] = 1; end // -2
3'b101 : begin e = {~x[23], ~x[23:0]}; u4 = 1; y1[4] = 1; end // -1
3'b110 : begin e = {~x[23], ~x[23:0]}; u4 = 1; y1[4] = 1; end // -1
3'b111 : begin e = 25'b000000000000000000000000; u4 = 0;  y1[4] = 0; end // 0
endcase

case (y[11:9])
3'b000 : begin f = 25'b000000000000000000000000; u5 = 0; y1[5] = 0; end // 0
3'b001 : begin f = {x[23], x[23:0]}; u5 = 0;  y1[5] = 1; end // 1
3'b010 : begin f = {x[23], x[23:0]}; u5 = 0; y1[5] = 1; end // 1
3'b011 : begin f = {x[23:0], 1'b0}; u5 = 0; y1[5] = 1; end // 2
3'b100 : begin f = {~x[23:0], 1'b1}; u5 = 1; y1[5] = 1; end // -2
3'b101 : begin f = {~x[23], ~x[23:0]}; u5 = 1; y1[5] = 1; end // -1
3'b110 : begin f = {~x[23], ~x[23:0]}; u5 = 1; y1[5] = 1; end // -1
3'b111 : begin f = 25'b000000000000000000000000; u5 = 0;  y1[5] = 0; end // 0
endcase

case (y[13:11])
3'b000 : begin g = 25'b000000000000000000000000; u6 = 0; y1[6] = 0; end // 0
3'b001 : begin g = {x[23], x[23:0]}; u6 = 0;  y1[6] = 1; end // 1
3'b010 : begin g = {x[23], x[23:0]}; u6 = 0; y1[6] = 1; end // 1
3'b011 : begin g = {x[23:0], 1'b0}; u6 = 0; y1[6] = 1; end // 2
3'b100 : begin g = {~x[23:0], 1'b1}; u6 = 1; y1[6] = 1; end // -2
3'b101 : begin g = {~x[23], ~x[23:0]}; u6 = 1; y1[6] = 1; end // -1
3'b110 : begin g = {~x[23], ~x[23:0]}; u6 = 1; y1[6] = 1; end // -1
3'b111 : begin g = 25'b000000000000000000000000; u6 = 0;  y1[6] = 0; end // 0
endcase

case (y[15:13])
3'b000 : begin h = 25'b000000000000000000000000; u7 = 0; y1[7] = 0; end // 0
3'b001 : begin h = {x[23], x[23:0]}; u7 = 0;  y1[7] = 1; end // 1
3'b010 : begin h = {x[23], x[23:0]}; u7 = 0; y1[7] = 1; end // 1
3'b011 : begin h = {x[23:0], 1'b0}; u7 = 0; y1[7] = 1; end // 2
3'b100 : begin h = {~x[23:0], 1'b1}; u7 = 1; y1[7] = 1; end // -2
3'b101 : begin h = {~x[23], ~x[23:0]}; u7 = 1; y1[7] = 1; end // -1
3'b110 : begin h = {~x[23], ~x[23:0]}; u7 = 1; y1[7] = 1; end // -1
3'b111 : begin h = 25'b000000000000000000000000; u7 = 0;  y1[7] = 0; end // 0
endcase

case (y[17:15])
3'b000 : begin i = 25'b000000000000000000000000; u8 = 0; y1[8] = 0; end // 0
3'b001 : begin i = {x[23], x[23:0]}; u8 = 0;  y1[8] = 1; end // 1
3'b010 : begin i = {x[23], x[23:0]}; u8 = 0; y1[8] = 1; end // 1
3'b011 : begin i = {x[23:0], 1'b0}; u8 = 0; y1[8] = 1; end // 2
3'b100 : begin i = {~x[23:0], 1'b1}; u8 = 1; y1[8] = 1; end // -2
3'b101 : begin i = {~x[23], ~x[23:0]}; u8 = 1; y1[8] = 1; end // -1
3'b110 : begin i = {~x[23], ~x[23:0]}; u8 = 1; y1[8] = 1; end // -1
3'b111 : begin i = 25'b000000000000000000000000; u8 = 0;  y1[8] = 0; end // 0
endcase

case (y[19:17])
3'b000 : begin j = 25'b000000000000000000000000; u9 = 0; y1[9] = 0; end // 0
3'b001 : begin j = {x[23], x[23:0]}; u9 = 0;  y1[9] = 1; end // 1
3'b010 : begin j = {x[23], x[23:0]}; u9 = 0; y1[9] = 1; end // 1
3'b011 : begin j = {x[23:0], 1'b0}; u9 = 0; y1[9] = 1; end // 2
3'b100 : begin j = {~x[23:0], 1'b1}; u9 = 1; y1[9] = 1; end // -2
3'b101 : begin j = {~x[23], ~x[23:0]}; u9 = 1; y1[9] = 1; end // -1
3'b110 : begin j = {~x[23], ~x[23:0]}; u9 = 1; y1[9] = 1; end // -1
3'b111 : begin j = 25'b000000000000000000000000; u9 = 0;  y1[9] = 0; end // 0
endcase

case (y[21:19])
3'b000 : begin k = 25'b000000000000000000000000; u10 = 0; y1[10] = 0; end // 0
3'b001 : begin k = {x[23], x[23:0]}; u10 = 0;  y1[10] = 1; end // 1
3'b010 : begin k = {x[23], x[23:0]}; u10 = 0; y1[10] = 1; end // 1
3'b011 : begin k = {x[23:0], 1'b0}; u10 = 0; y1[10] = 1; end // 2
3'b100 : begin k = {~x[23:0], 1'b1}; u10 = 1; y1[10] = 1; end // -2
3'b101 : begin k = {~x[23], ~x[23:0]}; u10 = 1; y1[10] = 1; end // -1
3'b110 : begin k = {~x[23], ~x[23:0]}; u10 = 1; y1[10] = 1; end // -1
3'b111 : begin k = 25'b000000000000000000000000; u10 = 0;  y1[10] = 0; end // 0
endcase

case (y[23:21])
3'b000 : begin l = 25'b000000000000000000000000; u11 = 0; y1[11] = 0; end // 0
3'b001 : begin l = {x[23], x[23:0]}; u11 = 0;  y1[11] = 1; end // 1
3'b010 : begin l = {x[23], x[23:0]}; u11 = 0; y1[11] = 1; end // 1
3'b011 : begin l = {x[23:0], 1'b0}; u11 = 0; y1[11] = 1; end // 2
3'b100 : begin l = {~x[23:0], 1'b1}; u11 = 1; y1[11] = 1; end // -2
3'b101 : begin l = {~x[23], ~x[23:0]}; u11 = 1; y1[11] = 1; end // -1
3'b110 : begin l = {~x[23], ~x[23:0]}; u11 = 1; y1[11] = 1; end // -1
3'b111 : begin l = 25'b000000000000000000000000; u11 = 0;  y1[11] = 0; end // 0
endcase
end 

fulladd fa0(sum[0], a_carry_0, y1[0], y1[1], y1[2]);
fulladd fa1(sum[1], a_carry_1, y1[3], y1[4], y1[5]);
fulladd fa2(sum[2], a_carry_2, y1[6], y1[7], y1[8]);
fulladd fa3(sum[3], a_carry_3, y1[9], y1[10], y1[11]);
fulladd fa4(sum[4], a_carry_4, sum[0], sum[1], sum[2]);
fulladd fa5(sum[5], a_carry_5, sum[4], sum[3], 1'b1);

//stage 1
halfadd ha1 (s1 [0], c1 [0],  b  [20], a[22] );
halfadd ha2 (s2 [0], c2 [0],  s1 [0] , c[18] );
fulladd fa6 (s3 [0], c3 [0],  s2 [0] , d[16], e[14]    );
fulladd fa7 (s4 [0], c4 [0],  s3 [0] , f[12], a_carry_0);
fulladd fa8 (s5 [0], c5 [0],  s4 [0] , g[10], a_carry_1);
fulladd fa9 (s6 [0], c6 [0],  s5 [0] , h[8] , a_carry_2);
fulladd fa10(s7 [0], c7 [0],  s6 [0] , i[6] , a_carry_3);
fulladd fa11(s8 [0], c8 [0],  s7 [0] , j[4] , a_carry_4);
fulladd fa12(s9 [0], c9 [0],  s8 [0] , k[2] , a_carry_5);
fulladd fa13(s10[0],c10 [0],  s9 [0] , l[0] , u11      );

//stage2
fulladd fa14 (s1 [1], c1 [1],  a  [23], b [21] , c[19]    );
fulladd fa15 (s2 [1], c2 [1],  s1 [1] , c1 [0] , d[17]    );
fulladd fa16 (s3 [1], c3 [1],  s2 [1] , c2 [0] , e[15]    );
fulladd fa17 (s4 [1], c4 [1],  s3 [1] , c3 [0] , f[13]    );
fulladd fa18 (s5 [1], c5 [1],  s4 [1] , c4 [0] , g[11]    );
fulladd fa19 (s6 [1], c6 [1],  s5 [1] , c5 [0] , h[9]     );
fulladd fa20 (s7 [1], c7 [1],  s6 [1] , c6 [0] , i[7]     );
fulladd fa21 (s8 [1], c8 [1],  s7 [1] , c7 [0] , j[5]     );
fulladd fa22 (s9 [1], c9 [1],  s8 [1] , c8 [0] , k[3]     );
fulladd fa23 (s10[1],c10 [1],  s9 [1] , c9 [0] , l[1]     );

//stage3
fulladd fa24 (s1 [2], c1 [2],  a  [24], b [22] , c[20]    );
fulladd fa25 (s2 [2], c2 [2],  s1 [2] , c1 [1] , d[18]    );
fulladd fa26 (s3 [2], c3 [2],  s2 [2] , c2 [1] , e[16]    );
fulladd fa27 (s4 [2], c4 [2],  s3 [2] , c3 [1] , f[14]    );
fulladd fa28 (s5 [2], c5 [2],  s4 [2] , c4 [1] , g[12]    );
fulladd fa29 (s6 [2], c6 [2],  s5 [2] , c5 [1] , h[10]    );
fulladd fa30 (s7 [2], c7 [2],  s6 [2] , c6 [1] , i[8]     );
fulladd fa31 (s8 [2], c8 [2],  s7 [2] , c7 [1] , j[6]     );
fulladd fa32 (s9 [2], c9 [2],  s8 [2] , c8 [1] , k[4]     );
fulladd fa33 (s10[2],c10 [2],  s9 [2] , c9 [1] , l[2]     );

//stage4
fulladd fa34 (s1 [3], c1 [3],  ~a [24], ~b [23], c[21]    );
fulladd fa35 (s2 [3], c2 [3],  s1 [3] , c1 [2] , d[19]    );
fulladd fa36 (s3 [3], c3 [3],  s2 [3] , c2 [2] , e[17]    );
fulladd fa37 (s4 [3], c4 [3],  s3 [3] , c3 [2] , f[15]    );
fulladd fa38 (s5 [3], c5 [3],  s4 [3] , c4 [2] , g[13]    );
fulladd fa39 (s6 [3], c6 [3],  s5 [3] , c5 [2] , h[11]    );
fulladd fa40 (s7 [3], c7 [3],  s6 [3] , c6 [2] , i[9]     );
fulladd fa41 (s8 [3], c8 [3],  s7 [3] , c7 [2] , j[7]     );
fulladd fa42 (s9 [3], c9 [3],  s8 [3] , c8 [2] , k[5]     );
fulladd fa43 (s10[3],c10 [3],  s9 [3] , c9 [2] , l[3]     );

//stage5
fulladd fa44 (s1 [4], c1 [4],  b  [23], ~b [24], c[22]    );
fulladd fa45 (s2 [4], c2 [4],  s1 [4] , c1 [3] , d[20]    );
fulladd fa46 (s3 [4], c3 [4],  s2 [4] , c2 [3] , e[18]    );
fulladd fa47 (s4 [4], c4 [4],  s3 [4] , c3 [3] , f[16]    );
fulladd fa48 (s5 [4], c5 [4],  s4 [4] , c4 [3] , g[14]    );
fulladd fa49 (s6 [4], c6 [4],  s5 [4] , c5 [3] , h[12]    );
fulladd fa50 (s7 [4], c7 [4],  s6 [4] , c6 [3] , i[10]    );
fulladd fa51 (s8 [4], c8 [4],  s7 [4] , c7 [3] , j[8]     );
fulladd fa52 (s9 [4], c9 [4],  s8 [4] , c8 [3] , k[6]     );
fulladd fa53 (s10[4],c10 [4],  s9 [4] , c9 [3] , l[4]     );

//stage6
halfadd ha3  (s1 [5], c1 [5],  b  [24], ~c [23]           );
fulladd fa54 (s2 [5], c2 [5],  s1 [5] , c1 [4] , d[21]    );
fulladd fa55 (s3 [5], c3 [5],  s2 [5] , c2 [4] , e[19]    );
fulladd fa56 (s4 [5], c4 [5],  s3 [5] , c3 [4] , f[17]    );
fulladd fa57 (s5 [5], c5 [5],  s4 [5] , c4 [4] , g[15]    );
fulladd fa58 (s6 [5], c6 [5],  s5 [5] , c5 [4] , h[13]    );
fulladd fa59 (s7 [5], c7 [5],  s6 [5] , c6 [4] , i[11]    );
fulladd fa60 (s8 [5], c8 [5],  s7 [5] , c7 [4] , j[9]     );
fulladd fa61 (s9 [5], c9 [5],  s8 [5] , c8 [4] , k[7]     );
fulladd fa62 (s10[5],c10 [5],  s9 [5] , c9 [4] , l[5]     );

//stage7
halfadd ha4  (s1 [6], c1 [6],  c  [23], ~c [24]           );
fulladd fa63 (s2 [6], c2 [6],  s1 [6] , c1 [5] , d[22]    );
fulladd fa64 (s3 [6], c3 [6],  s2 [6] , c2 [5] , e[20]    );
fulladd fa65 (s4 [6], c4 [6],  s3 [6] , c3 [5] , f[18]    );
fulladd fa66 (s5 [6], c5 [6],  s4 [6] , c4 [5] , g[16]    );
fulladd fa67 (s6 [6], c6 [6],  s5 [6] , c5 [5] , h[14]    );
fulladd fa68 (s7 [6], c7 [6],  s6 [6] , c6 [5] , i[12]    );
fulladd fa69 (s8 [6], c8 [6],  s7 [6] , c7 [5] , j[10]    );
fulladd fa70 (s9 [6], c9 [6],  s8 [6] , c8 [5] , k[8]     );
fulladd fa71 (s10[6],c10 [6],  s9 [6] , c9 [5] , l[6]     );

//stage8
halfadd ha5  (s2 [7], c2 [7],  c1 [6] , ~d[23]            );
fulladd fa72 (s3 [7], c3 [7],  s2 [7] , c2 [6] , e[21]    );
fulladd fa73 (s4 [7], c4 [7],  s3 [7] , c3 [6] , f[19]    );
fulladd fa74 (s5 [7], c5 [7],  s4 [7] , c4 [6] , g[17]    );
fulladd fa75 (s6 [7], c6 [7],  s5 [7] , c5 [6] , h[15]    );
fulladd fa76 (s7 [7], c7 [7],  s6 [7] , c6 [6] , i[13]    );
fulladd fa77 (s8 [7], c8 [7],  s7 [7] , c7 [6] , j[11]    );
fulladd fa78 (s9 [7], c9 [7],  s8 [7] , c8 [6] , k[9]     );
fulladd fa79 (s10[7],c10 [7],  s9 [7] , c9 [6] , l[7]     );

//stage9
halfadd ha6  (s2 [8], c2 [8],  d [23] , ~d[24]            );
fulladd fa80 (s3 [8], c3 [8],  s2 [8] , c2 [7] , e[22]    );
fulladd fa81 (s4 [8], c4 [8],  s3 [8] , c3 [7] , f[20]    );
fulladd fa82 (s5 [8], c5 [8],  s4 [8] , c4 [7] , g[18]    );
fulladd fa83 (s6 [8], c6 [8],  s5 [8] , c5 [7] , h[16]    );
fulladd fa84 (s7 [8], c7 [8],  s6 [8] , c6 [7] , i[14]    );
fulladd fa85 (s8 [8], c8 [8],  s7 [8] , c7 [7] , j[12]    );
fulladd fa86 (s9 [8], c9 [8],  s8 [8] , c8 [7] , k[10]    );
fulladd fa87 (s10[8],c10 [8],  s9 [8] , c9 [7] , l[8]     );

//stage10
halfadd ha7  (s3 [9], c3 [9],  c2 [8] , ~e[23]            );
fulladd fa88 (s4 [9], c4 [9],  s3 [9] , c3 [8] , f[21]    );
fulladd fa89 (s5 [9], c5 [9],  s4 [9] , c4 [8] , g[19]    );
fulladd fa90 (s6 [9], c6 [9],  s5 [9] , c5 [8] , h[17]    );
fulladd fa91 (s7 [9], c7 [9],  s6 [9] , c6 [8] , i[15]    );
fulladd fa92 (s8 [9], c8 [9],  s7 [9] , c7 [8] , j[13]    );
fulladd fa93 (s9 [9], c9 [9],  s8 [9] , c8 [8] , k[11]    );
fulladd fa94 (s10[9],c10 [9],  s9 [9] , c9 [8] , l[9]     );

//stage11
halfadd ha8  (s3 [10], c3 [10],  e [23]  , ~e[24]            );
fulladd fa95 (s4 [10], c4 [10],  s3 [10] , c3 [9] , f[22]    );
fulladd fa96 (s5 [10], c5 [10],  s4 [10] , c4 [9] , g[20]    );
fulladd fa97 (s6 [10], c6 [10],  s5 [10] , c5 [9] , h[18]    );
fulladd fa98 (s7 [10], c7 [10],  s6 [10] , c6 [9] , i[16]    );
fulladd fa99 (s8 [10], c8 [10],  s7 [10] , c7 [9] , j[14]    );
fulladd fa100(s9 [10], c9 [10],  s8 [10] , c8 [9] , k[12]    );
fulladd fa101(s10[10],c10 [10],  s9 [10] , c9 [9] , l[10]    );

//stage12
halfadd ha9   (s4 [11], c4 [11],  c3 [10] , ~f [23]            );
fulladd fa102 (s5 [11], c5 [11],  s4 [11] , c4 [10] , g[21]    );
fulladd fa103 (s6 [11], c6 [11],  s5 [11] , c5 [10] , h[19]    );
fulladd fa104 (s7 [11], c7 [11],  s6 [11] , c6 [10] , i[17]    );
fulladd fa105 (s8 [11], c8 [11],  s7 [11] , c7 [10] , j[15]    );
fulladd fa106 (s9 [11], c9 [11],  s8 [11] , c8 [10] , k[13]    );
fulladd fa107 (s10[11],c10 [11],  s9 [11] , c9 [10] , l[11]    );

//stage13
halfadd ha10  (s4 [12], c4 [12],  f  [23] , ~f [24]            );
fulladd fa108 (s5 [12], c5 [12],  s4 [12] , c4 [11] , g[22]    );
fulladd fa109 (s6 [12], c6 [12],  s5 [12] , c5 [11] , h[20]    );
fulladd fa110 (s7 [12], c7 [12],  s6 [12] , c6 [11] , i[18]    );
fulladd fa111 (s8 [12], c8 [12],  s7 [12] , c7 [11] , j[16]    );
fulladd fa112 (s9 [12], c9 [12],  s8 [12] , c8 [11] , k[14]    );
fulladd fa113 (s10[12],c10 [12],  s9 [12] , c9 [11] , l[12]    );

//stage14
halfadd ha11  (s5 [13], c5 [13],  c4 [12] , ~g [23]            );
fulladd fa114 (s6 [13], c6 [13],  s5 [13] , c5 [12] , h[21]    );
fulladd fa115 (s7 [13], c7 [13],  s6 [13] , c6 [12] , i[19]    );
fulladd fa116 (s8 [13], c8 [13],  s7 [13] , c7 [12] , j[17]    );
fulladd fa117 (s9 [13], c9 [13],  s8 [13] , c8 [12] , k[15]    );
fulladd fa118 (s10[13],c10 [13],  s9 [13] , c9 [12] , l[13]    );

//stage15
halfadd ha12  (s5 [14], c5 [14],   g [23] , ~g [24]            );
fulladd fa119 (s6 [14], c6 [14],  s5 [14] , c5 [13] , h[22]    );
fulladd fa120 (s7 [14], c7 [14],  s6 [14] , c6 [13] , i[20]    );
fulladd fa121 (s8 [14], c8 [14],  s7 [14] , c7 [13] , j[18]    );
fulladd fa122 (s9 [14], c9 [14],  s8 [14] , c8 [13] , k[16]    );
fulladd fa123 (s10[14],c10 [14],  s9 [14] , c9 [13] , l[14]    );

//stage16
halfadd ha13  (s6 [15], c6 [15],  c5 [14] , ~h[23]             );
fulladd fa124 (s7 [15], c7 [15],  s6 [15] , c6 [14] , i[21]    );
fulladd fa125 (s8 [15], c8 [15],  s7 [15] , c7 [14] , j[19]    );
fulladd fa126 (s9 [15], c9 [15],  s8 [15] , c8 [14] , k[17]    );
fulladd fa127 (s10[15],c10 [15],  s9 [15] , c9 [14] , l[15]    );

//stage17
halfadd ha14  (s6 [16], c6 [16],   h[23] , ~h[24]            );
fulladd fa128 (s7 [16], c7 [16],  s6[16] , c6[15] , i[22]    );
fulladd fa129 (s8 [16], c8 [16],  s7[16] , c7[15] , j[20]    );
fulladd fa130 (s9 [16], c9 [16],  s8[16] , c8[15] , k[18]    );
fulladd fa131 (s10[16],c10 [16],  s9[16] , c9[15] , l[16]    );

//stage18
halfadd ha15  (s7 [17], c7 [17],  c6[16] , ~i[23]    );
fulladd fa132 (s8 [17], c8 [17],  s7[17] , c7[16] , j[21]    );
fulladd fa133 (s9 [17], c9 [17],  s8[17] , c8[16] , k[19]    );
fulladd fa134 (s10[17],c10 [17],  s9[17] , c9[16] , l[17]    );

//stage19
halfadd ha16  (s7 [18], c7 [18],   i[23] , ~i[24]    );
fulladd fa135 (s8 [18], c8 [18],  s7[18] , c7[17] , j[22]    );
fulladd fa136 (s9 [18], c9 [18],  s8[18] , c8[17] , k[20]    );
fulladd fa137 (s10[18],c10 [18],  s9[18] , c9[17] , l[18]    );

//stage20
halfadd ha17  (s8 [19], c8 [19],  c7[18] , ~j[23]    );
fulladd fa138 (s9 [19], c9 [19],  s8[19] , c8[18] , k[21]    );
fulladd fa139 (s10[19],c10 [19],  s9[19] , c9[18] , l[19]    );

//stage21
halfadd ha18  (s8 [20], c8 [20],   j[23] , ~j[24]    );
fulladd fa140 (s9 [20], c9 [20],  s8[20] , c8[19] , k[22]    );
fulladd fa141 (s10[20],c10 [20],  s9[20] , c9[19] , l[20]    );

//stage22
halfadd ha19  (s9 [21], c9 [21],  c8[20] , ~k[23]    );
fulladd fa142 (s10[21],c10 [21],  s9[21] , c9[20] , l[21]    );

//stage23
halfadd ha20  (s9 [22], c9 [22],   k[23] , ~k[24]    );
fulladd fa143 (s10[22],c10 [22],  s9[22] , c9[21] , l[22]    );

//stage24
halfadd ha21 (s10[23],c10 [23],  c9[22] , ~l[23]    );

//stage25
halfadd ha22 (s10[24],c10 [24],  l[23] , ~l[24]    );


assign pp0 = {
a[24],
a[24],
a[24],
a[24],
a[24],
a[24],
a[24],
a[24],
a[24],
a[24],
a[24],
a[24],
a[24],
a[24],
a[24],
a[24],
a[24],
a[24],
a[24],
a[24],
a[24],
a[24],
a[24],
a[24:0]};

assign pp1 = {
b[24],
b[24],
b[24],
b[24],
b[24],
b[24],
b[24],
b[24],
b[24],
b[24],
b[24],
b[24],
b[24],
b[24],
b[24],
b[24],
b[24],
b[24],
b[24],
b[24],
b[24],
b[24:0],
2'b00};

assign pp2 = {
c[24],
c[24],
c[24],
c[24],
c[24],
c[24],
c[24],
c[24],
c[24],
c[24],
c[24],
c[24],
c[24],
c[24],
c[24],
c[24],
c[24],
c[24],
c[24],
c[24:0],
4'b0000
};

assign pp3 = {
d[24],
d[24],
d[24],
d[24],
d[24],
d[24],
d[24],
d[24],
d[24],
d[24],
d[24],
d[24],
d[24],
d[24],
d[24],
d[24],
d[24],
d[24:0],
6'b0
};

assign pp4 = {
e[24],
e[24],
e[24],
e[24],
e[24],
e[24],
e[24],
e[24],
e[24],
e[24],
e[24],
e[24],
e[24],
e[24],
e[24],
e[24:0],
8'b0
};

assign pp5 = {
f[24],
f[24],
f[24],
f[24],
f[24],
f[24],
f[24],
f[24],
f[24],
f[24],
f[24],
f[24],
f[24],
f[24:0],
10'b0
};

assign pp6 ={
g[24],
g[24],
g[24],
g[24],
g[24],
g[24],
g[24],
g[24],
g[24],
g[24],
g[24],
g[24:0],
12'b0
};

assign pp7 ={
h[24],
h[24],
h[24],
h[24],
h[24],
h[24],
h[24],
h[24],
h[24],
h[24:0],
14'b0
};

assign pp8 ={
i[24],
i[24],
i[24],
i[24],
i[24],
i[24],
i[24],
i[24:0],
16'b0
};

assign pp9 ={
j[24],
j[24],
j[24],
j[24],
j[24],
j[24:0],
18'b0
};

assign pp10 ={
k[24],
k[24],
k[24],
k[24:0],
20'b0
};

assign pp11 ={
l[24],
l[24:0],
22'b0
};

assign pp12 = {
25'b0,u11,
1'b0,u10,
1'b0,u9,
1'b0,u8,
1'b0,u7,
1'b0,u6,
1'b0,u5,
1'b0,u4,
1'b0,u3,
1'b0,u2,
1'b0,u1,
1'b0,u0
};

assign p = s10[24:1] + c10[23:0];
//assign p =pp0+pp1+pp2+pp3+pp4+pp5+pp6+pp7+pp8+pp9+pp10+pp11+pp12;

endmodule

//always@(*)
//begin

//fulladd fa0(sum[0], 0, y1[0], y1[1], y1[2]);
//fulladd fa1(sum[1], 0, y1[3], y1[4], y1[5]);
//fulladd fa2(sum[2], 0, y1[6], y1[7], y1[8]);
//fulladd fa3(sum[3], 0, y1[9], y1[10], y1[11]);
//fulladd fa4(sum[4], 0, sum[0], sum[1], sum[2]);
//fulladd fa5(sum[5], 0, sum[4], sum[3], 1'b1);
//
////stage 1
//halfadd ha1 (s1 [0], c1 [0],  b  [20], a[22] );
//halfadd ha2 (s2 [0], c2 [0],  s1 [0] , c[18] );
//fulladd fa6 (s3 [0], c3 [0],  s2 [0] , d[16], e[14]    );
//fulladd fa7 (s4 [0], c4 [0],  s3 [0] , f[12], a_carry_0);
//fulladd fa8 (s5 [0], c5 [0],  s4 [0] , g[10], a_carry_1);
//fulladd fa9 (s6 [0], c6 [0],  s5 [0] , h[8] , a_carry_2);
//fulladd fa10(s7 [0], c7 [0],  s6 [0] , i[6] , a_carry_3);
//fulladd fa11(s8 [0], c8 [0],  s7 [0] , j[4] , a_carry_4);
//fulladd fa12(s9 [0], c9 [0],  s8 [0] , k[2] , a_carry_5);
//fulladd fa13(s10[0],c10 [0],  s9 [0] , l[0] , u11      );
//
////stage2
//fulladd fa14 (s1 [1], c1 [1],  a  [23], b [21] , c[19]    );
//fulladd fa15 (s2 [1], c2 [1],  s1 [1] , c1 [0] , d[17]    );
//fulladd fa16 (s3 [1], c3 [1],  s2 [1] , c2 [0] , e[15]    );
//fulladd fa17 (s4 [1], c4 [1],  s3 [1] , c3 [0] , f[13]    );
//fulladd fa18 (s5 [1], c5 [1],  s4 [1] , c4 [0] , g[11]    );
//fulladd fa19 (s6 [1], c6 [1],  s5 [1] , c5 [0] , h[9]     );
//fulladd fa20 (s7 [1], c7 [1],  s6 [1] , c6 [0] , i[7]     );
//fulladd fa21 (s8 [1], c8 [1],  s7 [1] , c7 [0] , j[5]     );
//fulladd fa22 (s9 [1], c9 [1],  s8 [1] , c8 [0] , k[3]     );
//fulladd fa23 (s10[1],c10 [1],  s9 [1] , c9 [0] , l[1]     );
//
////stage3
//fulladd fa24 (s1 [2], c1 [2],  a  [24], b [22] , c[20]    );
//fulladd fa25 (s2 [2], c2 [2],  s1 [2] , c1 [1] , d[18]    );
//fulladd fa26 (s3 [2], c3 [2],  s2 [2] , c2 [1] , e[16]    );
//fulladd fa27 (s4 [2], c4 [2],  s3 [2] , c3 [1] , f[14]    );
//fulladd fa28 (s5 [2], c5 [2],  s4 [2] , c4 [1] , g[12]    );
//fulladd fa29 (s6 [2], c6 [2],  s5 [2] , c5 [1] , h[10]    );
//fulladd fa30 (s7 [2], c7 [2],  s6 [2] , c6 [1] , i[8]     );
//fulladd fa31 (s8 [2], c8 [2],  s7 [2] , c7 [1] , j[6]     );
//fulladd fa32 (s9 [2], c9 [2],  s8 [2] , c8 [1] , k[4]     );
//fulladd fa33 (s10[2],c10 [2],  s9 [2] , c9 [1] , l[2]     );
//
////stage4
//fulladd fa34 (s1 [3], c1 [3],  ~a [24], ~b [23], c[21]    );
//fulladd fa35 (s2 [3], c2 [3],  s1 [3] , c1 [2] , d[19]    );
//fulladd fa36 (s3 [3], c3 [3],  s2 [3] , c2 [2] , e[17]    );
//fulladd fa37 (s4 [3], c4 [3],  s3 [3] , c3 [2] , f[15]    );
//fulladd fa38 (s5 [3], c5 [3],  s4 [3] , c4 [2] , g[13]    );
//fulladd fa39 (s6 [3], c6 [3],  s5 [3] , c5 [2] , h[11]    );
//fulladd fa40 (s7 [3], c7 [3],  s6 [3] , c6 [2] , i[9]     );
//fulladd fa41 (s8 [3], c8 [3],  s7 [3] , c7 [2] , j[7]     );
//fulladd fa42 (s9 [3], c9 [3],  s8 [3] , c8 [2] , k[5]     );
//fulladd fa43 (s10[3],c10 [3],  s9 [3] , c9 [2] , l[3]     );
//
////stage5
//fulladd fa44 (s1 [4], c1 [4],  b  [23], ~b [24], c[22]    );
//fulladd fa45 (s2 [4], c2 [4],  s1 [4] , c1 [3] , d[20]    );
//fulladd fa46 (s3 [4], c3 [4],  s2 [4] , c2 [3] , e[18]    );
//fulladd fa47 (s4 [4], c4 [4],  s3 [4] , c3 [3] , f[16]    );
//fulladd fa48 (s5 [4], c5 [4],  s4 [4] , c4 [3] , g[14]    );
//fulladd fa49 (s6 [4], c6 [4],  s5 [4] , c5 [3] , h[12]    );
//fulladd fa50 (s7 [4], c7 [4],  s6 [4] , c6 [3] , i[10]    );
//fulladd fa51 (s8 [4], c8 [4],  s7 [4] , c7 [3] , j[8]     );
//fulladd fa52 (s9 [4], c9 [4],  s8 [4] , c8 [3] , k[6]     );
//fulladd fa53 (s10[4],c10 [4],  s9 [4] , c9 [3] , l[4]     );
//
////stage6
//halfadd ha3  (s1 [5], c1 [5],  b  [24], ~c [23]           );
//fulladd fa54 (s2 [5], c2 [5],  s1 [5] , c1 [4] , d[21]    );
//fulladd fa55 (s3 [5], c3 [5],  s2 [5] , c2 [4] , e[19]    );
//fulladd fa56 (s4 [5], c4 [5],  s3 [5] , c3 [4] , f[17]    );
//fulladd fa57 (s5 [5], c5 [5],  s4 [5] , c4 [4] , g[15]    );
//fulladd fa58 (s6 [5], c6 [5],  s5 [5] , c5 [4] , h[13]    );
//fulladd fa59 (s7 [5], c7 [5],  s6 [5] , c6 [4] , i[11]    );
//fulladd fa60 (s8 [5], c8 [5],  s7 [5] , c7 [4] , j[9]     );
//fulladd fa61 (s9 [5], c9 [5],  s8 [5] , c8 [4] , k[7]     );
//fulladd fa62 (s10[5],c10 [5],  s9 [5] , c9 [4] , l[5]     );
//
////stage7
//halfadd ha4  (s1 [6], c1 [6],  c  [23], ~c [24]           );
//fulladd fa63 (s2 [6], c2 [6],  s1 [6] , c1 [5] , d[22]    );
//fulladd fa64 (s3 [6], c3 [6],  s2 [6] , c2 [5] , e[20]    );
//fulladd fa65 (s4 [6], c4 [6],  s3 [6] , c3 [5] , f[18]    );
//fulladd fa66 (s5 [6], c5 [6],  s4 [6] , c4 [5] , g[16]    );
//fulladd fa67 (s6 [6], c6 [6],  s5 [6] , c5 [5] , h[14]    );
//fulladd fa68 (s7 [6], c7 [6],  s6 [6] , c6 [5] , i[12]    );
//fulladd fa69 (s8 [6], c8 [6],  s7 [6] , c7 [5] , j[10]    );
//fulladd fa70 (s9 [6], c9 [6],  s8 [6] , c8 [5] , k[8]     );
//fulladd fa71 (s10[6],c10 [6],  s9 [6] , c9 [5] , l[6]     );
//
////stage8
//halfadd ha5  (s2 [7], c2 [7],  c1 [6] , ~d[23]            );
//fulladd fa72 (s3 [7], c3 [7],  s2 [7] , c2 [6] , e[21]    );
//fulladd fa73 (s4 [7], c4 [7],  s3 [7] , c3 [6] , f[19]    );
//fulladd fa74 (s5 [7], c5 [7],  s4 [7] , c4 [6] , g[17]    );
//fulladd fa75 (s6 [7], c6 [7],  s5 [7] , c5 [6] , h[15]    );
//fulladd fa76 (s7 [7], c7 [7],  s6 [7] , c6 [6] , i[13]    );
//fulladd fa77 (s8 [7], c8 [7],  s7 [7] , c7 [6] , j[11]    );
//fulladd fa78 (s9 [7], c9 [7],  s8 [7] , c8 [6] , k[9]     );
//fulladd fa79 (s10[7],c10 [7],  s9 [7] , c9 [6] , l[7]     );
//
////stage9
//halfadd ha6  (s2 [8], c2 [8],  d [23] , ~d[24]            );
//fulladd fa80 (s3 [8], c3 [8],  s2 [8] , c2 [7] , e[22]    );
//fulladd fa81 (s4 [8], c4 [8],  s3 [8] , c3 [7] , f[20]    );
//fulladd fa82 (s5 [8], c5 [8],  s4 [8] , c4 [7] , g[18]    );
//fulladd fa83 (s6 [8], c6 [8],  s5 [8] , c5 [7] , h[16]    );
//fulladd fa84 (s7 [8], c7 [8],  s6 [8] , c6 [7] , i[14]    );
//fulladd fa85 (s8 [8], c8 [8],  s7 [8] , c7 [7] , j[12]    );
//fulladd fa86 (s9 [8], c9 [8],  s8 [8] , c8 [7] , k[10]    );
//fulladd fa87 (s10[8],c10 [8],  s9 [8] , c9 [7] , l[8]     );
//
////stage10
//halfadd ha7  (s3 [9], c3 [9],  s2 [8] , ~e[23]            );
//fulladd fa88 (s4 [9], c4 [9],  s3 [9] , c3 [8] , f[21]    );
//fulladd fa89 (s5 [9], c5 [9],  s4 [9] , c4 [8] , g[19]    );
//fulladd fa90 (s6 [9], c6 [9],  s5 [9] , c5 [8] , h[17]    );
//fulladd fa91 (s7 [9], c7 [9],  s6 [9] , c6 [8] , i[15]    );
//fulladd fa92 (s8 [9], c8 [9],  s7 [9] , c7 [8] , j[13]    );
//fulladd fa93 (s9 [9], c9 [9],  s8 [9] , c8 [8] , k[11]    );
//fulladd fa94 (s10[9],c10 [9],  s9 [9] , c9 [8] , l[9]     );
//
////stage11
//halfadd ha8  (s3 [10], c3 [10],  e [23]  , ~e[24]            );
//fulladd fa95 (s4 [10], c4 [10],  s3 [10] , c3 [9] , f[22]    );
//fulladd fa96 (s5 [10], c5 [10],  s4 [10] , c4 [9] , g[20]    );
//fulladd fa97 (s6 [10], c6 [10],  s5 [10] , c5 [9] , h[18]    );
//fulladd fa98 (s7 [10], c7 [10],  s6 [10] , c6 [9] , i[16]    );
//fulladd fa99 (s8 [10], c8 [10],  s7 [10] , c7 [9] , j[14]    );
//fulladd fa100(s9 [10], c9 [10],  s8 [10] , c8 [9] , k[12]    );
//fulladd fa101(s10[10],c10 [10],  s9 [10] , c9 [9] , l[10]    );
//
////stage12
//halfadd ha9   (s4 [11], c4 [11],  c3 [10] , ~f [23]            );
//fulladd fa102 (s5 [11], c5 [11],  s4 [11] , c4 [10] , g[21]    );
//fulladd fa103 (s6 [11], c6 [11],  s5 [11] , c5 [10] , h[19]    );
//fulladd fa104 (s7 [11], c7 [11],  s6 [11] , c6 [10] , i[17]    );
//fulladd fa105 (s8 [11], c8 [11],  s7 [11] , c7 [10] , j[15]    );
//fulladd fa106 (s9 [11], c9 [11],  s8 [11] , c8 [10] , k[13]    );
//fulladd fa107 (s10[11],c10 [11],  s9 [11] , c9 [10] , l[11]    );
//
////stage13
//halfadd ha10  (s4 [12], c4 [12],  f  [23] , ~f [24]            );
//fulladd fa108 (s5 [12], c5 [12],  s4 [12] , c4 [11] , g[22]    );
//fulladd fa109 (s6 [12], c6 [12],  s5 [12] , c5 [11] , h[20]    );
//fulladd fa110 (s7 [12], c7 [12],  s6 [12] , c6 [11] , i[18]    );
//fulladd fa111 (s8 [12], c8 [12],  s7 [12] , c7 [11] , j[16]    );
//fulladd fa112 (s9 [12], c9 [12],  s8 [12] , c8 [11] , k[14]    );
//fulladd fa113 (s10[12],c10 [12],  s9 [12] , c9 [11] , l[12]    );
//
////stage14
//halfadd ha11  (s5 [13], c5 [13],  c4 [12] , ~g [23]            );
//fulladd fa114 (s6 [13], c6 [13],  s5 [13] , c5 [12] , h[21]    );
//fulladd fa115 (s7 [13], c7 [13],  s6 [13] , c6 [12] , i[19]    );
//fulladd fa116 (s8 [13], c8 [13],  s7 [13] , c7 [12] , j[17]    );
//fulladd fa117 (s9 [13], c9 [13],  s8 [13] , c8 [12] , k[15]    );
//fulladd fa118 (s10[13],c10 [13],  s9 [13] , c9 [12] , l[13]    );
//
////stage15
//halfadd ha12  (s5 [14], c5 [14],   g [23] , ~g [24]            );
//fulladd fa119 (s6 [14], c6 [14],  s5 [14] , c5 [13] , h[22]    );
//fulladd fa120 (s7 [14], c7 [14],  s6 [14] , c6 [13] , i[20]    );
//fulladd fa121 (s8 [14], c8 [14],  s7 [14] , c7 [13] , j[18]    );
//fulladd fa122 (s9 [14], c9 [14],  s8 [14] , c8 [13] , k[16]    );
//fulladd fa123 (s10[14],c10 [14],  s9 [14] , c9 [13] , l[14]    );
//
////stage16
//halfadd ha13  (s6 [15], c6 [15],  c5 [14] , ~h[23]             );
//fulladd fa124 (s7 [15], c7 [15],  s6 [15] , c6 [14] , i[21]    );
//fulladd fa125 (s8 [15], c8 [15],  s7 [15] , c7 [14] , j[19]    );
//fulladd fa126 (s9 [15], c9 [15],  s8 [15] , c8 [14] , k[17]    );
//fulladd fa127 (s10[15],c10 [15],  s9 [15] , c9 [14] , l[15]    );
//
////stage17
//halfadd ha14  (s6 [16], c6 [16],   h[23] , ~h[24]            );
//fulladd fa128 (s7 [16], c7 [16],  s6[16] , c6[15] , i[22]    );
//fulladd fa129 (s8 [16], c8 [16],  s7[16] , c7[15] , j[20]    );
//fulladd fa130 (s9 [16], c9 [16],  s8[16] , c8[15] , k[18]    );
//fulladd fa131 (s10[16],c10 [16],  s9[16] , c9[15] , l[16]    );
//
////stage18
//halfadd ha15  (s7 [17], c7 [17],  c6[16] , ~i[23]    );
//fulladd fa132 (s8 [17], c8 [17],  s7[17] , c7[16] , j[21]    );
//fulladd fa133 (s9 [17], c9 [17],  s8[17] , c8[16] , k[19]    );
//fulladd fa134 (s10[17],c10 [17],  s9[17] , c9[16] , l[17]    );
//
////stage19
//halfadd ha16  (s7 [18], c7 [18],   i[24] , ~i[24]    );
//fulladd fa135 (s8 [18], c8 [18],  s7[18] , c7[17] , j[22]    );
//fulladd fa136 (s9 [18], c9 [18],  s8[18] , c8[17] , k[20]    );
//fulladd fa137 (s10[18],c10 [18],  s9[18] , c9[17] , l[18]    );
//
////stage20
//halfadd ha17  (s8 [19], c8 [19],  c7[18] , ~j[23]    );
//fulladd fa138 (s9 [19], c9 [19],  s8[19] , c8[18] , k[21]    );
//fulladd fa139 (s10[19],c10 [19],  s9[19] , c9[18] , l[19]    );
//
////stage21
//halfadd ha18  (s8 [20], c8 [20],   j[23] , ~j[24]    );
//fulladd fa140 (s9 [20], c9 [20],  s8[20] , c8[19] , k[22]    );
//fulladd fa141 (s10[20],c10 [20],  s9[20] , c9[19] , l[20]    );
//
////stage22
//halfadd ha19  (s9 [21], c9 [21],  c8[20] , ~k[23]    );
//fulladd fa142 (s10[21],c10 [21],  s9[21] , c9[20] , l[21]    );
//
////stage23
//halfadd ha20  (s9 [22], c9 [22],   k[23] , ~k[24]    );
//fulladd fa143 (s10[22],c10 [22],  s9[22] , c9[21] , l[22]    );
//
////stage24
//halfadd ha21 (s10[23],c10 [23],  c9[22] , ~l[23]    );
//
////stage25
//halfadd ha22 (s10[24],c10 [24],  l[23] , ~l[24]    );

