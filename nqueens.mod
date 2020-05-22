set rows := {1..8};
set cols := {1..8};
var X{rows, cols} binary; 

maximize no: 0;

subject to 
numQueens: sum {i in rows, j in cols} X[i,j] = 8;
difCol {j in cols}: sum {i in rows} X[i,j] = 1;
difRow {i in rows}: sum {j in cols} X[i,j] = 1;
difDiag1 {k in 2..16}: sum {i in rows, j in cols: i+j = k} X[i,j] <= 1;
difDiag2 {k in -7..7}: sum {i in rows, j in cols: i-j = k} X[i,j] <= 1;