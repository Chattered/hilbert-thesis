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

eye e1;
e1.pos = (0.5,0.5);
e1.target = raycast(e1.pos,(0.5,20),p);
drawEye(e1);

pair[] qs = ps[1:];

eye e2=move1(e1,qs,1,true);
drawEye(e1);
drawEye(e2);

//label("(a)",midpoint((0,0)--(9,0)),6*S);
dot("$P_1$",ps[1],NW);
dot("$P_2$",ps[2],NE);
dot("$P_3$",ps[3],NE);
dot("$X$",e1.pos,NE+NNE);
dot("$X'$",e1.target,N);
dot("$Y$",e2.pos,NE+NNE);
shipout(prefix="Convex1",format="pdf");

picture pic2;
currentpicture = pic2;
unitsize(30);

fill(p--cycle,p=lightgreen);
draw(p);

draw(e1.pos--e2.pos,p=red+1);
e2=move2(e2,qs,1,true);
drawEye(e1,los=false);
drawEye(e2);

//label("(b)",midpoint((0,0)--(9,0)),6*S);
//add(pic2,pic1.fit(),(-12,0));

dot("$P_1$",ps[1],NW);
dot("$P_2$",ps[2],NE);
dot("$P_3$",ps[3],NE);

dot("$Y$",e2.pos,NE+NNE);
dot("$Y'$",e2.target,E);

shipout(prefix="Convex2",format="pdf");
