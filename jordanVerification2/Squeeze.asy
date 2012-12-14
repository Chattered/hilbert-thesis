include "eye";

picture p;
currentpicture = p;
unitsize(30);

eye e1;
e1.pos = (0.5,7.5);
e1.target = (1,1);
pair newTarget = (8,0);

pair lastPs(pair[] ps) {
  return ps[ps.length - 1];
}

pair[] ps = {e1.pos,e1.pos+(1,0),(1,6.5)};
ps.push(extension(e1.target,newTarget,(2,0),(2,1))+(0,3));
ps.push(lastPs(ps)+(1,0.5));
ps.push(extension(e1.target,newTarget,(4,0),(4,1))+(0,1.5));
ps.push(lastPs(ps)+(1,0));
ps.push(extension(e1.target,newTarget,(6,0),(6,1))+(0,0.5));
ps.push(lastPs(ps)+(1,1));
ps.push(newTarget);
ps.push(e1.target);

fill(pathOfPolyseg(ps),p=lightgreen);
draw(pathOfPolyseg(ps));

squeeze(e1,newTarget,ps,true);
dot(newTarget);

pair s = squeeze(e1,newTarget,ps)[0];
eye e2;
e2.pos = midpoint(s--e1.target);
e2.target = newTarget;

dot("$P_{10},C$",newTarget,S);
dot("$A'$",s,W,p=red);
dot("$P_1,A$",ps[0],NW);
dot("$P_2$",ps[1],NE);
dot("$P_3$",ps[2],SW+S);
dot("$P_4$",ps[3],N+NE);
dot("$P_6$",ps[5],2*W);
dot("$P_8$",ps[7],SW,p=red);
dot("$P_{11},B$",e1.target,S);

label("$A_3$",extension(newTarget,ps[2],e1.pos,e1.target),W);
label("$A_4$",extension(newTarget,ps[3],e1.pos,e1.target),W);
label("$A_6$",extension(newTarget,ps[5],e1.pos,e1.target),W);

shipout(prefix="SqueezeDiagonal",format="pdf");

picture p1;
currentpicture = p1;
unitsize(30);

eye e1;
e1.pos = (0.5,7.5);
e1.target = (1,1);
pair newTarget = (8,0);

pair lastPs(pair[] ps) {
  return ps[ps.length - 1];
}

pair[] ps = {(0,8),(1,8),(1,6.5)};
ps.push(extension(e1.target,newTarget,(2,0),(2,1))+(0,3));
ps.push(lastPs(ps)+(1,0.5));
ps.push(extension(e1.target,newTarget,(4,0),(4,1))+(0,1.5));
ps.push(lastPs(ps)+(1,0));
ps.push(extension(e1.target,newTarget,(6,0),(6,1))+(0,0.5));
ps.push(lastPs(ps)+(1,1));
ps.push(extension(e1.target,newTarget,(8,0),(8,1))+(0,0.5));
ps.push(extension(e1.target,newTarget,(10,0),(10,1)));
ps.push(e1.target);
ps.push(ps[11]+0.1*(ps[11]-ps[10]));

fill(pathOfPolyseg(ps),p=lightgreen);
draw(pathOfPolyseg(ps));
drawEye(e1);

showSqueeze(e1,newTarget,ps);
dot(newTarget);

pair s = squeeze(e1,newTarget,ps)[0];
eye e2;
e2.pos = s+0.25*(e1.target-s);
e2.target = newTarget;
drawEye(e2);

dot("$A$",e1.pos,SW*2);
dot("$C$",newTarget,S);
dot("$A'$",s,W,p=red);
dot("$A''$",e2.pos,SW*2);
dot("$P_1$",ps[0],NW);
dot("$P_2$",ps[1],NE);
dot("$P_3$",ps[2],NE);
dot("$P_4$",ps[3],N+NE);
dot("$P_6$",ps[5],2*W);
dot("$P_8$",ps[7],SW,p=red);
dot("$P_{11}$",ps[10],SE);
dot("$P_{12}$",ps[12],SW);
dot("$B$",e1.target,S);

shipout(prefix="Squeeze1",format="pdf");

picture p2;
currentpicture = p2;
unitsize(30);

pair[] ps = {(0,8),(1,8),(1,6.5)};
ps.push(extension(e1.target,newTarget,(2,0),(2,1))+(0,3));
ps.push(lastPs(ps)+(1,0.5));
ps.push(extension(e1.target,newTarget,(4,0),(4,1))+(0,1.5));
ps.push(lastPs(ps)+(1,0));
ps.push(extension(e1.target,newTarget,(6,0),(6,1))+(0,0.5));
ps.push(lastPs(ps)+(1,1));
ps.push(extension(e1.target,newTarget,(8,0),(8,1))+(0,0.5));
ps.push(extension(e1.target,newTarget,(10,0),(10,1)));
ps.push(e1.target);
ps.push(lastPs(ps)+(-1,-1));

fill(pathOfPolyseg(ps),p=lightgreen);
draw(pathOfPolyseg(ps));
eye e3;
e3.pos = newTarget;
e3.target = e1.target;

dot(newTarget);

showSqueeze(e3,e1.pos,reverse(ps));

eye e4;
e4.pos = e1.pos;
pair[] ss = squeeze(e3,e1.pos,reverse(ps));
e4.target = midpoint(ss[0]--e1.target);
dot("$C$",e1.pos,2*SW);
dot("$A'$",ss[0],S,p=red);
dot("$A$",newTarget,S);
dot("$A''$",e4.target,S);
dot("$P_1$",ps[0],NW);
dot("$P_2$",ps[1],NE);
dot("$P_4$",ps[3],SE+E,p=red);
dot("$P_6$",ps[5],SE*2+E);
dot("$P_8$",ps[7],2*N);
dot("$P_{11}$",ps[10],SE);
dot("$P_{12}$",ps[12],SW);
dot(ps[7]);

drawEye(e4);
dot(e4.target);
draw(e1.pos--e1.target,p=dashed);
dot(e1.target);
draw(newTarget--e1.pos,p=dashed);
dot("$B$",e1.target,S);

//add(p1.fit(),(-12,0));
shipout(prefix="Squeeze2",format="pdf");
