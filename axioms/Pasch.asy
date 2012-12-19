picture basePicture;
unitsize(40);

pair A = (0,0);
pair B = (3,0);
pair C = (2,2);

draw(A--B--C--cycle);
dot("$A$",A,W);
dot("$B$",B,E);
dot("$C$",C,N);

pair D = (2,0);
pair F1 = B + 0.6*(C - B);
pair F2 = A + 0.6*(C - A);

pair D1 = extension(D,F1,(0,-0.5),(1,-0.5));
pair D2 = extension(D,F2,(0,-0.5),(1,-0.5));
pair E1 = extension(D,F1,(0,2.5),(1,2.5));
pair E2 = extension(D,F2,(0,2.5),(1,2.5));
draw(D1--E1);
draw(D2--E2,p=dashed);

label("$a$",E1,SE);
label("$a$",E2,SW);

dot("$D$",D,SW);
dot("$E$",F1+0.5*(E1-F1),E);
dot("$E$",F2+0.5*(E2-F2),SW);
dot("$F$",F1,ESE);
dot("$F$",F2,W);

shipout(format="pdf");
