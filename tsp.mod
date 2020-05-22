set N;
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
set s11;
set s12;
set s13;
set s14;
set s15;
set firstCity;

var x{N, N} >= 0, binary;
param cost{N, N};
minimize total_cost: sum {i in N, j in N} cost[i,j] * x[i,j];

subject to


flow {j in N}: sum{i in N} x[i,j] - sum{k in N} x[j,k] = 0;
3Cities: sum {i in N, j in N}  x[i,j] = 3;
city1Start {i in firstCity}: sum {j in N} x[i,j] = 1;
city1End{i in firstCity}: sum {j in N} x[j,i] = 1;
