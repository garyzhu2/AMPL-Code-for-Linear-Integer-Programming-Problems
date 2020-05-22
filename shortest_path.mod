set VERTICES;

param entr symbolic in VERTICES; # entrance to graph
param exit symbolic in VERTICES; # exit graph

set PATHS within VERTICES cross VERTICES;

param Weight {PATHS} >= 0; # Weights to travel PATHS
var X {(i,j) in PATHS} >= 0; # 1 iff (i,j) in shortest path

minimize Total_Weight: sum {(i,j) in PATHS} Weight[i,j] * X[i,j];

subject to Start: sum {(entr,j) in PATHS} X[entr,j] = 1;

subject to Balance {k in VERTICES diff {entr,exit}}:
	sum {(i,k) in PATHS} X[i,k] = sum {(k,j) in PATHS} X[k,j];

subject to End: sum {(j,exit) in PATHS} X[j,exit] = 1;
	
data;

set VERTICES := s v1 v2 v3 v4 v5 v6 t;

param entr := s;
param exit := t;

param: PATHS: Weight:=
		s v1 4, s v2 3
		v1 v2 1, v2 v1 2
		v1 v3 7, v3 v1 4
		v2 v4 2, v2 v5 4
		v3 v4 2, v3 v6 3
		v5 v3 2, v6 v3 4
		v5 t 12, v6 t 6
		t v6 9, v4 v5 1 ;