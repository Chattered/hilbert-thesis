picture pic1;
currentpicture = pic1;
unitsize(35);

pair A = (0,0);
pair C = (3,0);
pair G = (2,2);

draw(A--C--G--cycle);
dot("$A$",A,W);
dot("$C$",C,E);
dot("$G$",G,N);

pair B = A + 0.4*(C-A);
pair D = midpoint(B--G);
pair E2 = extension(A,D,C,G);

draw(B--G);
draw(A--E2);

dot("$B$",B,S,p=red);
dot("$D$",D,NW);
dot("$E$",E2,NE,p=red);

draw(B--E2,p=dashed+red);
draw(C--D,p=dashed);
dot("$F$",extension(B,E2,C,D),E+E);

label("(a) $F$ is between $B$ and $E$",midpoint(A--C)+(0,-1));

picture pic2;
currentpicture = pic2;
unitsize(35);

draw(A--C--G--cycle);
draw(A--C,p=red+dashed);
dot("$A$",A,W,p=red);
dot("$C$",C,E,p=red);
dot("$G$",G,N);

pair B = A + 0.4*(C-A);
pair D = midpoint(B--G);
pair E2 = extension(A,D,C,G);

draw(B--G);
draw(A--E2);

dot("$B,F$",B,S);
dot("$D$",D,NW);
dot("$E$",E2,NE);

draw(B--E2,p=dashed);

label("(b) $F$ is between $A$ and $C$",midpoint(A--C)+(0,-1));

picture pic3;
currentpicture = pic3;
unitsize(35);

draw(A--C--G--cycle);
dot("$A$",A,W);
dot("$C$",C,E,p=red);
dot("$G$",G,N);

pair B = A + 0.4*(C-A);
pair D = midpoint(B--G);
pair E2 = extension(A,D,C,G);

draw(B--G);
draw(A--E2);

dot("$B$",B,S);
dot("$D$",D,NW,p=red);
dot("$E$",E2,NE);

draw(C--D,p=dashed+red);
draw(B--E2,p=dashed);
dot("$F$",extension(C,D,B,E2),2*E);

add(pic1.fit(),(-9,0));
add(pic2.fit(),(-4.5,0));

label("(c) $F$ is between $C$ and $D$",midpoint(A--C)+(0,-1));

shipout(format="pdf");
