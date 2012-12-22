unitsize(40);

pair A = (0,0);
pair C = (3,0);
pair F = (2,2);

draw(A--C--F--cycle);
dot("$A$",A,W);
dot("$C$",C,E);
dot("$F$",F,N);

pair G = F + 1.5*(C - F);
pair D = midpoint(A--C);
pair E = extension(D,G,A,F);

draw(C--G);
draw(G--E);

dot("$D$",D,S);
dot("$E$",E,NW);
dot("$G$",G,SE);

shipout(format="pdf");
