// Simplify

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

label("$xs$",rn,N);
draw(rn--Pn);
label("$P$",rn--Pn,NW,filltype=Fill(p=green));
draw(rn--Qn);
label("$Q$",rn--Qn,NE,filltype=Fill(p=yellow));
label("$ys$",Pn,S);
label("$zs$",Qn,S);
draw(Pn+labelDepth--Rn);
label("$R$",Pn+labelDepth--Rn,NW,filltype=Fill(p=lightblue));
draw(Pn+labelDepth--Sn);
label("$S$",Pn+labelDepth--Sn,NE,filltype=Fill(p=lightred));
draw(Qn+labelDepth--Tn);
label("$T$",Qn+labelDepth--Tn,NW,filltype=Fill(p=orange));
draw("$U$",Qn+labelDepth--Un,NE);

pair rn2 = Rn + labelDepth;
pair Xn  = rn2 + branchL3;
pair Pn2 = rn2 + branchR3;
pair Tn2 = Xn + labelDepth + branchL4;
pair Qn2 = Xn + labelDepth + branchR4;
pair Rn2 = Pn2 + labelDepth + branchL4;
pair Sn2 = Pn2 + labelDepth + branchR4;

label("$ts + xs'$",rn2,N);
draw("$X$",rn2--Xn,NW);
draw(rn2--Pn2);
label("$P$",rn2--Pn2,NE,filltype=Fill(p=green));
label("$ys'$",Xn,S);
label("$zs'$",Pn2,S);
draw("$T$",Xn+labelDepth--Tn2,NW);
draw("$Q$",Xn+labelDepth--Qn2,NE);
draw(Pn2+labelDepth--Rn2);
label("$R$",Pn2+labelDepth--Rn2,NW,filltype=Fill(p=lightblue));
draw("$S$",Pn2+labelDepth--Sn2,NE);
label("$ts'$",Tn2,S);
label("$us'$",Qn2,S);
label("$vs'$",Rn2,S);
label("$ws'$",Sn2,S);

pair rn2 = Sn + labelDepth;
pair Xn  = rn2 + branchL3;
pair Pn2 = rn2 + branchR3;
pair Tn2 = Xn + labelDepth + branchL4;
pair Qn2 = Xn + labelDepth + branchR4;
pair Rn2 = Pn2 + labelDepth + branchL4;
pair Sn2 = Pn2 + labelDepth + branchR4;

label("$us + xs'$",rn2,N);
draw("$X$",rn2--Xn,NW);
draw(rn2--Pn2);
label("$P$",rn2--Pn2,NE,filltype=Fill(p=green));
label("$ys'$",Xn,S);
label("$zs'$",Pn2,S);
draw("$T$",Xn+labelDepth--Tn2,NW);
draw("$Q$",Xn+labelDepth--Qn2,NE);
draw("$R$",Pn2+labelDepth--Rn2,NW);
draw(Pn2+labelDepth--Sn2);
label("$S$",Pn2+labelDepth--Sn2,NE,filltype=Fill(p=lightred));
label("$ts'$",Tn2,S);
label("$us'$",Qn2,S);
label("$vs'$",Rn2,S);
label("$ws'$",Sn2,S);

//

pair rn2 = Tn + labelDepth;
pair Xn  = rn2 + branchL3;
pair Pn2 = rn2 + branchR3;
pair Tn2 = Xn + labelDepth + branchL4;
pair Qn2 = Xn + labelDepth + branchR4;
pair Rn2 = Pn2 + labelDepth + branchL4;
pair Sn2 = Pn2 + labelDepth + branchR4;

label("$vs + xs'$",rn2,N);
draw("$X$",rn2--Xn,NW);
draw("$P$",rn2--Pn2,NE);
label("$ys'$",Xn,S);
label("$zs'$",Pn2,S);
draw(Xn+labelDepth--Tn2);
label("$T$",Xn+labelDepth--Tn2,NW,filltype=Fill(orange));
draw(Xn+labelDepth--Qn2);
label("$Q$",Xn+labelDepth--Qn2,NE,filltype=Fill(yellow));
draw("$R$",Pn2+labelDepth--Rn2,NW);
draw("$S$",Pn2+labelDepth--Sn2,NE);
label("$ts'$",Tn2,S);
label("$us'$",Qn2,S);
label("$vs'$",Rn2,S);
label("$ws'$",Sn2,S);

pair rn2 = Un + labelDepth;
pair Xn  = rn2 + branchL3;
pair Pn2 = rn2 + branchR3;
pair Tn2 = Xn + labelDepth + branchL4;
pair Qn2 = Xn + labelDepth + branchR4;
pair Rn2 = Pn2 + labelDepth + branchL4;
pair Sn2 = Pn2 + labelDepth + branchR4;

label("$ws + xs'$",rn2,N);
draw("$X$",rn2--Xn,NW);
draw("$P$",rn2--Pn2,NE);
label("$ys'$",Xn,S);
label("$zs'$",Pn2,S);
draw("$T$",Xn+labelDepth--Tn2,NW);
draw(Xn+labelDepth--Qn2);
label("$Q$",Xn+labelDepth--Qn2,NE,filltype=Fill(yellow));
draw("$R$",Pn2+labelDepth--Rn2,NW);
draw("$S$",Pn2+labelDepth--Sn2,NE);
label("$ts'$",Tn2,S);
label("$us'$",Qn2,S);
label("$vs'$",Rn2,S);
label("$ws'$",Sn2,S);

// //

pair rn = (3,-10);
pair Pn = rn + branchL;
pair Qn = rn + branchR;
pair Rn = Pn + labelDepth + branchL2;
pair Sn = Pn + labelDepth + branchR2;
pair Tn = Qn + labelDepth + branchL2;
pair Un = Qn + labelDepth + branchR2;
pair Xn  = Rn + labelDepth + branchL3;
pair Pn2 = Rn + labelDepth + branchR3;

label("$xs$",rn,N);
draw(rn--Pn);
label("$P$",rn--Pn,NW);
draw(rn--Qn);
label("$Q$",rn--Qn,NE);
label("$ys$",Pn,S);
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

label("$ts + xs' + zs' + vs'$",rn2,N);

pair rn2 = Sn + labelDepth;
pair Xn  = rn2 + branchL3;
pair Pn2 = rn2 + branchR3;
pair Tn2 = Xn + labelDepth + branchL4;
pair Qn2 = Xn + labelDepth + branchR4;
pair Rn2 = Pn2 + labelDepth + branchL4;
pair Sn2 = Pn2 + labelDepth + branchR4;

label("$us + xs' + zs' + ws'$",rn2,N);

pair rn2 = Tn + labelDepth;
pair Xn  = rn2 + branchL3;
pair Pn2 = rn2 + branchR3;
pair Tn2 = Xn + labelDepth + branchL4;
pair Qn2 = Xn + labelDepth + branchR4;
pair Rn2 = Pn2 + labelDepth + branchL4;
pair Sn2 = Pn2 + labelDepth + branchR4;

label("$vs + xs'$",rn2,N);
draw("$X$",rn2--Xn,NW);
draw(rn2--Pn2);
label("$P$",rn2--Pn2,NE);
label("$ys' + ts' + us'$",Xn,S);
label("$zs'$",Pn2,S);
draw("$R$",Pn2+labelDepth--Rn2,NW);
draw("$S$",Pn2+labelDepth--Sn2,NE);
label("$vs'$",Rn2,S);
label("$ws'$",Sn2,S);

pair rn2 = Un + labelDepth;
pair Xn  = rn2 + branchL3;
pair Pn2 = rn2 + branchR3;
pair Tn2 = Xn + labelDepth + branchL4;
pair Qn2 = Xn + labelDepth + branchR4;
pair Rn2 = Pn2 + labelDepth + branchL4;
pair Sn2 = Pn2 + labelDepth + branchR4;

label("$ws + xs'$",rn2,N);
draw("$X$",rn2--Xn,NW);
draw(rn2--Pn2);
label("$P$",rn2--Pn2,NE);
label("$ys'+us'$",Xn,S);
label("$zs'$",Pn2,S);
draw("$R$",Pn2+labelDepth--Rn2,NW);
draw("$S$",Pn2+labelDepth--Sn2,NE);
label("$vs'$",Rn2,S);
label("$ws'$",Sn2,S);

label("$\equiv$",(-3 ,(rn.y+Tn2.y)/2));

shipout(prefix="FullSimpTree2",format="pdf");
