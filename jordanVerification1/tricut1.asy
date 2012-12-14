unitsize(30);

draw((0,0)--(3,0)--(2,2)--cycle);
draw((3,0)--(5,0));

pair P = (1.7,0.8);

dot("$A$",(0,0),SW);
dot("$B$",(3,0),S);
dot("$C$",(2,2),N);
dot("$P$",P,N);
dot("$Q$",(5,0),NE);

draw(extension((5,0),P,(5,-0.5),(6,-0.5))--extension((5,0),P,(-0.5,0),(-0.5,1)),p=dashed);
dot("$X$",extension((3,0),(2,2),(5,0),P),NE);

shipout(format="pdf");

