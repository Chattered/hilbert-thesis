import three;
import bsp;

unitsize(100);

currentprojection=oblique;

path3 alpha=plane((0,2.5,0),(0,0,2),(0,-1,-1));
path3 beta=rotate(90,Z)*alpha;
path3 gamma=rotate(45,X)*beta;

face falpha = alpha;
face fbeta  = beta;
face fgamma = gamma;

filldraw(falpha,project(alpha),red+opacity(0.5));
filldraw(fbeta,project(beta),blue+opacity(0.5));
filldraw(fgamma,project(gamma),yellow+opacity(0.5));

transform atrans = transform((0,1,0),(0,0,-1));
transform btrans  = transform((1,0,0),(0,0,-1));
transform gtrans = transform((1,0,0),(0,1,-1));

pair A = (0,0);
pair B = btrans*(0.5,0);
pair C = btrans*(-0.5,-0.5);
pair D = btrans*(0,-0.8);
pair E = gtrans*(0.5,0.6);
pair F = atrans*(0.5,0.5);

dot(falpha,"$A$",A,NW);
draw(falpha,(-2,0)--(1.5,0),p=currentpen+2);
draw(falpha,(0,0)--D--F--cycle,p=currentpen+1);
label(falpha,"$a$",A--B);
dot(fbeta,"$C$",C);
dot(fbeta,"$D$",D);
dot(fgamma,"$E$",E);
dot(fgamma,"$F$",F);
label(falpha,"$\alpha$",atrans*(1.2,0.8));
label(fbeta,"$\beta$",btrans*(0.9,0.7));
label(fgamma,"$\gamma$",gtrans*(-0.75,-0.75));
dot(fbeta,"$B$",B,SE);


face[] faces;
faces.push(falpha);
faces.push(fbeta);
faces.push(fgamma);
add(faces);





// path3 p1=plane((0,0,1),(0,1,0));
// triple A=(0,0.5,0.5);
// triple B=(1,0.5,0.5);
// triple C=(1,0.5,1.5);

// dot("$A$",A,E);
// dot("$B$",B,W);
// dot("$C$",C,N);

// triple A2 = A - (1,0,0);
// draw(A2--B--C--A2+(C-B)--A2);

// draw(A--B);

// label("$a$",A--B,N);

// triple D = (0,0.5,0.75);

// dot("$D$",D,E);

// triple EP = (0.5,0.75,0.75);
// dot("$E$",EP,N);
// draw(p1);

// draw(A--B--EP--A+(EP-B)--A);

// triple F = 
// dot("$F$",F,N);

shipout(format="pdf");
