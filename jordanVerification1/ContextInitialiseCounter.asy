unitsize(20);

pair A = (0,0);
pair B = (6,0);
pair C = (0,4);
pair D = (-3,-3);

draw(A--B--C--cycle);
draw(A--B--D--cycle);

pair P1 = midpoint(A--C);
pair P2 = midpoint(A--B);
pair P3 = midpoint(A--D);
draw(P1--P2--P3--cycle,p=currentpen+1);

dot("$A$",A,NE);
dot("$B$",B,E);
dot("$C$",C,NW);
dot("$C'$",D,SW);
dot("$P1$",P1,W);
dot("$P2$",P2,NE);
dot("$P3$",P3,NW);

shipout(format="pdf");
