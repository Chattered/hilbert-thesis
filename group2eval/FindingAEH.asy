picture pic1;
currentpicture = pic1;
unitsize(40);

pair A = (0,0);
pair D = (3,0);
pair F = (2,2);

pair B = A+0.4*(D-A);
pair C = A+0.8*(D-A);
pair G = B+0.4*(F-B);
pair E2 = extension(A,G,C,F);
pair H = extension(D,G,C,F);

draw(A--D,p=green);
draw(B--F,p=green);
draw(C--F,p=green);
draw(A--E2,p=green);
draw(D--G,p=green);

draw(A--B--E2--cycle,p=red);
draw(A--B--G--cycle,p=dashed+1);

dot("$A$",A,SW);
dot("$B$",B,S);
dot("$E$",E2,E);
dot("$G$",G,NW);

label("(a) $\triangle ABG$ from $\triangle ABE$",midpoint(A--D)+(0,-1));

picture pic2;
currentpicture = pic2;
unitsize(40);

draw(A--D,p=green);
draw(B--F,p=green);
draw(C--F,p=green);
draw(A--E2,p=green);
draw(D--G,p=green);

draw(A--B--G--cycle,p=red);
draw(A--D--G--cycle,p=dashed+1);

dot("$A$",A,SW);
dot("$B$",B,S);
dot("$D$",D,SE);
dot("$G$",G,NW);

label("(b) $\triangle ADG$ from $\triangle ABG$",midpoint(A--D)+(0,-1));

picture pic3;
currentpicture = pic3;
unitsize(40);

draw(A--D,p=green);
draw(B--F,p=green);
draw(C--F,p=green);
draw(A--E2,p=green);
draw(D--G,p=green);

draw(A--D--G--cycle,p=red);
draw(A--H--G--cycle,p=dashed+1);

dot("$A$",A,SW);
dot("$D$",D,E);
dot("$G$",G,NW);
dot("$H$",H,NE);

label("(c) $\triangle AGH$ from $\triangle ADG$",midpoint(A--D)+(0,-1));

picture pic4;
currentpicture = pic4;
unitsize(40);

draw(A--D,p=green);
draw(B--F,p=green);
draw(C--F,p=green);
draw(A--E2,p=green);
draw(D--G,p=green);

draw(A--H--G--cycle,p=red);
draw(A--E2--H--cycle,p=dashed+1);

dot("$A$",A,SW);
dot("$E$",E2,E);
dot("$G$",G,NW);
dot("$H$",H,NE);

label("(d) $\triangle AEH$ from $\triangle AGH$",midpoint(A--D)+(0,-1));

add(pic3.fit(),(-4,0));
add(pic2.fit(),(0,4));
add(pic1.fit(),(-4,4));

shipout(format="pdf");
