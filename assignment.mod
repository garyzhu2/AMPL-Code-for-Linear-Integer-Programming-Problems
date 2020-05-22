set people;
set jobs;
param cost {people,jobs} > 0;
var x {people,jobs} binary;
minimize totalCost: sum {p in people} 
sum {j in jobs} cost[p,j] * x[p,j];

subj to twoJobsPerPerson {p in people}: sum {j in jobs} x[p,j] = 2;
subj to onePersonPerJob {j in jobs}: sum {p in people} x[p,j] = 1;