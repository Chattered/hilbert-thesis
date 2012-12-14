import "../labelledPoints" as labelledPoints;
unitsize(60);

LPt[] ps1 = {LPt((0,-1),"$P_1$",SW),
             LPt((0,1),"$P_2$",N),
             LPt((0,-1),"$P_3$",SE)};

LPt[] qs1 = {LPt((-1,0),"$Q_1$",SW),
             LPt((1,0),"$Q_2$",E),
             LPt((-1,0),"$Q_3$",NW)};

drawPoly(pen=red...ps1);
drawPoly(pen=blue...qs1);
dotLPt(...ps1);
dotLPt(...qs1);
dot("$X$",(0,0),SE);

shipout(prefix="jordanDegenerate1",format="pdf");
