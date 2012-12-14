picture basePicture;
basePicture.size(200);
currentpicture = basePicture;
pair[] tri = {(0,0),(4,0),(2,3)};
draw(tri[1]--tri[2]--tri[0],p=dashed);
draw(tri[0]--tri[1]);
dot("$A$",tri[0],W);
dot("$B$",tri[1],E);
dot("$C$",tri[2],N);

void seg(pair p1,pair p2,pair d1,pair d2) {
  draw(p1--p2,p=red);
  dot("$P_i$",p1,d1);
  dot("$P_{i+1}$",p2,d2);
}

picture pic1;
unitsize(pic1,20);
pic1.add(basePicture);
currentpicture=pic1;
seg((0,-1),(4,3),SW,NE);
dot(extension((0,-1),(4,3),tri[0],tri[1]),p=red);

picture pic2;
unitsize(pic2,20);
pic2.add(basePicture);
currentpicture=pic2;
seg((0,-1),extension((0,-1),(4,3),tri[1],tri[2]),SW,NE);
dot(extension((0,-1),(4,3),tri[0],tri[1]),p=red);

picture pic3;
unitsize(pic3,20);
pic3.add(basePicture);
currentpicture=pic3;
seg((4,3),(0,-1),NE,SW);
dot(extension((0,-1),(4,3),tri[0],tri[1]),p=red);

picture pic4;
unitsize(pic4,20);
pic4.add(basePicture);
currentpicture=pic4;
seg((4,3),(0,-1),NE,SW);
dot(extension((0,-1),(4,3),tri[0],tri[1]),p=red);

picture pic5;
pic5.unitsize(20);
pic5.add(basePicture);
currentpicture=pic5;
seg(extension((0,-1),(4,3),tri[1],tri[2]),(0,-1),NE,SW);
dot(extension((0,-1),(4,3),tri[0],tri[1]),p=red);

picture pic6;
pic6.unitsize(20);
pic6.add(basePicture);
currentpicture=pic6;
seg(extension((0,-1),(4,3),(0,2),(1.5,1.5)),(0,-1),NW,SW);
dot(extension((0,-1),(4,3),tri[0],tri[1]),p=red);

picture pic;
unitsize(pic,20);
add(pic,pic1.fit(),(0,0));
add(pic,pic2.fit(),(6,0));
add(pic,pic3.fit(),(12,0));
add(pic,pic4.fit(),(0,-5));
add(pic,pic5.fit(),(6,-5));
add(pic,pic6.fit(),(12,-5));
shipout(pic,prefix="CrossingCases",format="pdf");

picture pic7;
pic7.unitsize(20);
pic7.add(basePicture);
currentpicture=pic7;
draw(extension((0,-1),(4,3),tri[0],tri[1])--(1.75,-1.5),p=dashed+red);
seg(extension((0,-1),(4,3),tri[0],tri[1]),(4,3),SW,NE);
dot("$P_{n-1}$",(1.75,-1.5),S);
label("(a)",tri[0]--tri[1],25*N);

picture pic8;
pic8.unitsize(20);
pic8.add(basePicture);
currentpicture=pic8;
draw(extension((0,-1),(4,3),tri[0],tri[1])--(1.75,1.5),p=dashed+red);
seg(extension((0,-1),(4,3),tri[0],tri[1]),(4,3),SW,NE);
dot("$P_{n-1}$",(1.75,1.5),NNE);
label("(b)",tri[0]--tri[1],25*N);

picture pic9;
pic9.unitsize(20);
pic9.add(basePicture);
currentpicture=pic9;
draw(extension((0,-1),(4,3),tri[0],tri[1])--(3,0)--(1.75,-1.5),p=dashed+red);
seg(extension((0,-1),(4,3),tri[0],tri[1]),(4,3),SW,NE);
dot("$P_{n-1}$",(3,0),SE);
dot("$P_{n-2}$",(1.75,-1.5),S);
label("(c)",tri[0]--tri[1],25*N);

picture pic;
unitsize(pic,20);
add(pic,pic7.fit(),(0,0));
add(pic,pic8.fit(),(6,0));
add(pic,pic9.fit(),(12,0));
shipout(pic,prefix="CrossingContext",format="pdf");

// picture pic;
// pic.size(100);
// pic.add(basePicture);
// currentpicture=pic;
// draw((0,-1)--extension((0,-1),(4,3),tri[0],tri[1])--tri[1]--extension((0,-1),(4,3),tri[1],tri[2])--(4,3),p=red);
// dot("$P$",(0,-1),SW);
// dot(extension((0,-1),(4,3),tri[0],tri[1]));
// dot(extension((0,-1),(4,3),tri[1],tri[2]));
// dot("$Q$",(4,3),NE);

// picture pic;
// unitsize(pic,20);
// add(pic,pic1.fit(),(6,0));
// add(pic,pic2.fit(),(0,0));
// shipout(pic,prefix="foo",format="pdf");


// //shipout(prefix="Crossing1",format="pdf");
