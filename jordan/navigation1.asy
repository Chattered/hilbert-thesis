import three;

unitsize(30);

pair[] ps = {(0,0),
             (1,1),
             (3,2),
             (2,3),
             (4.5,3.5),
             (4.2,1.5),
             (6,1.5),
             (5,0.5),
             (6.5,0.5),
             (7,0)};

pair[] path = {(0,2),
               midpoint(ps[0]--ps[1]),
               extension((0,2),midpoint(ps[0]--ps[1]),(0,0.2),(1,0.2)),
               (2,0.5),
               (2.5,1),
               (1.5,2),
               (3.5,1),
               (4.5,1),
               midpoint(ps[5]--ps[6]),
               extension((4.5,1),midpoint(ps[5]--ps[6]),(0,2),(1,2)),
               (6,2),
               (7,1.5)};

path pathOfPoints(pair[] ps) {
  path path;
  for (pair p : ps) {
    path = path -- p;
  }
  return path;
}

pair extendOut(pair p1, pair p2, pair[] ps, real d) {
  pair v  = p2 - p1;
  pair l  = arclength(p1--p2);
  pair e1 = d*(-v.y,v.x)/l + midpoint(p1--p2);
  pair e2 = (-d)*(-v.y,v.x)/l + midpoint(p1--p2);
  if (inside(pathOfPoints(ps)--cycle,e1)) {
    return e2;
  }
  else return e1;
}

fill(pathOfPoints(ps)--cycle,p=lightgreen);
draw(pathOfPoints(ps));

pair[] outerPts = {};
for (int i=0; i<ps.length-2; ++i) {
  pair e1 = extendOut(ps[i],ps[i+1],ps,0.2);
  pair e2 = extendOut(ps[i+1],ps[i+2],ps,0.2);
  outerPts.push(e1);
  outerPts.push(extension(e1,e1+ps[i+1]-ps[i],e2,e2+ps[i+2]-ps[i+1]));
}

pair start = extension(path[0],path[1],outerPts[0],outerPts[0]+ps[1]-ps[0]);
pair end = extension(path[7],path[8],outerPts[10],outerPts[10]+ps[5]-ps[6]);
draw(start--pathOfPoints(outerPts[1:10])--end,p=dashed);
dot("$A$",path[0],N);
dot("$A'$",path[11],S);
dot("$A_1$",path[1],WNW);
dot("$A_2$",path[8],SSE);

draw(pathOfPoints(path));

//fillPoly(pen=lightgreen,ps[0]...ps);
//drawPoly(...ps);
//drawPoly(...path);
//drawPoly(...pse);

shipout(format="pdf");
