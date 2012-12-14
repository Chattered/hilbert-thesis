import "../labelledPoints" as labelledPoints;
unitsize(50);

LPt[] ps = {LPt((0,0),"$P_1$",SW),
            LPt((1.5,1),"$P$",S),
            LPt((1.5,2),"$Q$",N),
            LPt((0,3),"$P_2$",NW)};

LPt[] qs = {LPt((3,0),"$Q_1$",SE),
            LPt((1.5,1),"$P$",S),
            LPt((1.5,2),"$Q$",N),
            LPt((3,3),"$Q_2$",NE)
            };

fillPoly(pen=lightgreen,ps[0],ps[1],qs[0]);
fillPoly(pen=lightgreen,ps[3],ps[2],qs[3]);
fillPoly(pen=lightgreen+lightblue,qs[0],qs[1],qs[2],qs[3]);

drawPoly(ps[0],ps[1]);
drawPoly(pen=dashed,ps[1],ps[2]);
drawPoly(ps[2],ps[3]);

drawPoly(qs[0],qs[1]);
drawPoly(qs[2],qs[3]);

pair x = (1.5,1.5);

dotLPt(ps[0],ps[1],ps[2],ps[3],qs[0],qs[3]);

path[] p = (1.8,2.8) -- (2,2)--(2.7,1.5)--(2.5,1.2)--(2,0.8)--(1.7,1.3)--(0.5,1)--(0.8,1.2)--(0.4,1.6);
dot("$B$",(0.4,1.6),W);
dot("$A$",(1.8,2.8),W);
pair adash = midpoint((2,0.8)--(1.7,1.3));
dot("$A'$",adash,NE);
draw(p);

label("$p_1$",midpoint(ps[0].pt--ps[1].pt),SE);
label("$p_2$",midpoint(qs[0].pt--qs[1].pt),SW);

shipout(format="pdf");
