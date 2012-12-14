path pathOfPolyseg(pair[] ps) {
  path polyseg;
  for (pair p:ps) {
    polyseg = polyseg -- p;
  }
  return polyseg;
}

pair A = (0,0);
pair B = (6,0);
pair C = (4,4);
pair D = (8,4);

pair lastPs(pair[] ps) {
  return ps[ps.length-1];
}

picture p;
currentpicture = p;
unitsize(35);

draw(A--B--C--cycle);

pair[] ps = {A+(-1,2)};
ps.push(extension(ps[0],ps[0]+(1,0),A,C));
ps.push(C);
ps.push(midpoint(B--C));
ps.push(lastPs(ps)+(1,0));
ps.push(B+(1,0));
ps.push(lastPs(ps)+(-1,-1));
ps.push(A+(-1,-1));
ps.push(ps[0]);

label("$A$",A,NW);
label("$B$",B,SE);
label("$C$",C,N);

dot("$P_1$",ps[0],NW);
dot("$P_2$",ps[1],NW);
dot("$P_3$",ps[2],2S+0.25*W);
dot("$P_4$",ps[3],SW);
dot("$P_5$",ps[4],NE);
dot("$P_6$",ps[5],E);
dot("$P_7$",ps[6],S);
dot("$P_8$",ps[7],SW);

label("$\bot$",ps[0]--ps[1],NW);
label("$\bot$",ps[1]--ps[2],2*E);
label("$\bot$",ps[2]--ps[3],W);
label("$\bot$",ps[3]--ps[4],N);
label("$\bot$",ps[4]--ps[5],NE);
label("$\bot$",ps[5]--ps[6],SE);
label("$\bot$",ps[6]--ps[7],S);
label("$\bot$",ps[7]--ps[8],W);

draw(pathOfPolyseg(ps),p=currentpen+1);
label("(a)",ps[7]--ps[4],(0,-30));

picture p1;
currentpicture = p1;
unitsize(35);

draw(B--D--C--cycle);
draw(B--A--ps[1],p=dashed);

label("$A$",A,NW);
label("$B$",B,SE);
label("$C$",C,N);
label("$D$",D,NE);

dot("$P_1$",ps[0],NW);
dot("$P_2$",ps[1],NW);
dot("$P_3$",ps[2],2S+0.25*W);
dot("$P_4$",ps[3],SW);
dot("$P_5$",ps[4],NE);
dot("$P_6$",ps[5],E);
dot("$P_7$",ps[6],S);
dot("$P_8$",ps[7],SW);

label("$\bot$",ps[0]--ps[1],NW);
label("$\bot$",ps[1]--ps[2],2*E);
label("$\bot$",ps[2]--ps[3],W);
label("$\top$",ps[3]--ps[4],N);
label("$\bot$",ps[4]+0.75*(ps[5]-ps[4]),NE);
label("$\bot$",ps[5]--ps[6],SE);
label("$\bot$",ps[6]--ps[7],S);
label("$\bot$",ps[7]--ps[8],W);

draw(pathOfPolyseg(ps),p=currentpen+1);

add(p.fit(),(-10,0));
label("(b)",ps[7]--ps[4],(0,-30));

shipout(format="pdf");
