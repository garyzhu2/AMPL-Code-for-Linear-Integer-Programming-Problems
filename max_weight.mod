set nodes := {1..12};
set edges := {1..11};
param A{nodes, edges};
param c{edges};
var x{edges} >= 0, integer; # remove integer constraint for LP
maximize w: sum{e in edges} c[e]*x[e];

s.t.
const{j in nodes}: sum{e in edges} A[j,e]*x[e] <= 1