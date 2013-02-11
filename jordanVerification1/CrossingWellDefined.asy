picture pic1;
currentpicture = pic1;
unitsize(30);

pair P = (1.7,0.8);
pair Q = (2,0);

pair A = (0,0);
pair B = (3,0);
pair C = (2,2);
pair C2 = (2,-2);

fill(A--B--C--cycle,p=blue+opacity(0.5,blend="Luminosity"));
fill(A--B--C2--cycle,p=red+opacity(0.5,blend="Luminosity"));
draw(A--B--C--cycle);
draw(A--B--C2--cycle);

draw(P--Q,p=dashed);

dot("$A$",A,W);
dot("$B$",B,E);
dot("$C$",C,N);
dot("$C'$",C2,S);
dot("$P_{i+1}$",P,N);
dot("$P_{i}$",Q,S);
dot("$R$",midpoint(P--Q),W);

label("(b)",midpoint(C--B)+(0,2));

picture pic2;
currentpicture = pic2;
unitsize(30);

pair C3 = (-1,2);

fill(A--B--C--cycle,p=blue+opacity(0.5,blend="Luminosity"));
fill(A--B--C3--cycle,p=red+opacity(0.5,blend="Luminosity"));
draw(A--B--C--cycle);
draw(A--B--C3--cycle);

draw(P--Q,p=dashed);

dot("$A$",A,W);
dot("$B$",B,E);
dot("$C$",C,N);
dot("$C'$",C3,N);
dot("$P_{i+1}$",P,N);
dot("$P_{i}$",Q,S);
dot("$R$",midpoint(P--Q),W);

label("(a)",midpoint(C3--B)+(0,2));

add(pic2,pic1.fit(),(7,0));

shipout(format="pdf");
