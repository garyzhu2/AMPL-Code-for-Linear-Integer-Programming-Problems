set rows := {1..3};
set cols := {1..5};
var y{rows} >= 0;

param A{rows, cols};
param b{rows};
param c{cols};
minimize w: sum{i in rows} b[i] * y[i];

subject to
constraints {j in cols}: sum{i in rows} A[i,j] * y[i] >= c[j];