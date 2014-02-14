picture pic;
currentpicture = pic;
unitsize(40);

pair branchL = (-3,-1);
pair branchR = (3,-1);
pair branchL2 = (0.5 * -3,-1);
pair branchR2 = (0.5 * 3,-1);
pair branchL3 = (0.5 * 0.5 * -3,-1);
pair branchR3 = (0.5 * 0.5 * 3,-1);
pair branchL4 = (0.4 * 0.5 * 0.75 * -3,-1);
pair branchR4 = (0.4 * 0.5 * 0.75 * 3,-1);

pair labelDepth = (0,-0.4);
pair rn = (3,-3.5);
pair Pn = rn + branchL;
pair Qn = rn + branchR;
pair Rn = Pn + labelDepth + branchL2;
pair Sn = Pn + labelDepth + branchR2;
pair Tn = Qn + labelDepth + branchL2;
pair Un = Qn + labelDepth + branchR2;
pair Xn  = Rn + labelDepth + branchL3;
pair Pn2 = Rn + labelDepth + branchR3;

label("$xs + xs'$",rn,N);
draw(rn--Pn);
label("$P$",rn--Pn,NW);
draw(rn--Qn);
label("$Q$",rn--Qn,NE);
label("$ys + zs'$",Pn,S);
label("$zs$",Qn,S);
draw(Pn+labelDepth--Rn);
label("$R$",Pn+labelDepth--Rn,NW);
draw(Pn+labelDepth--Sn);
label("$S$",Pn+labelDepth--Sn,NE);
draw(Qn+labelDepth--Tn);
label("$T$",Qn+labelDepth--Tn,NW);
draw("$U$",Qn+labelDepth--Un,NE);

pair rn2 = Rn + labelDepth;
pair Xn  = rn2 + branchL3;
pair Pn2 = rn2 + branchR3;
pair Tn2 = Xn + labelDepth + branchL4;
pair Qn2 = Xn + labelDepth + branchR4;
pair Rn2 = Pn2 + labelDepth + branchL4;
pair Sn2 = Pn2 + labelDepth + branchR4;

label("$ts + vs'$",rn2,N);

pair rn2 = Sn + labelDepth;
pair Xn  = rn2 + branchL3;
pair Pn2 = rn2 + branchR3;
pair Tn2 = Xn + labelDepth + branchL4;
pair Qn2 = Xn + labelDepth + branchR4;
pair Rn2 = Pn2 + labelDepth + branchL4;
pair Sn2 = Pn2 + labelDepth + branchR4;

label("$us + ws'$",rn2,N);

//

pair rn2 = Tn + labelDepth;
pair Xn  = rn2 + branchL3;
pair Pn2 = rn2 + branchR3;
pair Tn2 = Xn + labelDepth + branchL4;
pair Qn2 = Xn + labelDepth + branchR4;
pair Rn2 = Pn2 + labelDepth + branchL4;
pair Sn2 = Pn2 + labelDepth + branchR4;

label("$vs$",rn2,N);
draw("$X$",rn2--(rn2.x,Xn.y),NW);
label("$ys'+ts'+us'$",(rn2.x,Xn.y),S);

pair rn2 = Un + labelDepth;
pair Xn  = rn2 + branchL3;
pair Pn2 = rn2 + branchR3;
pair Tn2 = Xn + labelDepth + branchL4;
pair Qn2 = Xn + labelDepth + branchR4;
pair Rn2 = Pn2 + labelDepth + branchL4;
pair Sn2 = Pn2 + labelDepth + branchR4;

label("$ws$",rn2,N);
draw("$X$",rn2--(rn2.x,Xn.y),NW);
label("$ys'+us'$",(rn2.x,Xn.y),S);

shipout(prefix="FullSimpTree4",format="pdf");
