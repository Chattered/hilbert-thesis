unitsize(30);

pair A = (0,0);
pair B = (3,0);
pair C = (2,2);

pair P1 = A;
pair P2 = C/2;
pair P3 = C/2+0.75*(B-C);
pair P4 = P3+(1,0);
pair P5 = P4+C/2;
pair P6 = P5+0.5*(B-C);
pair P7 = P6-(1,0);
pair P8 = P7+(-3,-2);
// pair P9 = P8+(1.5,0);
// pair P10 = P9+0.25*(C-B);
// pair P11 = P10+(1,0);
// pair P12 = P11+(0,-1);
// pair P13 = P12+(-5,0);

path tri = A--B--C--A;

path pathOfPairs(pair[] Ps) {
  path path;
  for (pair P : Ps) {
    path = path -- P;
  }
  return path--cycle;
}

pair[] ps = {P1,P2,P3,P4,P5,P6,P7,P8};//,P10,P11,P12,P13};

void drawAll(pair[] ps) {
  path pth = pathOfPairs(ps);
  draw(tri);
  dot("$A$",A,NW);
  dot("$B$",B,NE);
  dot("$C$",C,N);

  draw(pth,p=red);
  for (pair p : intersectionpoints(pth,tri)) {
    dot(p,p=blue);
  }
}
  
picture p;
currentpicture = p;
unitsize(30);
drawAll(map(new pair(pair p) {return (p.x-1,p.y+1.25);},ps));
shipout(prefix="crossingDifficult1",format="pdf");

picture p;
currentpicture = p;
unitsize(30);
drawAll(map(new pair(pair p) {return (p.x+1,p.y+1);},ps));
draw(C--(1.5,0),p=dashed);
draw(A--(0.5,1.5)--C,p=dashed);
dot("$A'$",(1.5,0),S);
dot("$B'$",(0.5,1.5),N);
shipout(prefix="crossingDifficult2",format="pdf");

picture p;
currentpicture = p;
unitsize(30);
drawAll(map(new pair(pair p) {return (p.x-1.75,p.y+1.5);},ps));
shipout(prefix="crossingDifficult3",format="pdf");

picture p;
currentpicture = p;
unitsize(30);
drawAll(map(new pair(pair p) {return (p.x-2.75,p.y+2);},ps));
shipout(prefix="crossingDifficult4",format="pdf");
