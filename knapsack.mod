param n > 0;  
param c{1..n} >=0 ;  
param a{1..n} >=0 ;  
param b >=0 ;  
param ncuts ;  

var x{1..n} >=0, <= 1;  
maximize objective: sum{i in 1..n} c[i]*x[i];  
subject to capacity: sum{i in 1..n} a[i] * x[i] <= b;

subject to branch: x[3] >= 1;
subject to branch2: x[2] <= 0;