set rows := {1..3};
set cols := {1..5};
var x{cols} >= 0;

param A{rows, cols};
param b{rows};
param c{cols};
maximize z: sum{j in cols} c[j] * x[j];

subject to
constraints {i in rows}: sum{j in cols} A[i,j] * x[j] <= b[i];