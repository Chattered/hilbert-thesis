import "../labelledPoints" as labelledPoints;
unitsize(50);

pair[] ps = {(0,0),(1,1),(2,0),(3,1)};

LPt[] ps = {LPt((1,1),"$Q$",N),
            LPt((2,1),"$Q_1$",NE),
            LPt((3,0),"$Q_2$",E),
            LPt((2,-1),"$Q_3$",E),
            LPt((3,-2),"$Q_4$",E),
            LPt((2,-3),"$Q_5$",S),
            LPt((1,-2),"$P$",SW),
            LPt((-1,-2),"$P_1$",SW),
            LPt((0,-1),"$P_2$",E),
            LPt((-1,-1),"$P_3$",SW),
            LPt((-1,0),"$P_4$",NW),
            LPt((0,0),"$P_5$",NW),
            LPt((1,1),"$Q$",NE)};

pair p = midpoint(ps[0].pt--ps[6].pt);
dot(p);
dot("$X$",p,NE);
dot("$Y$",p-(0.5,0),W);
dot("$Z$",p+(0.5,0),E);
draw(p--p+(0.5,0),p=dashed);
draw(p--p+(-0.5,0),p=dashed);

draw((0,-0.5)--(0.5,0)--(1.5,0)--(2,0.5)--(2,0.8)--(2.5,0.3));
dot("$A$",(0,-0.5),SW);
dot("$B$",(2.5,0.3),3*NE);

dot("$A'$",midpoint((0.8,0)--(1.5,0)),NE);
draw(midpoint((0.8,0)--(1.5,0))--p+(0.5,0),p=dashed);

drawPoly(pen=dashed,ps[0],ps[6]);
dotLPt(...ps[0:12]);
drawPoly(...ps);

shipout(format="pdf");
