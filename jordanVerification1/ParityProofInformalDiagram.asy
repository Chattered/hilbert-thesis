unitsize(30);

path poly1 = (0,0)--(2,2)--(1,2)--(3,4)--(4,3)--(7,4)--(6,1)--(8,0)--(5,0)--(5,2)--cycle;
path poly2 = (2.5,1.5)--(6,3)--(5,4.5)--(8,4.5)--(7,2)--(8.5,2)--(8,-1)--(3,-0.5)--(3,0.5);

draw(poly1);
draw(poly2);
draw((2.5,1.5)--(3,0.5),p=dashed);

dot("$A$",(3,0.5),E);
dot("$B$",(2.5,1.5),W);
dot("$P_1$",(0,0),W);
dot("$P_2$",(5,2),E);
label("$Ps$",poly1,SE);
label("$Qs$",poly2,E);

dot("$X$",intersectionpoints(poly1,(2.5,1.5)--(3,0.5))[0],2*ESE);
dot("$Y$",intersectionpoints(poly1,poly2)[0],2*WNW);

shipout(format="pdf");
