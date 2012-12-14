import "../labelledPoints" as labelledPoints;
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
  fill(ps[0]--ps[i]--ps[i+1]--cycle,p=lightcyan);
  draw(ps[0]--ps[i],p=dashed);
  draw(ps[0]--ps[i+1],p=dashed);
  if (i == 0) {
    draw(pathOfPolyseg(ps[1:])--cycle);
  }
  else {
    draw(pathOfPolyseg(ps)--cycle);
  }
  
  label("$p_n$",ps[1]--ps[2]);
  label("$q$",qs[6]--qs[7]);
  
  draw(pathOfPolyseg(qs),p=red+2);
  dot("$P_1$",ps[0],SW);
  dot("$P_2$",ps[1],NW);
  dot("$P_3$",ps[2],NE);
  dot("$P_4$",ps[3],NE);
  dot("$P_5$",ps[4],NE);
  dot("$P_6$",ps[5],SE);
  dot("$P_7$",ps[6],2*SE);
  dot("$P_8$",ps[7],SE);  
  
  dot("$Q_1$",qs[0],NW,p=black+4);
  dot("$Q_2$",qs[1],S,p=black+4);
  dot("$Q_3$",qs[2],W,p=black+4);
  dot("$Q_4$",qs[3],3*S,p=black+4);
  dot("$Q_5$",qs[4],2*E,p=black+4);
  dot("$Q_6$",qs[5],SE,p=black+4);
  dot("$Q_7$",qs[6],SW,p=black+4);
  pen square=makepen(scale(3)*polygon(4))+blue;
  dot(intersectionpoints(ps[0]--ps[i]--cycle,pathOfPolyseg(qs)),p=square+4);
  dot(intersectionpoints(ps[0]--ps[i+1]--cycle,pathOfPolyseg(qs)),p=blue+4);

  if (i==1) {
    dot("$O$",intersectionpoints(ps[0]--ps[i]--cycle,pathOfPolyseg(qs))[0],SW);
  }
  if (i==6) {
    dot("$X$",intersectionpoints(ps[0]--ps[i+1]--cycle,pathOfPolyseg(qs))[0],SW);
  }
}

for (int i=1;i<7;++i) {
  base(i);
  shipout(prefix="correctProof"+format("%i",i),format="pdf");
}



