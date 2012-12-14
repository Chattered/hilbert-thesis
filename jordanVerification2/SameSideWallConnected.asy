include "eye";

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
e1.pos = (2.5,5.5);
e1.target = ps[19]+(ps[18]-ps[19])*0.1;

drawEye(e1);

eye e2;
e2.pos = (-2,-1.5);
e2.target = ps[18]+(ps[19]-ps[18])*0.02;

drawEye(e2);

dot("$P_1$",ps[18],SE);
dot("$P_2$",ps[19],N);

eye e3;
pair[] qs = ps[19:];
qs.append(ps[:18]);
e3.pos = squeeze2(e2,e1.target,ps,true);
e3.target = e1.target;
drawEye(e3);

dot("$X$",e2.pos,SW*2+S);
dot("$Y$",e1.pos,NE*2);
dot("$X'$",e2.target,NE);
dot("$Y'$",e1.target,E);
dot("$X''$",e3.pos,3*S);

//shipout(prefix="SameSideWallConnected1",format="pdf");
label("(a)",midpoint(e2.pos--(9,0)),10*S);

picture pic2;
currentpicture = pic2;
unitsize(30);

fill(p--cycle,p=lightgreen);
draw(p);

drawEye(e1);
drawEye(e2,false);
drawEye(e3,false);

dot("$P_1$",ps[18],SE);
dot("$P_2$",ps[19],N);

dot("$X$",e2.pos,SW*2+S);
dot("$Y$",e1.pos,NE*2);
dot("$Y'$",e1.target,E);
label("$X''$",e3.pos,3*S);

eye e4;
e4.pos = squeeze2(e3,e1.pos,ps,true);

draw(e2.pos--e3.pos--e4.pos--e1.pos,p=red+1);
dot("$X'''$",e4.pos,SE,p=red);

label("(b)",midpoint(e2.pos--(9,0)),10*S);

add(pic2,pic1.fit(),(-10,0));

shipout(prefix="SameSideWallConnected1",format="pdf");
