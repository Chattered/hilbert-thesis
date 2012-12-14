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

pair[] rotate1(pair[] ps) {
  pair[] ps2 = ps[1:];
  ps2.push(ps2[0]);
  return ps2;
}

bool onPath(path p, pair pt) {
  return intersectionpoints(p,pt,0.01).length > 0;
}

bool segIntersect(path p, path q) {
  return intersectionpoints(p,q,0.01).length > 0;
}

pair[] rotateToPoint(pair[] ps, pair pt) {
  for (int i=0; i<ps.length; ++i) {
    if (onPath(ps[0]--ps[1],pt) && ps[1] != pt) {
      return ps;
    }
    ps = rotate1(ps);
  }
  abort("pt is not on the polygonal segment.");
  return null;
}

path pathOfPolyseg(pair[] ps) {
  path polyseg;
  for (pair p:ps) {
    polyseg = polyseg -- p;
  }
  return polyseg;
}

pair inter(pair[] ps, pair[] qs) {
  pair[] is = intersectionpoints(pathOfPolyseg(ps),pathOfPolyseg(qs));
  if (is.length == 0) {
    abort("No intersection.");
    return (0,0);
  }
  else return is[0];
}

bool faceInside(path p, pair[] qs) {
  pair q =qs[1];
  pair q2=qs[qs.length-1];
  while (!inside(p--cycle,q) && !inside(p--cycle,q2)) {
    q  = midpoint(qs[0]--q);
    q2 = midpoint(qs[0]--q2);
  }
  return inside(p--cycle,q);
}

pair[] faceOutside(pair[] ps, pair[] qs, pair i) {
  pair[] qs2 = qs;
  if (i != qs[0]) {
    qs2 = qs[1:];
    qs2.insert(0,i);
    qs2.push(qs[0]);
  }
  if (faceInside(ps[0]--ps[1]--ps[2],qs2)) {
    qs2 = reverse(qs[2:]);
    qs2.insert(0,qs[1]);
    qs2.push(qs[1]);
    return qs2;
  }
  else {
    return qs;
  }
}

pair[] findBrokenLine(pair[] ps, pair[] qs) {
  qs = rotate1(qs);
  int i=0;
  pair bl[];
  while (!segIntersect(ps[0]--ps[2],qs[i]--qs[i+1])) {
    bl.push(qs[i]);
    ++i;
  }
  bl.push(qs[i]);
  bl.push(intersectionpoints(ps[0]--ps[2],qs[i]--qs[i+1],0.01)[0]);
  int i=qs.length-1;
  while (!segIntersect(ps[0]--ps[2],qs[i]--qs[i-1])) {
    bl.insert(0,qs[i]);
    --i;
  }
  bl.insert(0,(qs[i]));
  bl.insert(0,intersectionpoints(ps[0]--ps[2],qs[i]--qs[i-1],0.01)[0]);
  return bl;
}

// LOTS OF MESSY EXAMPLES START HERE

fill(pathOfPolyseg(ps)--cycle,p=lightgreen);
draw(pathOfPolyseg(ps)--cycle);

label("$p_n$",ps[1]--ps[2]);
label("$q$",qs[6]--qs[7]);

pair[] is = intersectionpoints(pathOfPolyseg(ps),pathOfPolyseg(qs));
pair i = is[0];
pair[] ps = rotateToPoint(ps,i);
pair[] qs = rotateToPoint(qs,i);
pair[] qs2 = faceOutside(ps,qs,i);

pair[] bl = findBrokenLine(ps,qs2);

draw(pathOfPolyseg(qs),p=red+2);
dot("$P_1$",ps[0],SW);
dot("$P_2$",ps[1],NW);
dot("$P_3$",ps[2],NE);
dot("$P_4$",ps[3],NE);
dot("$P_5$",ps[4],NE);
dot("$O$",i,NE);
dot(is,p=black+4);
dot("$Q_1'$",qs2[0],S,p=black+4);
dot("$Q_2'$",qs2[1],N,p=black+4);
dot("$Q_3'$",qs2[2],SW,p=black+4);
dot("$Q_4'$",qs2[3],SE,p=black+4);
dot("$Q_5'$",qs2[4],2*E,p=black+4);
dot("$Q_6'$",qs2[5],S,p=black+4);
dot("$Q_7'$",qs2[6],W,p=black+4);
shipout(prefix="veblenCounter1",format="pdf");

picture p;
currentpicture = p;
unitsize(30);
fill(pathOfPolyseg(ps)--cycle,p=lightgreen);
fill(ps[0]--ps[1]--ps[2]--cycle,p=lightcyan);
draw(pathOfPolyseg(ps)--cycle);
draw(pathOfPolyseg(bl),p=red+2);
label("$p_n$",ps[1]--ps[2]);
dot("$P_1$",ps[0],SW);
dot("$P_2$",ps[1],NW);
dot("$P_3$",ps[2],NE);
dot("$P_4$",ps[3],NE);
dot("$P_5$",ps[4],NE);
dot("$O$",i,NE);
dot("$O_k$",bl[0],SE,p=black+4);
dot("$O_j$",bl[bl.length-1],2*ESE,p=black+4);
dot("$Q_2'$",qs2[1],N,p=black+4);
dot("$Q_3'$",qs2[2],SW,p=black+4);
dot("$Q_4'$",qs2[3],SE,p=black+4);
dot("$Q_5'$",qs2[4],2*E,p=black+4);
dot("$Q_6'$",qs2[5],S,p=black+4);
draw(ps[0]--ps[2],p=dashed);
shipout(prefix="veblenCounter2",format="pdf");

picture p;
currentpicture = p;
unitsize(30);
fill(pathOfPolyseg(ps)--cycle,p=lightgreen);
fill(ps[0]--ps[2]--ps[3]--cycle,p=lightcyan);
draw(pathOfPolyseg(ps)--cycle);
draw(pathOfPolyseg(bl),p=red+2);
label("$p_n$",ps[1]--ps[2]);
dot("$P_1$",ps[0],SW);
dot("$P_2$",ps[1],NW);
dot("$P_3$",ps[2],NE);
dot("$P_4$",ps[3],NE);
dot("$P_5$",ps[4],NE);
dot("$O$",i,NE,p=black+4);
dot("$O_k$",bl[0],SE,p=black+4);
dot("$O_j$",bl[bl.length-1],2*ESE,p=black+4);
dot("$Q_2'$",qs2[1],N,p=black+4);
dot("$Q_3'$",qs2[2],SW,p=black+4);
dot("$Q_4'$",qs2[3],SE,p=black+4);
dot("$Q_5'$",qs2[4],2*E,p=black+4);
dot("$Q_6'$",qs2[5],S,p=black+4);
draw(ps[0]--ps[2],p=dashed);
draw(ps[0]--ps[3],p=dashed);
//dot(intersectionpoints(ps[0]--ps[3],pathOfPolyseg(qs),0.01)[3],p=black+4);

shipout(prefix="veblenCounter3",format="pdf");

picture p;
currentpicture = p;
unitsize(30);

pair ps2[] = ps[:];

pair i = intersectionpoints(ps2[0]--ps2[2],pathOfPolyseg(qs),0.01)[0];
dot("$P_1$",ps2[0],SW);
dot("$P_2$",ps2[1],NW);
dot("$P_3$",ps2[2],NE);
dot("$P_4$",ps2[3],NE);
dot("$P_5$",ps2[4],NE);
fill(pathOfPolyseg(ps2)--cycle,p=lightgreen);
fill(ps2[0]--ps2[2]--ps2[3]--cycle,p=lightcyan);
draw(pathOfPolyseg(ps2)--cycle);


label("$p_n$",ps[1]--ps[2]);
ps2.delete(1);

pair[] ps2 = rotateToPoint(ps2,i);
pair[] qs = rotateToPoint(qs,i);
pair[] qs2 = faceOutside(ps2,qs,i);

pair[] bl = findBrokenLine(ps2,qs2);

draw(pathOfPolyseg(bl),p=red+2);
dot(intersectionpoints(ps[0]--ps[2],pathOfPolyseg(qs)),p=black+4);
dot("$Q$",intersectionpoints(ps[0]--ps[2],pathOfPolyseg(qs))[2],p=black+4);
draw(ps2[0]--ps2[1],p=dashed);
dot("$O_k$",i,E,p=black+4);
dot("$O_k'$",bl[0],SE,p=black+4);
dot("$O_j'$",bl[bl.length-1],2*ESE,p=black+4);
dot("$Q_2'$",qs2[1],N,p=black+4);
dot("$Q_3'$",qs2[2],SW,p=black+4);
dot("$Q_4'$",qs2[3],SE,p=black+4);
dot("$Q_6'$",qs2[6],2*E,p=black+4);
dot("$Q_7'$",qs2[7],S,p=black+4);
draw(ps2[0]--ps2[2],p=dashed);

shipout(prefix="veblenCounter4",format="pdf");

picture p;
currentpicture = p;
unitsize(30);

pair[] is = intersectionpoints(ps[0]--ps[2],pathOfPolyseg(qs),0.01);
pair i = is[0]; 
dot("$P_1$",ps[0],SW);
dot("$P_2$",ps[1],NW);
dot("$P_3$",ps[2],NE);
dot("$P_4$",ps[3],NE);
dot("$P_5$",ps[4],NE);
fill(pathOfPolyseg(ps)--cycle,p=lightgreen);
fill(ps[0]--ps[2]--ps[3]--cycle,p=lightcyan);
draw(pathOfPolyseg(ps)--cycle);
draw(pathOfPolyseg(qs),p=red+2);
label("$p_n$",ps[1]--ps[2]);

draw(ps[0]--ps[2],p=dashed);
draw(ps[0]--ps[3],p=dashed);
dot("$O$",i,E,p=black+4);
dot("$O'$",is[1],E,p=black+4);
dot("$O''$",is[2],E,p=black+4);

dot("$Q_1'$",qs2[0],S,p=black+4);
dot("$Q_2'$",qs2[1],N,p=black+4);
dot("$Q_3'$",qs2[2],SW,p=black+4);
dot("$Q_4'$",qs2[3],SE,p=black+4);
dot("$Q_5'$",qs2[4],2*E,p=black+4);
dot("$Q_6'$",qs2[5],S,p=black+4);
dot("$Q_7'$",qs2[6],W,p=black+4);

shipout(prefix="veblenCounter5",format="pdf");

picture p;
currentpicture = p;
unitsize(30);

pair[] qs2 = {(-1,6),(3,1),(3.2,5.7),(-1,6)};

pair[] is = intersectionpoints(ps[0]--ps[2],pathOfPolyseg(qs2),0.01);
pair i = is[0];
label("$p_n$",ps[1]--ps[2]);
dot("$P_1$",ps[0],SW);
dot("$P_2$",ps[1],NW);
dot("$P_3$",ps[2],NE);
dot("$P_4$",ps[3],NE);
dot("$P_5$",ps[4],NE);
fill(pathOfPolyseg(ps)--cycle,p=lightgreen);
fill(ps[0]--ps[2]--ps[3]--cycle,p=lightcyan);
draw(pathOfPolyseg(ps)--cycle);

draw(ps[0]--ps[2],p=dashed);

draw(pathOfPolyseg(qs2),p=red+2);
dot("$O$",i,E,p=black+4);
dot("$O'$",is[1],E,p=black+4);
dot("$Q_1'$",qs2[0],W,p=black+4);
dot("$Q_2'$",qs2[1],NE,p=black+4);
dot("$Q_3'$",qs2[2],E,p=black+4);
draw(ps[0]--ps[3],p=dashed);

shipout(prefix="veblenCounter6",format="pdf");

picture p;
currentpicture = p;
unitsize(30);
fill(pathOfPolyseg(ps)--cycle,p=lightgreen);
fill(ps[0]--ps[2]--ps[3]--cycle,p=lightcyan);
draw(pathOfPolyseg(ps)--cycle);

label("$p_n$",ps[1]--ps[2]);
label("$q$",qs[6]--qs[7]);

pair[] is = intersectionpoints(pathOfPolyseg(ps),pathOfPolyseg(qs));
pair i = is[0];
pair[] ps = rotateToPoint(ps,i);
pair[] qs = rotateToPoint(qs,i);
pair[] qs2 = faceOutside(ps,qs,i);

pair[] bl = findBrokenLine(ps,qs2);

draw(pathOfPolyseg(qs),p=red+2);
dot("$P_1$",ps[0],SW);
dot("$P_2$",ps[1],NW);
dot("$P_3$",ps[2],NE);
dot("$P_4$",ps[3],NE);
dot("$P_5$",ps[4],NE);
dot("$O$",i,NE);
dot(is,p=black+4);
dot("$Q_1'$",qs2[0],S,p=black+4);
dot("$Q_2'$",qs2[1],N,p=black+4);
dot("$Q_3'$",qs2[2],SW,p=black+4);
dot("$Q_4'$",qs2[3],SE,p=black+4);
dot("$Q_5'$",qs2[4],2*E,p=black+4);
dot("$Q_6'$",qs2[5],S,p=black+4);
dot("$Q_7'$",qs2[6],W,p=black+4);
shipout(prefix="veblenCounter7",format="pdf");
