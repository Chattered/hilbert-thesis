import "../labelledPoints" as labelledPoints;

picture base;
currentpicture = base;
unitsize(30);

LPt[] quad = {LPt((0,0),"$P_1$",SW),
              LPt((2,1.5),"$P_2$",2S),
              LPt((4,0),"$P_3$",SE),
              LPt((2,4),"$P_4$",N)};

drawPoly(quad[0],quad[1],quad[2],quad[3],quad[0]);
drawPoly(pen=dashed,quad[0],quad[2]);
drawPoly(pen=dashed,quad[1],quad[3]);
dotLPt(quad[0],quad[1],quad[2],quad[3]);

shipout(prefix="quadConcave",format="pdf");

picture base;
currentpicture = base;
unitsize(30);

fillPoly(pen=red, quad[0], quad[2], quad[3]);
drawPoly(quad[0],quad[2],quad[3],quad[0]);
dotLPt(quad[0],quad[2],quad[3]);

shipout(prefix="quadDiff1",format="pdf");

picture base;
currentpicture = base;
unitsize(30);

drawPoly(pen=dashed, quad[0], quad[3], quad[2]);
fillPoly(pen=red, quad[0], quad[1], quad[2],quad[0]);
drawPoly(quad[0], quad[1], quad[2],quad[0]);
dotLPt(quad[0],quad[1],quad[2],quad[3]);

shipout(prefix="quadDiff2",format="pdf");

picture base;
currentpicture = base;
unitsize(30);

fillPoly(pen=red, quad[0], quad[1], quad[2], quad[3]);
drawPoly(quad[0],quad[1],quad[2],quad[3],quad[0]);
dotLPt(quad[0],quad[1],quad[2],quad[3]);

shipout(prefix="quadDiff3",format="pdf");

picture base;
currentpicture = base;
unitsize(30);

fillPoly(pen=red, quad[0], quad[1], quad[3]);
drawPoly(quad[0],quad[1],quad[3],quad[0]);
drawPoly(pen=dashed,quad[1],quad[2],quad[3],quad[1]);
dotLPt(quad[0],quad[1],quad[2],quad[3]);

shipout(prefix="quadUnion1",format="pdf");

picture base;
currentpicture = base;
unitsize(30);

fillPoly(pen=red, quad[1], quad[2], quad[3]);
drawPoly(quad[1],quad[2],quad[3],quad[1]);
drawPoly(pen=dashed,quad[0],quad[1],quad[3],quad[0]);
dotLPt(quad[0],quad[1],quad[2],quad[3]);

shipout(prefix="quadUnion2",format="pdf");

picture base;
currentpicture = base;
unitsize(30);

fillPoly(pen=red, quad[0], quad[1], quad[2], quad[3]);
drawPoly(quad[0],quad[1],quad[2],quad[3],quad[0]);
drawPoly(pen=dashed,quad[1],quad[3]);
dotLPt(quad[0],quad[1],quad[2],quad[3]);

shipout(prefix="quadUnion3",format="pdf");
