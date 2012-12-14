unitsize(40);

draw((0,0)--(11,0));

pair[] ps = {(1,1),(2,0),(3,1),(4,-1),(5,0),(6,0),(7,-1),(8,0),(9,0),(10,1)};

path pathOfPolyseg(pair[] ps) {
  path polyseg;
  for (pair p:ps) {
    polyseg = polyseg -- p;
  }
  return polyseg;
}

draw(pathOfPolyseg(ps),p=currentpen+1);
for (pair p : ps) {
  dot(p);
}

dot("$P_1$",ps[0],N);
dot("$P_2$",ps[1],S);
dot("$P_3$",ps[2],N);
dot("$P_4$",ps[3],S);
dot("$P_5$",ps[4],N);
dot("$P_6$",ps[5],N);
dot("$P_7$",ps[6],S);
dot("$P_8$",ps[7],N);
dot("$P_9$",ps[8],S);
dot("$P_{10}$",ps[9],N);

label("$\top$",ps[0]--ps[1]);
label("$\top$",ps[1]--ps[2],NW);
label("$\bot$",ps[2]--ps[3],NE);
label("$\bot$",ps[3]--ps[4],SE);
label("$\bot$",ps[4]--ps[5],S);
label("$\bot$",ps[5]--ps[6],SW);
label("$\bot$",ps[6]--ps[7],SE);
label("$\bot$",ps[7]--ps[8],N);
label("$\top$",ps[8]--ps[9],SE);

dot("$A$",(0,0),W);
dot("$B$",(11,0),E);

shipout(format="pdf");
