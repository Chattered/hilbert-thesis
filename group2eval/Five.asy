unitsize(40);

pair A = (0,0);
pair D = (3,0);
pair F = (2,2);

pair B = A+0.4*(D-A);
pair C = A+0.8*(D-A);
pair G = B+0.4*(F-B);
pair E2 = extension(A,G,C,F);
pair H = extension(D,G,C,F);

draw(A--D);
draw(B--F);
draw(C--F);
draw(A--E2);
draw(D--G);

dot("$A$",A,SW);
dot("$B$",B,S);
dot("$C$",C,S);
dot("$D$",D,SE);
dot("$E$",E2,E);
dot("$F$",F,N);
dot("$G$",G,NW);
dot("$H$",H,NE);

shipout(format="pdf");
