include "eye.asy";

picture pic1;
currentpicture = pic1;
unitsize(30);

pair[] ps = {(0,0),(0,7),(8,7),(8,2),(9,2),(9,1),(8,1),(8,0),(7,0),(7,1),(6,1),(6,2),(7,2),(7,6),
             (6,6),(6,3),(5,3),(5,0),(4,0),(4,5),(5,5),(5,6),(1,6),(1,5),(3,5),(3,4),(1,4),(1,3),
             (3,3),(3,0),(2,0),(2,2),(1,2),(1,0),(0,0)};

path pathOfPolyseg(pair[] ps) {
  path polyseg;
  for (pair p:ps) {
    polyseg = polyseg -- p;
  }
  return polyseg;
}

path p = pathOfPolyseg(ps);

fill(p--cycle,p=lightgreen);
draw(p);

// eye e;
// e.pos = (-1,-1);
// e.target = extension(e.pos,ps[1],ps[1],ps[2]);

// drawEye(e);

// eye e1;
// e1.pos = ps[2];
// e1.target = ps[1];
// pair[] qs = ps[2:];
// qs.append(ps[:1]);

// pair newTarget = squeeze2(e1,e.pos,qs,true);
// dot(newTarget,p=red);
// draw(e.pos--newTarget,p=red+dashed);
// dot(extension(ps[0],ps[1],e.pos,newTarget),p=red);

eye e;
e.pos = (0.25,1);
e.target = extension(e.pos,ps[22],ps[1],ps[2]);

drawEye(e);

eye e1;
e1.pos = ps[21];
e1.target = ps[22];
pair[] qs = ps[22:];
qs.append(ps[:21]);
qs = reverse(qs);
pair newTarget = squeeze2(e1,e.pos,qs,true);
dot("$Y$",newTarget,p=red,NE);
draw(e.pos--newTarget,p=red+dashed);
dot("$Y'$",extension(ps[22],ps[23],e.pos,newTarget),p=red,W);
dot("$X'$",e.target,N);
dot("$X''$",ps[22],NW);
dot("$P_1$",ps[21],NE);
dot("$P_3$",ps[23],2*W);
label("$X$",e.pos,SE);

shipout(prefix="SightToWall",format="pdf");
