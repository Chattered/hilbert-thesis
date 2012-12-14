pair[] ps = {(0,0),(5,3),(-1,6),(6,7),(8,3)};

path pathPairs(pair[] pts) {
  path p;
  for (pair pt:pts) {
    p = p -- pt;
  }
  return p;
}

pair qs[] = {(-1.5,1),(5,1),(-2,-2),(-3,4),(1.5,3),(-1.5,1)};
pair qs2[] = {(-1.5,1),(5,1),(-2,-2),(-3,4),(3,3),(-1.5,1)};
pair inter1 = extension(qs[0],qs[1],ps[0],ps[1]);
pair inter2 = extension(qs[0],qs[1],ps[0],ps[2]);
pair inter3 = extension(qs[3],qs[4],ps[0],ps[2]);
pair inter22 = extension(qs2[0],qs2[1],ps[0],ps[2]);
pair inter23 = extension(qs2[3],qs2[4],ps[0],ps[2]);
pair inter4 = extension(qs2[3],qs2[4],ps[0],ps[3]);
pair inter5 = extension(qs2[4],qs2[5],ps[0],ps[3]);
pair inter6 = extension(qs2[0],qs2[1],ps[0],ps[3]);

picture basePicture;
basePicture.size(400);
currentpicture = basePicture;
draw(ps[4]--(9,2),p=dashed);

dot("$P_1$",ps[0],S);
dot("$P_4$",ps[3],NE);
dot("$P_5$",ps[4],E);

picture pic;
pic.size(400);
pic.add(basePicture);
currentpicture = pic;

draw(pathPairs(ps));
draw(pathPairs(qs),p=blue);

dot(inter1,p=red);
dot("$P_2$",ps[1],E);
dot("$P_3$",ps[2],NW);
dot("$Q_1$",qs[0],NW);
label("$O$",inter1,NW);
dot("$Q_2$",qs[1],E);
dot("$Q_3$",qs[2],SW);
dot("$Q_4$",qs[3],NW);
dot("$Q_5$",qs[4],E);

shipout(prefix="VeblenMainCounter1",format="pdf");
picture pic;
pic.size(400);
pic.add(basePicture);
currentpicture = pic;

draw(ps[0]--ps[1]--ps[2],p=red);
draw(ps[0]--ps[2],p=dashed+red);
draw(ps[2]--ps[3]--ps[4]);
draw(pathPairs(qs),p=blue);

dot(inter1,p=red);
dot("$P_2$",ps[1],E);
dot("$P_3$",ps[2],NW);
dot("$Q_1$",qs[0],NW);
label("$O$",inter1,NW);
dot("$Q_2$",qs[1],E);
dot("$Q_3$",qs[2],SW);
dot("$Q_4$",qs[3],NW);
dot("$Q_5$",qs[4],E);

shipout(prefix="VeblenMainCounter2",format="pdf");

picture pic;
pic.size(400);
pic.add(basePicture);
currentpicture = pic;

dot(inter1,p=red);
draw(ps[0]--ps[1]--ps[2],p=red);
draw(ps[0]--ps[2],p=dashed+red);
draw(ps[2]--ps[3]--ps[4]);
draw(qs[0]--qs[1]--qs[2]--qs[3]--qs[4],p=blue);
draw(qs[4]--qs[5],p=blue+dashed);
dot("$P_2$",ps[1],E);
dot("$P_3$",ps[2],NW);
dot("$Q_1$",qs[0],NW);
label("$O$",inter1,NW);
dot("$Q_2$",qs[1],E);
dot("$Q_3$",qs[2],SW);
dot("$Q_4$",qs[3],NW);
dot("$Q_5$",qs[4],E);

shipout(prefix="VeblenMainCounter3",format="pdf");

picture pic;
pic.size(400);
pic.add(basePicture);
currentpicture=pic;

dot(inter1,p=red);
draw(ps[0]--ps[1]--ps[2],p=red);
draw(ps[0]--ps[2],p=dashed+red);
draw(ps[2]--ps[3]--ps[4]);
draw(inter2--qs[1]--qs[2]--qs[3]--inter3,p=blue);
draw(inter2--qs[0]--qs[4]--inter3,p=blue+dashed);
label("$O$",inter1,NW);
dot("$P_2$",ps[1],E);
dot("$P_3$",ps[2],NW);
dot("$Q_1$",qs[0],NW);
dot("$Q_2$",qs[1],E);
dot("$Q_3$",qs[2],SW);
dot("$Q_4$",qs[3],NW);
dot("$Q_4$",qs[3],NW);
dot("$Q_5$",qs[4],E);
dot("$O_k$",inter2,SW);
dot("$O_j$",inter3,NE);

shipout(prefix="VeblenMainCounter4",format="pdf");

picture pic;
pic.size(400);
pic.add(basePicture);
currentpicture=pic;

dot(inter1,p=red);
draw(ps[0]--ps[2]--ps[3],p=red);
draw(ps[0]--ps[3],p=red+dashed);
draw(ps[3]--ps[4]);
draw(inter2--qs[1]--qs[2]--qs[3]--inter3,p=blue);
draw(inter2--qs[0]--qs[4]--inter3,p=blue+dashed);
dot("$Q_1$",qs[0],NW);
dot("$Q_2$",qs[1],E);
dot("$Q_3$",qs[2],SW);
dot("$Q_4$",qs[3],NW);
dot("$Q_4$",qs[3],NW);
dot("$Q_5$",qs[4],E);
dot("$O_k$",inter2,SW);
dot("$O_j$",inter3,NE);

shipout(prefix="VeblenMainCounter5",format="pdf");

picture pic;
pic.size(400);
pic.add(basePicture);
currentpicture=pic;

draw(ps[0]--ps[2]--ps[3],p=red);
draw(ps[0]--ps[3],p=red+dashed);
draw(ps[3]--ps[4]);
draw(inter22--qs2[1]--qs2[2]--qs2[3]--inter23,p=blue);
draw(inter22--qs2[0]--qs2[4]--inter23,p=blue+dashed);
dot("$Q_1$",qs[0],NW);
dot("$Q_2$",qs2[1],E);
dot("$Q_3$",qs2[2],SW);
dot("$Q_4$",qs2[3],NW);
dot("$Q_4$",qs2[3],NW);
dot("$Q_5$",qs2[4],E);
dot("$O_k$",inter22,SW);
dot("$O_j$",inter23,NE);
dot(inter4,p=red);
dot(inter5,p=red);
dot(inter6,p=red);

shipout(prefix="VeblenMainCounter6",format="pdf");

picture pic;
pic.size(400);
pic.add(basePicture);
currentpicture=pic;

draw(ps[0]--ps[3]--ps[4]);
draw(pathPairs(qs2),p=blue);
dot("$Q_1$",qs[0],NW);
dot("$Q_2$",qs2[1],E);
dot("$Q_3$",qs2[2],SW);
dot("$Q_4$",qs2[3],NW);
dot("$Q_4$",qs2[3],NW);
dot("$Q_5$",qs2[4],E);
dot(inter5,p=red);

shipout(prefix="VeblenMainCounter7",format="pdf");

picture pic;
pic.size(400);
pic.add(basePicture);
currentpicture=pic;

draw(ps[0]--ps[3]--ps[4],p=red);
draw(pathPairs(qs2),p=blue);
draw(ps[0]--ps[4],p=red+dashed);
dot("$Q_1$",qs[0],NW);
dot("$Q_2$",qs2[1],E);
dot("$Q_3$",qs2[2],SW);
dot("$Q_4$",qs2[3],NW);
dot("$Q_4$",qs2[3],NW);
dot("$Q_5$",qs2[4],E);
dot(inter5,p=red);

shipout(prefix="VeblenMainCounter7",format="pdf");
