unitsize(40);

pair centerOf(...pair[] ps) {
  real avgx = 0;
  real avgy = 0;
  for (pair p : ps) {
    avgx += p.x;
    avgy += p.y;
  }
  avgx = avgx / ps.length;
  avgy = avgy / ps.length;
  return (avgx,avgy);
}

pair branchL = (-1.5,-1);
pair branchR = (1.5,-1);
pair labelDepth = (0,-0.4);

pair rn = (0,0);
pair Pn = rn + branchL;
pair Qn = rn + branchR;

label("$as$",rn,N);
draw("$P$",rn--Pn,NW);
draw("$Q$",rn--Qn,NE);
label("$bs$",Pn,S);
label("$cs$",Qn,S);

pair rn2 = (4,0);
pair Rn = rn2 + branchL;
pair Sn = rn2 + branchR;

label("$+$",centerOf(rn,rn2,Pn,Sn));

label("$xs$",rn2,N);
draw("$R$",rn2--Rn,NW);
draw("$S$",rn2--Sn,NE);
label("$ys$",Rn,S);
label("$zs$",Sn,S);

pair rn3 = midpoint(Pn--Sn) + (0,-1);
pair Pn2 = rn3 + branchL;
pair Qn2 = rn3 + branchR;
branchL = 0.75*branchL;
branchR = 0.75*branchR;
pair Rn2 = Pn2 + labelDepth + branchL;
pair Sn2 = Pn2 + labelDepth + branchR;
pair Rn3 = Qn2 + labelDepth + branchL;
pair Sn3 = Qn2 + labelDepth + branchR;

label("$as$",rn3,N);
draw("$P$",rn3--Pn2,NW);
draw("$Q$",rn3--Qn2,NE);
label("$bs + xs$",Pn2,S,filltype=Fill(p=yellow));
label("$cs + xs$",Qn2,S,filltype=Fill(p=yellow));
draw("$R$",Pn2+labelDepth--Rn2,NW);
draw("$S$",Pn2+labelDepth--Sn2,NE);
draw("$R$",Qn2+labelDepth--Rn3,NW);
draw("$S$",Qn2+labelDepth--Sn3,NE);
label("$ys$",Rn2,S);
label("$zs$",Sn2,S);
label("$ys$",Rn3,S);
label("$zs$",Sn3,S);

label("$=$",(-1.5, (Rn2.y + rn3.y)/2));

shipout(prefix="NoSimpTree1",format="pdf");

picture pic;
currentpicture = pic;
unitsize(40);

label("$as+xs$",rn3,N,filltype=Fill(p=yellow));
draw("$P$",rn3--Pn2,NW);
draw("$Q$",rn3--Qn2,NE);
label("$bs$",Pn2,S);
label("$cs$",Qn2,S);
draw("$R$",Pn2+labelDepth--Rn2,NW);
draw("$S$",Pn2+labelDepth--Sn2,NE);
draw("$R$",Qn2+labelDepth--Rn3,NW);
draw("$S$",Qn2+labelDepth--Sn3,NE);
label("$ys$",Rn2,S);
label("$zs$",Sn2,S);
label("$ys$",Rn3,S);
label("$zs$",Sn3,S);

shipout(prefix="NoSimpTree2",format="pdf");
