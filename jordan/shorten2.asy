import "../labelledPoints" as labelledPoints;
unitsize(50);

pair[] ps = {(0,0),(1,1),(2,0),(3,1)};

LPt[] ps = {LPt((1,1),"$P$",NW),
            LPt((2,1),"$P_1$",NE),
            LPt((3,0),"$P_2$",E),
            LPt((2,-1),"$P_3$",2*E),
            LPt((3,-2),"$P_4$",E),
            LPt((2,-3),"$P_5$",S),
            LPt((1,-2),"$Q$",SW),
            LPt((2,-2),"$Q_1$",SE),
            LPt((1.5,-1),"$Q_2$",W),
            LPt((2,0),"$Q_3$",SE),
            LPt((2.5,0),"$Q_4$",E),
            LPt((1.5,0.75),"$Q_5$",SW),
            LPt((1,1),"$Q_6$",NW)};

pair p = midpoint(ps[0].pt--ps[6].pt);
dot(p);

draw((0,-0.5)--(0.5,0)--(1.5,0)--(2,0.5)--(2,0.8)--(2.5,0.3));
dot("$A$",(0,-0.5),SW);
dot("$B$",(2.5,0.3),3*NE);

drawPoly(pen=dashed,ps[0],ps[6]);
dotLPt(...ps[0:12]);
drawPoly(...ps);

shipout(format="pdf");
