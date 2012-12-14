picture p1;
currentpicture = p1;
unitsize(30);

pair A = (0,0);
pair B = (3,0);
pair C = (2,2);
pair P = (2,0.8);

draw(A--B--C--cycle);

dot("$A$",A,SW);
dot("$B$",B,S);
dot("$C$",C,N);
dot("$P$",P,NW);

pair X = midpoint(A--B);
dot("$X$",X,S);
pair Y = extension(X,P,B,C);
dot("$Y$",Y,NE);
draw(X--Y,p=dashed);
pair Z = extension(A,P,B,C);
draw(A--Z,p=dashed);
dot("$Z$",Z,E);

label("(a)",midpoint(A--B)+(0,-1));

picture p2;
currentpicture = p2;
unitsize(30);

draw(A--B--C--cycle);

pair P = (1.5,0.8);
dot("$A$",A,SW);
dot("$B$",B,S);
dot("$C$",C,N);
dot("$P$",P,NW);
dot("$X$",X,S);

pair Y = extension(X,P,A,C);
draw(X--Y,p=dashed);
dot("$Y$",Y,N);

draw(X--C,p=dashed);
pair P2 = extension(A,P,X,C);
dot("$P'$",P2,SE);
draw(A--P2,p=dashed);

pair Z = extension(A,P,B,C);
draw(P2--Z,p=dashed);

dot("$Z$",Z,E);

label("(b)",midpoint(A--B)+(0,-1));

add(p2,p1.fit(),(-4,0));

shipout(format="pdf");

