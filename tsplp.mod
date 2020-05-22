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
var x{nodes, nodes} >=0; # remove the binary constraint

param c{nodes, nodes};
minimize cost_lp: sum{i in nodes, j in nodes} c[i,j]*x[i,j];

subject to

inflow {j in nodes}: sum{i in nodes} x[i,j] = 1;
outflow {i in nodes}: sum{j in nodes} x[i,j] = 1;
cs1: sum{i in s1, j in nodes diff s1} x[i,j] >= 1;
cs2: sum{i in s2, j in nodes diff s2} x[i,j] >= 1;
cs3: sum{i in s3, j in nodes diff s3} x[i,j] >= 1;
cs4: sum{i in s4, j in nodes diff s4} x[i,j] >= 1;
cs5: sum{i in s5, j in nodes diff s5} x[i,j] >= 1;
cs6: sum{i in s6, j in nodes diff s6} x[i,j] >= 1;
cs7: sum{i in s7, j in nodes diff s7} x[i,j] >= 1;
cs8: sum{i in s8, j in nodes diff s8} x[i,j] >= 1;
cs9: sum{i in s9, j in nodes diff s9} x[i,j] >= 1;
cs10: sum{i in s10, j in nodes diff s10} x[i,j] >= 1;