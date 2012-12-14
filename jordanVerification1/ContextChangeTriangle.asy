unitsize(35);

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

draw(A--B--C--cycle);

pair lastPs(pair[] ps) {
  return ps[ps.length-1];
}

pair[] ps = {(0,2)};
ps.push(extension(lastPs(ps),lastPs(ps)+(1,-1),A,C));
ps.push(lastPs(ps)+0.25*(C-A));
ps.push(lastPs(ps)+(0,1));
ps.push(lastPs(ps)+(3,0));
ps.push(extension(lastPs(ps),lastPs(ps)+(0,-1),A,B));
ps.push(lastPs(ps)+(-1,1));
ps.push(lastPs(ps)+(-1,-1));
ps.push(lastPs(ps)+(-1,0));
ps.push(extension(lastPs(ps),lastPs(ps)+(-1,-1),A,A+(0,1)));

label("$A$",A,SW);
label("$B$",B,SE);
label("$C$",C,N);

dot("$P_1$",ps[0],NW);
dot("$P_2$",ps[1],2W);
dot("$P_3$",ps[2],NW);
dot("$P_4$",ps[3],NW);
dot("$P_5$",ps[4],NE);
dot("$P_6$",ps[5],S);
dot("$P_7$",ps[6],N);
dot("$P_8$",ps[7],S);
dot("$P_9$",ps[8],SE);
dot("$P_{10}$",ps[9],SW);

label("$\bot$",ps[0]--ps[1],SW);
label("$\bot$",ps[1]--ps[2],NW);
label("$\bot$",ps[2]--ps[3],NE);
label("$\bot$",ps[3]--ps[4],S);
label("$\top$",ps[4]--ps[5],W);
label("$\top$",ps[5]--ps[6],NE);
label("$\top$",ps[6]--ps[7],NW);
label("$\top$",ps[7]--ps[8],N);
label("$\bot$",ps[8]--ps[9],SE);


draw(pathOfPolyseg(ps),p=currentpen+1);

draw(pathOfPolyseg(ps),p=currentpen+1);

shipout(format="pdf");
