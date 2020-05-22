set VERTICES;

param entr symbolic in VERTICES; # start node is s
param exit symbolic in VERTICES, <> entr; # end node is t

set PATHS within VERTICES cross VERTICES;

param Weight{PATHS} >= 0; # cost per edge
var y{i in VERTICES} >= 0; # y[i] for each node

maximize dual_val:
	y[exit] - y[entr];

subject to 
Weight_limit {(i,j) in PATHS}: y[j] - y[i] <= Weight[i,j];


	
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