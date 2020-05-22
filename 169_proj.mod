set I := {1..10};#person
set J := {1..3};#item


#variables 
var x{i in I, j in J}, binary; #1 if item j is given to person i
var p{i in I, k in I}, >=0; # p value for person j
var p_max, >=0;
var y{j in J}, binary;#to free up an item

#parameter
param c{i in I, j in J};#allocation

data;

param							
c:		1		2		3	:=
1		0.3043881819		0.3077417158		0.3878701024	
2		0.5023808446		0.3733288223		0.1242903332	
3		0.1605863348		0.303141059		0.5362726062	
4		0.4939369925		0.2804931331		0.2255698744	
5		0.3833571634		0.120073041		0.4965697957	
6		0.2549187298		0.6118113318		0.1332699384	
7		0.09689884008		0.5082819661		0.3948191938	
8		0.3024121571		0.2447318523		0.4528559906	
9		0.188193842		0.1576957284		0.6541104296	
10		0.2246037553		0.4645102268		0.310886018	;
model;
# objective
minimize cost:p_max;
#constraints
subject to 
all_item_given{j in J}: sum{i in I} x[i,j] = 1;
pval{i in I}: p[i,i] = 0;
pval1{i in I,k in I}:p[i,k] >= sum{j in J}(x[k,j]-y[j])*c[i,j] - sum{j in J}x[i,j]*c[i,j];
pmax{i in I, k in I}: p_max >= p[i,k];
free_up: sum{j in J}y[j] = 1;#set zero for free 0 item