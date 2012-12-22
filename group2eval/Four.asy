unitsize(40);

pair A = (0,0);
pair C = (3,0);
pair G = (2,2);

draw(A--C--G--cycle);
dot("$A$",A,W);
dot("$C$",C,E);
dot("$G$",G,N);

pair B = A + 0.4*(C-A);
pair D = midpoint(B--G);
pair E = extension(A,D,C,G);
pair F = extension(C,D,A,G);

draw(B--G);
draw(A--E);
draw(C--F);

dot("$B$",B,S);
dot("$D$",D,SSE+S);
dot("$E$",E,NE);
dot("$F$",F,NW);

shipout(format="pdf");
