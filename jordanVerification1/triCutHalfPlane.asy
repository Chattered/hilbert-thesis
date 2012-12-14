unitsize(30);

pair A = (0,0);
pair B = (3,0);
pair C = (2,2);
pair Q = (2.5,4);

draw(A--B--C--cycle);

dot("$A$",(0,0),SW);
dot("$B$",(3,0),S);
dot("$C$",(2,2),0.5*NW);
dot("$Q$",Q,N);

pair P1 = extension(Q,C,A,B);
pair P2 = midpoint(P1--B);
pair P3 = (0.5,0);

draw(P1--Q,p=dashed);
draw(P2--Q,p=dashed);
draw(P3--Q,p=dashed);

dot("$X$",extension(Q,P3,A,C),NW);
dot("$X$",extension(Q,P2,B,C),E);

dot("$P$",P1,S);
dot("$P$",P2,S);
dot("$P$",P3,S);

shipout(format="pdf");
