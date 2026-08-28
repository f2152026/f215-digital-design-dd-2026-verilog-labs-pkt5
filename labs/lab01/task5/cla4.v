module cla4(
  input [3:0] a,
  input [3:0] b,
  input cin,
  output [3:0] sum,
  output cout,
  output P_block,
  output G_block
);
  wire [3:0] p, g;
  wire [4:0] c;

  assign c[0] = cin;
  assign #(2) p = a ^ b;
  assign #(2) g = a & b;
  assign #(2) c[1] = g[0] | (p[0] & cin);
  assign #(2) c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
  assign #(2) c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);
  assign #(2) c[4] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & cin);
  assign #(2) sum = p ^ c[3:0];
  assign cout = c[4];
  assign #(2) P_block = p[3] & p[2] & p[1] & p[0];
  assign #(2) G_block = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]);
endmodule
