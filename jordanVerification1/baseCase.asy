picture basePicture;
currentpicture = basePicture;
unitsize(30);

pair PInner  = (1.7,0.8);
pair A = (0,0);
pair B = (3,0);
pair C = (2,2);

draw(A--B--C--cycle);

dot("$A$",(0,0),SW);
dot("$B$",(3,0),S);
dot("$C$",(2,2),N);
dot("$P$",PInner,NE);

pair Q = (6,-1);
dot("$Q$",Q,E);
draw(B--(6.5,0),p=dashed);

draw(Q--PInner,p=dashed);
dot(extension(PInner,Q,B,C));
dot("$R$",extension(PInner,Q,A,B),NE);


shipout(format="pdf");
