unitsize(40);

pair A = (2,2);
pair B = (0,0);
pair C = (3,0);

draw(A--B--C--cycle);
dot("$A$",A,N);
dot("$B$",B,W);
dot("$C$",C,S);

pair D = B + 1.5*(C-B);
pair E = midpoint(A--C);
pair F = extension(D,E,A,B);

draw(C--D);
draw(D--F);

dot("$D$",D,SE);
dot("$E$",E,NE);
dot("$F$",F,NW);

shipout(format="pdf");
