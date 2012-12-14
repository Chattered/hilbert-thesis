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

fillPoly(pen=lightgreen,ps[0],ps[1],ps[2],ps[3]);
fillPoly(pen=lightblue,qs[0],qs[1],qs[2],qs[3]);

drawPoly(ps[0],ps[1]);
drawPoly(pen=dashed,ps[1],ps[2]);
drawPoly(ps[2],ps[3]);

drawPoly(qs[0],qs[1]);
drawPoly(qs[2],qs[3]);

pair x = (1.5,1.5);
pair y = (1,1.5);
pair z = (2,1.5);

dotLPt(ps[0],ps[1],ps[2],ps[3],qs[0],qs[3]);

draw(y--z,p=dashed);
dot("$X$",x,NE);
dot("$Y$",y,W);
dot("$Z$",z,E);

label("$p_1$",midpoint(ps[0].pt--ps[1].pt),SE);
label("$p_2$",midpoint(qs[0].pt--qs[1].pt),SW);

shipout(format="pdf");
