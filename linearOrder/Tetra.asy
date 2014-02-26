import three;
import bsp;

unitsize(80);

currentprojection=oblique;

triple p1 = (0,-sqrt(3)/4,2*sqrt(3)/4);
triple p2 = (2*0.5,-sqrt(3)/4,0);
triple p3 = (2*-0.5,-sqrt(3)/4,0);
triple p4 = (0,sqrt(3)/2,0);

path3 side1 = p1--p2--p3--cycle;
path3 side2 = p1--p2--p4--cycle;
path3 side3 = p2--p3--p4--cycle;
path3 side4 = p3--p1--p4--cycle;

real op = 0.4;

face fside1 = side1;
face fside2 = side2;
face fside3 = side3;
face fside4 = side4;

//path3 side1 = (0,-sqrt(3)/4,2*sqrt(3)/4)--(2*0.5,-sqrt(3)/4,0)--(2*-0.5,-sqrt(3)/4,0)--cycle;;

//path3 s1=p1--p2--p3--cycle;
//path3 s2=p1--p2--p4--cycle;
//path3 side1 = shift(0,-sqrt(3)/4,0)*scale3(2)*shift(0,sqrt(3)/4,0)*s1;
//path3 side2 = shift(0,0,0)*scale3(2)*s2;

fside1 = side1;

filldraw(fside1,project(side1),magenta+opacity(op));
filldraw(fside2,project(side2),cyan+opacity(op));
filldraw(fside3,project(side3),blue+opacity(op));
filldraw(fside4,project(side4),red+opacity(op));

dot(L="$p_1$",fside1,project(p1),S);
dot(L="$p_2$",fside1,project(p2),E);
dot(L="$p_3$",fside1,project(p3),W);
dot(L="$p_4$",fside1,project(p4),N);

label(L="$a_1$",fside1,project(midpoint(p1--p2)),SE);
label(L="$a_2$",fside1,project(midpoint(p3--p1)),SW);
label(L="$a_3$",fside1,project(midpoint(p2--p3)),N);
label(L="$a_4$",fside2,project(midpoint(p1--p4)),E);
label(L="$a_5$",fside1,project(midpoint(p2--p4)),E);
label(L="$a_6$",fside1,project(midpoint(p3--p4)),W);

face[] faces;
faces.push(fside1);
faces.push(fside2);
faces.push(fside3);
faces.push(fside4);
add(faces);

shipout(format="pdf");

