unitsize(30);

pair PInner  = (1.7,0.8);
pair A = (0,0);
pair B = (3,0);
pair C = (2,2);
pair X = (2,0);

draw(A--B--C--cycle);

dot("$A$",(0,0),SW);
dot("$B$",(3,0),S);
dot("$C$",(2,2),N);
dot("$X$",X,S);
dot("$P$",PInner,E);

pair Y = extension(X,PInner,A,C);
dot("$Y$",Y,N);

draw(X--Y,p=dashed);

shipout(prefix="inTriangle1",format="pdf");

picture p;
currentpicture = p;
unitsize(30);

draw(A--B--C--cycle);

dot("$A$",(0,0),SW);
dot("$B$",(3,0),S);
dot("$C$",(2,2),N);
dot("$Y$",X,S);

pair Y = PInner;
pair P = midpoint(X--Y);
dot("$X$",Y,N);
dot("$P$",P,E);

draw(X--Y,p=dashed);

shipout(prefix="inTriangle2",format="pdf");

picture p;
currentpicture = p;
unitsize(30);

draw(A--B--C--cycle);

dot("$A$",(0,0),SW);
dot("$B$",(3,0),S);
dot("$C$",(2,2),N);
dot("$X$",X,S);

pair Y = extension(X,PInner,A,C);
dot("$Y$",Y,W);
pair P = extension(X,Y,(0,2.5),(1,2.5));
dot("$P$",P,N);

draw(X--P,p=dashed);

shipout(prefix="outTriangle1",format="pdf");

picture p;
currentpicture = p;
unitsize(30);

draw(A--B--C--cycle);

dot("$A$",(0,0),SW);
dot("$B$",(3,0),S);
dot("$C$",(2,2),N);
dot("$Y$",X,SW);

pair Y = extension(X,PInner,(0,-1),(1,-1));
dot("$P$",Y,E);
dot("$X$",PInner,N);

draw(PInner--Y,p=dashed);

shipout(prefix="outTriangle2",format="pdf");

