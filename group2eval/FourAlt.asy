unitsize(40);

pair A = (0,0);
pair C = (2,2);
pair B = midpoint(A--C);
pair G = (3,0);

pair D = midpoint(B--G);
pair E2 = extension(A,D,C,G);
pair F = extension(B,E2,C,D);

dot("$A$",A,W);
dot("$B$",B,N);
dot("$C$",C,N);
dot("$D$",D,S);
dot("$E$",E2,E);
dot("$F$",F,NE);
dot("$G$",G,SE);

draw(A--C--G--D--A);
draw(B--E2--D--B);
draw(D--C);

shipout(format="pdf");
