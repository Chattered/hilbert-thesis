picture original;
currentpicture = original;

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

label("(a) Original Diagram",midpoint(B--D)+(0,-1));

picture relabelled;
currentpicture = relabelled;

unitsize(40);

draw(A--B--C--cycle);
dot("$A$",A,N);
dot("$C$",B,W);
dot("$F$",C,S);

draw(C--D);
draw(D--F);

dot("$G$",D,SE);
dot("$E$",E,NE);
dot("$D$",F,NW);

label("(b) Relabelled Diagram",midpoint(B--D)+(0,-1));

add(original.fit(),(-6,0));

shipout(format="pdf");
