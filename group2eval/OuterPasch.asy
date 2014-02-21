picture veblen;
currentpicture = veblen;

unitsize(40);

pair A = (0,0);
pair C = (3,0);
pair F = (2,2);

pair G = C + 1.5*(F - C);
pair E = midpoint(A--F);
pair D = extension(A,C,E,G);

draw(A--C--F--cycle,p=red);
dot("$A$",A,W);
dot("$B$",C,SE);
dot("$C$",F,NE);

draw(F--G);
draw(G--D,p=blue);

dot("$D$",G,N);
dot("$E$",E,NW);
dot("$F$",D,S);

label("(a) Veblen's Proof",midpoint(A--C)+(0,-1));

unitsize(40);

picture hilbert;
currentpicture = hilbert;

unitsize(40);

pair A = (0,0);
pair C = (3,0);
pair F = (2,2);

draw(A--C--F--cycle,p=red);
dot("$A$",A,W);
dot("$C$",C,E);
dot("$F$",F,N);

pair G = F + 1.5*(C - F);
pair D = midpoint(A--C);
pair E = extension(D,G,A,F);

draw(C--G);
draw(G--E,p=blue);

dot("$D$",D,S);
dot("$E$",E,NW);
dot("$G$",G,SE);

add(veblen.fit(),(-6,0));
label("(b) Hilbert's Proof",midpoint(A--C)+(0,-1));

shipout(format="pdf");
