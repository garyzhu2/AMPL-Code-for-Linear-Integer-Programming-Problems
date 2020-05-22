set S;
set R;

param f{S} >= 0;
param c{S,R} >= 0;

var x{S,R} binary;
var y{S} binary;

minimize cost: sum{i in S} sum{j in R} c[i,j]*x[i,j] + sum{i in S} f[i]*y[i];

subject to supply {j in R}: sum{i in S} x[i,j] = 1;
subject to assign {i in S,j in R}:x[i,j] <= y[i];