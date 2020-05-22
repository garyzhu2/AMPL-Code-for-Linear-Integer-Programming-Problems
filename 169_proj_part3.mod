set I := {1..4};#person
set J := {1..5};#item

#variables 
var x{i in I, j in J}, binary; #1 if item j is given to person i
var p{i in I, k in I}, >=0; # p value for person j
var p_max, >=0;
var c_total{i in I}, >=0;
var cash{i in I}, >=0;

#parameter
param c{i in I, j in J}; #allocation

data;

param 
c :1    2    3    4    5 :=
 1 3000 2000 0.00 0300 0700
 2 1000 2000 1000 0600 0300
 3 1500	0500 1000 1000 0300
 4 0500 1500 0800 2000 0500;

model;

# objective
minimize p: p_max;
#cost:sum{i in I}sum{k in I}p[i,k];
#constraints
subject to 
envy_free: p_max = 0;
all_item_given{j in J}: sum{i in I} x[i,j] = 1;
total_cash: sum{i in I}cash[i] <= 1000;
total_value{i in I}: c_total[i] = sum{j in J}(c[i,j]) + cash[i];
pval{i in I}: p[i,i] = 0;
pval1{i in I,k in I}:p[i,k] >= sum{j in J}(x[k,j]*c[i,j])+ cash[k] - sum{j in J}(x[i,j]*c[i,j])-cash[i];
pmax{i in I, k in I}: p_max >= p[i,k];