unitsize(30);

pair[] ps = {(0,0),
            (0,7),
            (8,7),
            (8,2),
            (9,2),
            (9,1),
            (8,1),
            (8,0),
            (7,0),
            (7,1),
            (6,1),
            (6,2),
            (7,2),
            (7,6),
            (6,6),
            (6,6),
            (6,3),
            (5,3),
            (5,0),
            (4,0),
            (4,5),
            (5,5),
            (5,6),
            (1,6),
            (1,5),
            (3,5),
            (3,4),
            (1,4),
            (1,3),
            (1,3),
            (3,3),
            (3,0),
            (2,0),
            (2,2),
            (1,2),
            (1,0),
             (0,0)};

pair q6 = extension(ps[0],ps[3],(3.2,5.7),(5.5,1));
pair q6 = extension(ps[0],ps[3],(3.2,5.7),(5.5,1))+(0,-0.5);
pair[] qs = {(-1,6),(3.3,1.5),(3.2,5.7),q6,(6.9,4.5),(7.5,-1),(-1,-1),(-1,6)};

path pathOfPolyseg(pair[] ps) {
  path polyseg;
  for (pair p:ps) {
    polyseg = polyseg -- p;
  }
  return polyseg;
}

void base(int i) {
  picture p;
  currentpicture = p;
  unitsize(30);
  fill(pathOfPolyseg(ps)--cycle,p=lightgreen);

  if (i >= 0) {
    fill(ps[0]--ps[i]--ps[i+1]--cycle,p=lightcyan);
  }

  if (i >= 0) {
    draw(ps[0]--ps[i],p=dashed);
    draw(ps[0]--ps[i+1],p=dashed);
  }
  if (i == 0) {
    draw(pathOfPolyseg(ps[1:]));
  }
  else {
    draw(pathOfPolyseg(ps)--cycle);
  }
  
  label("$Ps$",ps[1]--ps[2]);
  dot("$P_1$",ps[0],SW);
  dot("$P_2$",ps[1],NW);
  dot("$P_3$",ps[2],NE);
  dot("$P_4$",ps[3],NE);
  dot("$P_5$",ps[4],NE);
  dot("$P_6$",ps[5],SE);
  dot("$P_7$",ps[6],2*SE);
  dot("$P_8$",ps[7],SE);  
}

void addQs(int i) {
  label("$Qs$",qs[6]--qs[7]);  
  draw(pathOfPolyseg(qs),p=red+2);
  pen square=makepen(scale(3)*polygon(4))+blue;
  if (i >= 0) {
    dot(intersectionpoints(ps[0]--ps[i]--cycle,pathOfPolyseg(qs)),p=square+4);
    dot(intersectionpoints(ps[0]--ps[i+1]--cycle,pathOfPolyseg(qs)),p=blue+4);
  }

  if (i==1) {
    dot("$O$",intersectionpoints(ps[0]--ps[i]--cycle,pathOfPolyseg(qs))[0],SW);
  }
  if (i==6) {
    dot("$Y$",intersectionpoints(ps[0]--ps[i+1]--cycle,pathOfPolyseg(qs))[0],SW);
  }
}

pair raycast(pair pos, pair target, path p) {
  pair[] inters = intersectionpoints(pos--target,p);
  inters.push(target);
  inters = sort(inters,new bool(pair p,pair q) {return (arclength(pos--p) < arclength(pos--q));});
  return inters[0];
}

base(-1);

pair inter1 = intersectionpoints(ps[0]--ps[1],pathOfPolyseg(qs))[0];
pair target = qs[1]+0.7*(qs[1]-inter1);
pair pos = inter1+0.01*(target-inter1);

for (pair p : intersectionpoints(pos--target,pathOfPolyseg(ps))) {
  dot(p);
}

label("$h$",pos--target,W);

draw(inter1--target,p=dashed);
pair raycasted = raycast(pos,target,pathOfPolyseg(ps));
dot("$X$",inter1,W);
dot("$A$",midpoint(inter1--raycasted),NE);
dot("$H$",raycasted,W);

pair target2 = inter1 + inter1-raycasted;
dot("$B$",target2,N);
draw(inter1--target2,p=dashed);

shipout(prefix="rayCast1",format="pdf");

for (int i=1;i<7;++i) {
  base(i);
  addQs(i);
  dot("$A$",midpoint(inter1--raycasted),NE);
  dot("$B$",target2,N);
  shipout(prefix="ParityProof"+format("%i",i),format="pdf");
}

