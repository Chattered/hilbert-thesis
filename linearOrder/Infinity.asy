pair[] tri = {(0,0),(4,0),(2,3)};
draw(tri[0]--tri[1]--tri[2]--tri[0]);
dot("$A$",tri[0],W);
dot("$0$",tri[1],E);
dot("$B$",tri[2],N);

pair c = extension(tri[1],tri[2],(0,-1),(1,-1));
pair d = extension(tri[0],tri[2],(0,1),(1,1));

draw(tri[1]--c);
draw(c--tri[0],p=dashed);
dot("$C$",c,SE);
dot("$D$",d,NW);

pair[] ns;
picture basePic = currentpicture;
picture full = currentpicture;
full.size(400);

pair c2 = c;

picture[] steps;

for (int i=0; i<300; ++i) {
  picture newpic;
  newpic.add(full);
  newpic.unitsize(50);
  pair n = extension(c2,d,tri[0],tri[1]);
  draw(c2--d);
  dot(c2);
  draw(tri[2]--c2);
  dot(extension(tri[2],c2,tri[0],tri[1]));
  if (i < 4) {
    dot(format("$%d$",i+1),n,SW);
    if (i>0) {dot(format("$C_%d$",i),c2,S);}
  }

  steps.push(newpic);
  
  //shipout(pic=newpic,prefix=format("InfinityStep%d",i),format="pdf");

  draw(pic=full,c2--d);
  dot(pic=full,c2);
  draw(pic=full,tri[2]--c2);
  dot(pic=full,extension(tri[2],c2,tri[0],tri[1]));
  dot(pic=full,n);

  c2 = extension(tri[2],n,tri[0],c2);
  ns.push(n);
}

currentpicture = steps[0];
add(steps[1].fit(),(5,0));
add(steps[2].fit(),(0,-5));
add(steps[3].fit(),(5,-5));

shipout(pic=steps[0],prefix="InfinitySteps",format="pdf");
shipout(pic=full,prefix="InfinityFull",format="pdf");
