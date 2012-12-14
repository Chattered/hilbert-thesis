pair[] ps = {(0,0),(2,2),(2.5,3),(-2,3),(-1,4),(6,3),(4,2.5),(3,-0.5),(-1,-2),(0,0)};
pair[] qs = {(1,0),(0,1),(-2,0),(-1,-3),(5,-1),(4,0),(4.5,1),(1,0)};

path pathPairs(pair[] pts) {
  path p;
  for (pair pt:pts) {
    p = p -- pt;
  }
  return p;
}

unitsize(40);
draw(ps[0]--ps[1],p=red);
draw(qs[0]--qs[1],p=blue);
draw(pathPairs(ps[1:]),p=red+dashed);
draw(pathPairs(qs[1:]),p=blue+dashed);

dot("$P_1$",ps[0],NW);
dot("$P_2$",ps[1],SE);
dot("$Q_1$",qs[0],S);
dot("$Q_2$",qs[1],N);


shipout(prefix="Theorem",format="pdf");
