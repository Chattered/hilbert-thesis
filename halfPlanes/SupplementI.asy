unitsize(40);

pair A = (0,0);
pair B = (3,0);
pair C = (2,2);

draw(A--B--C--cycle);
pair Ep = C + 0.5*(C - A);
pair F = midpoint(A--B);
pair D = extension(Ep,F,B,C);
draw(C--Ep,p=dashed);
draw(Ep--F,p=dashed);

dot("$A$",A,SW);
dot("$B$",B,S);
dot("$C$",C,N);
dot("$D$",D,E);
dot("$E$",Ep,NE);
dot("$F$",F,S);

shipout(format="pdf");
