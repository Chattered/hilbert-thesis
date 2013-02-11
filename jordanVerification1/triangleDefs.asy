usepackage("asycolors");

picture basePicture;
currentpicture = basePicture;
unitsize(30);
pair[] tri = {(0,0),(4,0),(2,3)};
draw(tri[1]--tri[2]--tri[0]--cycle);
dot("$A$",tri[0],NW);
dot("$B$",tri[1],NE);
dot("$C$",tri[2],2*N);

picture pic1;
unitsize(pic1,30);
pic1.add(basePicture);
currentpicture=pic1;
pair X = midpoint(tri[0]--tri[1]);
pair Y = midpoint(tri[0]--tri[2]);
pair P = midpoint(X--Y);
dot("$X$",X,S);
dot("$Y$",Y,NW);
dot("$P$",P);
draw(X--Y,p=dashed);

picture pic2;
unitsize(pic2,30);
currentpicture=pic2;

pair Abot = extension(tri[0],tri[2],(0,-1),(1,-1));
pair Aleft = extension(Abot,Abot+(0,1),tri[0],tri[1]);
pair Bbot = extension(tri[1],tri[2],(0,-1),(1,-1));
pair Bright = extension(Bbot,Bbot+(0,1),tri[0],tri[1]);
pair Cright = extension(tri[0],tri[2],tri[2]+(0,1),tri[2]+(1,1));
pair Cleft = extension(tri[1],tri[2],tri[2]+(0,1),tri[2]+(1,1));
draw(tri[0]--Abot);
draw(tri[0]--Aleft);
draw(tri[1]--Bbot);
draw(tri[1]--Bright);
draw(tri[2]--Cleft);
draw(tri[2]--Cright);

//currentpen = red;
pen halflightgreen = opacity(0.5)+lightgrey;
pen halfdarkgreen = opacity(0.5)+darkgrey;
pen halflightred = opacity(0.5)+lightgrey;
pen halfdarkred = opacity(0.5)+darkgrey;
pen halflightblue = opacity(0.5)+lightgrey;
pen halfdarkblue = opacity(0.5)+darkgrey;

halfdarkgreen = halflightgreen;
halfdarkred = halflightred;
halfdarkblue = halflightblue;

pair topright=extension(Bbot,Bright,Cleft,Cright);
pair topleft =extension(Abot,Aleft,Cleft,Cright);

pair tangent = tri[0]-tri[2];
pair normalac = (-tangent.y,tangent.x);

tangent = tri[2]-tri[1];
pair normalbc = (-tangent.y,tangent.x);

string b="Luminosity";
fill(Aleft--Bright--topright--topleft--cycle,opacity(0.5,blend=b)+red);
fill(Abot--Cright--topright--Bbot--cycle,opacity(0.5,blend=b)+green);
fill(Bbot--Cleft--topleft--Abot--cycle,opacity(0.5,blend=b)+blue);

pic2.add(basePicture);
add(pic2,pic1.fit(),(-6,0));

shipout(format="pdf");

