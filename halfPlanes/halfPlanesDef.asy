unitsize(40);

draw((0,0)--(3,0));

pair A  = (0.5,0.5);
pair A2 = (2,1.25);
pair B  = (2.5,-1.5);

draw(A2--A--B);
dot("$A$",A,W);
dot("$A'$",A2,N);
dot("$B$",B,S);
label("$a$",(3,0),N);

shipout(format="pdf");
