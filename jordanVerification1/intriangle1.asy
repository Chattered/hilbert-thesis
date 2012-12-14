unitsize(30);

draw((0,0)--(3,0)--(2,2)--cycle);
draw((3,0)--(5,0));

dot("$A$",(0,0),SW);
dot("$B$",(3,0),S);
dot("$C$",(2,2),N);
dot("$P$",(2,1),W);
dot("$Q$",(5,0),E);

draw((5,0)--(2,1),p=dashed);
dot("$X$",extension((3,0),(2,2),(5,0),(2,1)),NE);

shipout(format="pdf");
