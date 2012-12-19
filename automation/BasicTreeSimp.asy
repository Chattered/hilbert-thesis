unitsize(40);

pair branchL = (-1.5,-1);
pair branchR = (1.5,-1);
pair branchL2 = (0.75 * -1.5,-1);
pair branchR2 = (0.75 * 1.5,-1);

pair labelDepth = (0,-0.4);

pair rn = (0,0);
pair Pn = rn + branchL;
pair Qn = rn + branchR;

label("$\{a\}$",rn,N);
draw("$P$",rn--Pn,NW);
draw("$Q$",rn--Qn,NE);
label("$\{b\}$",Pn,S);
label("$\{c\}$",Qn,S);

pair rn2 = (4,0);
pair Pn2 = rn2 + branchL;
pair Qn2 = rn2 + branchR;
label("$\{x\}$",rn2,N);
draw("$P$",rn2--Pn2,NW);
draw("$Q$",rn2--Qn2,NE);
label("$\{y\}$",Pn2,S);
label("$\{z\}$",Qn2,S);

label("$+$",(2,(rn.y+Pn.y)/2));

// Equals

pair rn3 = (2,-2);
pair Pn3 = rn3 + branchL;
pair Qn3 = rn3 + branchR;
label("$\{f\ a\ x\}$",rn3,N);
draw("$P$",rn3--Pn3,NW);
draw("$Q$",rn3--Qn3,NE);
label("$\{f\ a\ y, f\ b\ x\}$",Pn3,S);
label("$\{f\ a\ z, f\ c\ x\}$",Qn3,S);

label("$=$",(Pn.x,(rn3.y+Pn3.y)/2));


shipout(format="pdf");
