unitsize(30);

path pathOfPolyseg(pair[] ps) {
  path polyseg;
  for (pair p:ps) {
    polyseg = polyseg -- p;
  }
  return polyseg;
}

pair[] ps = {(0,1),(0,2),(1,4),(2,4),(3,2),(3,3.5)};
pair[] qs = {(-0.5,3.75),(0.25,4),(2,2.5),(2,1.5),(1.75,1)};

ps.push(extension(ps[1],ps[5],(4,0),(4,1)));
ps.push((4,1));

void base() {
  // dot("$P_1$",ps[1],NW);
  // dot("$P_2$",ps[2],NW);
  // dot("$P_3$",ps[3],N);
  // dot("$P_4$",ps[4],SE);
  // dot("$P_5$",ps[5],NW);
  // dot("$P_6$",ps[6],NE);
  dot("$A$",ps[1],W);
  label("$Ps$",pathOfPolyseg(ps[5:]),E);
  label("$Qs$",pathOfPolyseg(qs[:2]),S);  
}

void addTris(int i,pen triP) {  
  fill(ps[1]--ps[i]--ps[i+1]--cycle,p=triP+opacity(0.5,blend="Luminosity"));
}

void twoTris(int i) {
  addTris(i,red);
  addTris(i+1,blue);
}

//fill(pathOfPolyseg(ps)--cycle,p=green);
twoTris(2);
draw(pathOfPolyseg(ps));
draw(ps[1]--ps[3],p=dashed);
draw(ps[1]--ps[4],p=dashed);
dot("$C$",ps[2],N);
dot("$B$",ps[3],NE);
dot("$C'$",ps[4],SE);
base();
label("(a)",ps[0]--ps[ps.length-1]);
draw(pathOfPolyseg(qs),p=red+1);
dot(intersectionpoints(ps[1]--ps[3],pathOfPolyseg(qs)),p=black+3);
dot("$P$",qs[1],N);
dot("$Q$",qs[2],E);

shipout(prefix="ChangeTriangle1",format="pdf");

picture pic;
currentpicture = pic;
unitsize(30);
twoTris(3);
draw(pathOfPolyseg(ps));
draw(ps[1]--ps[3],p=dashed);
draw(ps[1]--ps[5],p=dashed);
draw(ps[1]--ps[4],p=dashed);
base();
dot("$C$",ps[3],NE);
dot("$B$",ps[4],SE);
dot("$C'$",ps[5],N);
label("(b)",ps[0]--ps[ps.length-1]);
draw(pathOfPolyseg(qs),p=red+1);
dot(intersectionpoints(ps[1]--ps[4],pathOfPolyseg(qs))[0]);
dot("$P$",qs[2],E);
dot("$Q$",qs[3],E);
shipout(prefix="ChangeTriangle2",format="pdf");

picture pic;
currentpicture = pic;
unitsize(30);
twoTris(4);
draw(pathOfPolyseg(ps));
draw(ps[1]--ps[4],p=dashed);
draw(ps[1]--ps[5],p=dashed);
draw(ps[4]--ps[6],p=dashed);
base();
dot("$C$",ps[4],SE);
dot("$B$",ps[5],N);
dot("$B'$/$C'$",ps[6],NE);
label("(c)",ps[0]--ps[ps.length-1]);
draw(pathOfPolyseg(qs),p=red+1);
draw(intersectionpoints(ps[1]--ps[5],pathOfPolyseg(qs)),p=black+3);
dot("$P$",qs[1],N);
dot("$Q$",qs[2],E);
shipout(prefix="ChangeTriangle3",format="pdf");


