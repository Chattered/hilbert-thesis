picture p1;
currentpicture = p1;
unitsize(30);

pair A = (0,0);
pair B = (3,0);
pair A2 = A + 0.75*(B - A);
pair C = (2,2);
pair P = (1.5,0.8);
pair Q = extension(A,P,A2,C);

draw(A--B--C--cycle);
axialshade(A--B--C--cycle,lightred+opacity(0.5,blend="Luminosity"),A,darkred+opacity(0.5,blend="Luminosity"),midpoint(B--C));
axialshade(A--A2--C--cycle,lightblue+opacity(0.5,blend="Luminosity"),A,darkblue+opacity(0.5,blend="Luminosity"),midpoint(A2--C));

dot("$A$",A,SW);
dot("$B$",B,S);
dot("$A'$",A2,S);
dot("$C$",C,N);
dot("$P$",P,NW);
dot("$Q$",Q,SE);
draw(A--Q,p=dashed);

draw(A2--C);

shipout(format="pdf");

