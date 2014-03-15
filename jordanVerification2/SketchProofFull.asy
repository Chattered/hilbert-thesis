include "eye.asy";

pair[] ps = {(0,0),
            (0,7),
            (8,7),
            (8,2),
            (9,2),
            (9,1),
            (8,1),
            (8,0),
            (7,0),
            (7,1),
            (6,1),
            (6,2),
            (7,2),
            (7,6),
            (6,6),
            (6,3),
            (5,3),
            (5,0),
            (4,0),
            (4,5),
            (5,5),
            (5,6),
            (1,6),
            (1,5),
            (3,5),
            (3,4),
            (1,4),
            (1,3),
            (3,3),
            (3,0),
            (2,0),
            (2,2),
            (1,2),
            (1,0),
             (0,0)};

path pathOfPolyseg(pair[] ps) {
  path polyseg;
  for (pair p:ps) {
    polyseg = polyseg -- p;
  }
  return polyseg;
}

path p = pathOfPolyseg(ps);

unitsize(40);
fill(p--cycle,p=lightgreen);
draw(p);

eye e;
e.pos = (0.5,0.5);
e.target = raycast(e.pos,(0.5,20),p);
dot(e.target);
drawEye(e,pen=red,los=false);

pair[] qs = ps[1:];
int i=1;
for (int j=0;j<18;++j) {
  //drawEye(e,pen=red);
  pair c = e.pos;
  draw(e.pos--e.target,p=dashed);
  dot(e.target);
  e=move1(e,qs,i,true);
  dot(e.target);
  draw(e.pos--e.target,p=dashed);
  //drawEye(e,pen=red);
  draw(c--e.pos,arrow=MidArrow(size=1.5mm),p=red+1);
  pair c = e.pos;
  e=move2(e,qs,i,true);
  dot(e.target);
  draw(c--e.pos,arrow=MidArrow(size=1.5mm),p=red+1);
  i = next(i,qs);
  if (i == ps.length-1) {
    i = 0;
  }
}       
drawEye(e,pen=red);

eye e;
e.pos = (3.5,3.5);
e.target = raycast(e.pos,(-1,3.5),p);
dot(e.target);
pair[] qs=ps[27:];
qs.append(ps[1:]);
drawEye(e,pen=blue);

int i=0;
for (int j=0;j<27;++j) {
  if (j >= 0) {
    //drawEye(e,pen=blue);
    draw(e.pos--e.target,p=dashed);
    dot(e.target);
    pair c = e.pos;
    e=move1(e,qs,i,true);
    dot(e.target);
    draw(e.pos--e.target,p=dashed);
    //drawEye(e,pen=red);
    draw(c--e.pos,arrow=MidArrow(size=1.5mm),p=blue+1);
    pair c = e.pos;
    e=move2(e,qs,i,true);
    dot(e.target);
    draw(c--e.pos,arrow=MidArrow(size=1.5mm),p=blue+1);
    i = next(i,qs);
    if (i == qs.length-1) {
      i = 0;
    }
  }
  else {
    e=move1(e,qs,i,true);
    e=move2(e,qs,i,true);
    i = next(i,qs);
  }
}
drawEye(e,pen=blue);

eye e3;
e3.pos = e.target+(0.5,-0.5);
e3.target=e.target;
drawEye(e3,pen=black);
dot(e.target);

label("$P_1$",ps[19],NW);
label("$P_2$",ps[20],E);

//draw(e.target+(1,-1)--e.target,arrow=MidArrow(size=1.5mm),p=black+1);
//dot("$P3$",e.target+(1,-1),SW);
//dot(e.target);

shipout(prefix="SketchProofFull",format="pdf");


