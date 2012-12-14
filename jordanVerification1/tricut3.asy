unitsize(30);

draw((0,0)--(3,0)--(2,2)--cycle);

pair P = (1.7,0.8);
dot("$A$",(0,0),SW);
dot("$B$",(3,0),S);
dot("$C$",(2,2),NW);
dot("$P$",P,W);

draw(extension((2,2),P,(0,2.5),(1,2.5))--extension((2,2),P,(0,-0.5),(1,-0.5)),p=dashed);
dot("$X$",extension((2,2),P,(0,0),(3,0)),SE);

shipout(format="pdf");
