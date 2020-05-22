set nodes := {1..12};
set edges := {1..11};
param A{nodes, edges};
var x{edges} >= 0, integer; # remove for LP relaxation

maximize z: sum{e in edges} x[e];

subject to
const{j in nodes}: sum{e in edges} A[j,e]*x[e] <= 1