unitsize(50);

draw((0,0)--(2,0));
draw((2,0)--(3,0),p=dashed);
draw((3,0)--(5,0));
draw((5,0)--(6,0),p=dashed);
draw((6,0)--(6.5,0));

dot((0,0));
dot((0.75,0));
dot((1.5,0));

label("$f\ 0$",(0,0),S);
label("$f\ 1$",(0.75,0),S);
label("$f\ 2$",(1.5,0),S);

dot((3.5,0));
dot((4,0));
dot((4.8,0));

label("$f\ n$",(3.5,0),S);
label("$P$",(4,0),S);
label("$f\ (n+1)$",(4.8,0),S);

dot((6.5,0));

label("$f\ (|Ps|-1)$",(6.5,0),S);

shipout(format="pdf");
