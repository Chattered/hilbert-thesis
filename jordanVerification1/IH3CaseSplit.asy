picture pic1;
currentpicture = pic1;
unitsize(30);

pair A = (0,0);
pair B = (3,0);
pair C = (2,2);
pair R = (2,0);
pair P = midpoint(C--R);
pair Q = extension(C,P,(0,-1),(1,-1));

draw(A--B--C--cycle);

dot("$A$",A,SW);
dot("$B$",B,S);
dot("$C$",C,N);
dot("$R$",R,SW);
dot("$$P_i$$",P,N);
dot("$P_{i+1}$",Q,W);
draw(P--Q,p=dashed);
label("(a)",midpoint(A--B)+(0,3));

picture pic2;
currentpicture = pic2;
unitsize(30);

pair A = (0,0);
pair B = (3,0);
pair C = (2,2);
pair R = (2,0);
pair Q = midpoint(C--R);
pair P = extension(C,Q,(0,-1),(1,-1));

draw(A--B--C--cycle);

dot("$A$",A,SW);
dot("$B$",B,S);
dot("$C$",C,N);
dot("$R$",R,SW);
dot("$P_{i+1}$",Q,W);
dot("$$P_i$$",P,S);
draw(C--P,p=dashed);

label("(b)",midpoint(A--B)+(0,3));
shipout(format="pdf");

picture pic3;
currentpicture = pic3;
unitsize(30);

draw(A--B--C--cycle);

pair Q1 = (1.7,0.8);
pair Q2 = (2.3,0.8);
pair S1 = extension(Q1,P,A,C);
pair S2 = extension(Q2,P,B,C);
pair R1 = intersectionpoint(A--B,Q1--P);
pair R2 = intersectionpoint(A--B,Q2--P);
dot("$A$",A,SW);
dot("$B$",B,S);
dot("$C$",C,N);
dot("$R$",R1,SW);
dot("$R$",R2,SE);
dot("$P_{i+1}$",Q1,W);
dot("$P_{i+1}$",Q2,SSE);
dot("$$P_i$$",P,S);
dot("$S$",S1,NW);
dot("$S$",S2,NE);
draw(P--S1,p=dashed);
draw(P--S2,p=dashed);
label("(c)",midpoint(A--B)+(0,3));

add(pic3,pic1.fit(),(-8,0));
add(pic3,pic2.fit(),(-4,0));

shipout(format="pdf");
