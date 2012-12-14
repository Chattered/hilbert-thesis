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
pair[] qs = ps[1:];

eye e2=move1(e1,qs,1);
e2 = move2(e2,qs,1);

drawEye(e2);

eye e3=move1(e2,qs,2,true);
drawEye(e3);

eye e3_;
e3_.pos = e3.target;
e3_.target = ps[3];
drawEye(e3_);

dot("$P_1$",ps[2],NW);
dot("$P_2$",ps[3],W);
dot("$P_3$",ps[4],NE);

dot("$X$",e2.pos,NW+N);
dot("$X'$",e2.target,E);
dot("$Y$",e3.pos,NW+NW);
dot("$Y'$",e3.target,2*SW);
shipout(prefix="Concave1",format="pdf");

picture pic2;
currentpicture = pic2;
unitsize(30);

fill(p--cycle,p=lightgreen);
draw(p);

draw(e2.pos--e3.pos,p=red+1);
drawEye(e3,los=false);

eye e4=move2(e3,qs,2,true);
drawEye(e4);
draw(e3.pos--e4.pos,p=red+1);

//label("(b)",midpoint((0,0)--(9,0)),6*S);
//add(pic2,pic1.fit(),(-12,0));

dot("$P_1$",ps[2],NW);
dot("$P_2$",ps[3],W);
dot("$P_3$",ps[4],NE);

dot("$X$",e2.pos,NW);
dot("$Y$",e3.pos,NW+NW);
dot("$Y'$",e4.pos,SW*3);
dot("$Y''$",e4.target,NE);

shipout(prefix="Concave2",format="pdf");
