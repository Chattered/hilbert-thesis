unitsize(60);

// Diagram used to generate natural numbers
struct diagram {
  pair a;
  pair b;
  pair zero;
  pair c;
  pair d;
  int count;
}

void drawDiagram(picture pic = currentpicture, diagram dia) {
  dot("$A$",dia.a,W);
  dot("$B$",dia.b,N);
  dot("$C$",dia.c,SE);
  dot("$D$",dia.d,NW);
  dot("$0$",dia.zero,E);

  draw(dia.a--dia.b--dia.c);
  draw(dia.a--dia.zero);
  draw(dia.c--dia.a);
}

// Returns natural number points
pair[] sucs(diagram dia, int count) {
  pair[] ns;
  ns.push(dia.zero);
  if (count == 1) {
      ns.push(extension(dia.c,dia.d,dia.a,dia.zero));
    }

  for (int i = 2; i < count; ++i) {
    pair c2 = extension(dia.b,ns[ns.length-1],dia.a,dia.c);
    ns.push(extension(dia.a,dia.zero,dia.d,c2));
  }

  return ns;
}

// Returns outputCount incremental pictures, with a final
// picture containing sucCount successors. Only the first
// labelCount successor points will be labelled..
picture[] pics(diagram dia, int sucCount, int outputCount, int labelCount) {
  picture pics[];
  picture pic = currentpicture.copy();
  pair[] ss = sucs(dia,sucCount);
  pair c2 = dia.c;
  for (int i=1; i<ss.length; ++i) {
    draw(pic,c2--dia.d);

    dot(ss[i]);
    if (i <= labelCount) {
      label(pic,format("$%d$",i),ss[i],SW);
    }
    
    if (i <= outputCount) {
      pics.push(pic.copy());
    }

    c2 = extension(dia.b,ss[i],dia.a,c2);
    draw(pic,dia.b--c2);

    dot(c2);
    if (i <= labelCount) {
      label(pic,format("$C_%d$",i),c2,S);
    }

    if (i <= outputCount) {
      pics.push(pic.copy());
    }
  }
  pics.push(pic.copy());
  return pics;
}

diagram dia;
dia.a    = (0,0);
dia.b    = (2,3);
dia.zero = (4,0);
dia.c    = extension(dia.b,dia.zero,(0,-1),(1,-1));
dia.d    = dia.a + 0.4*(dia.b-dia.a);

drawDiagram(dia);

picture[] pics = pics(dia,800,100,4);

// Draw the first four interations in 2 columns.
currentpicture = pics[0];
add(pics[1].fit(),(5,0));
add(pics[2].fit(),(0,-5));
add(pics[3].fit(),(5,-5));

shipout(prefix="InfinitySteps",format="pdf");
shipout(pic=pics[200],"InfinityFull",format="pdf");
