set nodes;
set edges;
set s1;
set s2;
set s3;
set s4;
set s5;
set s6;
set s7;
set s8;
set s9;
set s10;
var x{nodes, nodes} >=0, binary;
param c{nodes, nodes};
minimize cost_one_cut: sum{i in nodes, j in nodes} c[i,j]*x[i,j];

subject to

inflow {j in nodes}: sum{i in nodes} x[i,j] = 1;
outflow {i in nodes}: sum{j in nodes} x[i,j] = 1;
cs6: sum{i in s6, j in nodes diff s6} x[i,j] >= 1;
# add back violated cut constraint between {B, H} and {A, C}