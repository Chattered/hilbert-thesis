include "eye.asy";

unitsize(30);

pair p1=(-2,0);
pair p2=(0,2);
pair p3=(2,0);
pair p4=(0,-2);

fill(p1--p2--p3--p4--cycle,p=lightgreen);
draw(p1--p2--p3--p4--cycle);

eye e;
e.pos=(0,0);
e.target=midpoint(p2--p3);
drawEye(e,pen=blue+opacity(0.5));

e.target=midpoint(p3--p4);
drawEye(e,pen=green+opacity(0.5));

e.target=midpoint(p4--p1);
drawEye(e,pen=red+opacity(0.5));

e.target=midpoint(p1--p2);
drawEye(e);

dot("$P_1$",p1,W);
dot("$P_2$",p2,N);
dot("$P_3$",p3,E);
dot("$P_4$",p4,S);

shipout(format="pdf");
