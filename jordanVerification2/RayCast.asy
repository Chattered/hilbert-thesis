include "eye.asy";

unitsize(30);

pair[] ps = {(0,0),(1,1),(3,-1),(3,0),(4,0)};
path pathOfPolyseg(pair[] ps) {
  path polyseg;
  for (pair p:ps) {
    polyseg = polyseg -- p;
  }
  return polyseg;
}

label("$P_1$",ps[0],S);
label("$P_2$",ps[1],N);
label("$P_3$",ps[2],S);
label("$P_4$",ps[3],N);
label("$P_5$",ps[4],S);

draw(pathOfPolyseg(ps));

eye e1;
e1.pos = (-1,0);
e1.target = (0,0);
drawEye(e1);
label("$A$",e1.pos,2*N+W);

eye e2;
e2.pos = (5,0);
e2.target = (4,0);
drawEye(e2);
label("$B$",e2.pos,2*N+E);

eye e3;
e3.pos = (1,-1);
e3.target = (2,0);
drawEye(e3);
label("$C$",e3.pos,3*SW);

dot(ps[1]);
dot(ps[2]);
dot(ps[3]);

for (pair p : intersectionpoints((-1,0)--(9,0), pathOfPolyseg(ps))) {
  if (p == (3,0)) {
    //dot("X",p,N);
  }
  else {
    dot(p,p=red);
  }
}


shipout(format="pdf");
