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

unitsize(30);
fill(pathOfPolyseg(ps)--cycle,p=lightgreen);

draw(pathOfPolyseg(ps));

shipout(prefix="foo",format="pdf");
