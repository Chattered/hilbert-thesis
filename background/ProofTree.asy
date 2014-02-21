void box(pair topleft,real w,real h,string s) {
  draw(topleft--topleft+(w,0)--topleft+(w,h)--topleft+(0,h)--topleft);
  label(s,(topleft.x+w/2,topleft.y+h/2));
}

unitsize(30);

real w = 2;
real h = 1;
real g = 0.1;

box((0,0),w,h,"$G$");

box((-1.5,-2),w,h,"$G$");
box((-1.5,-2-h-g),w/2,h,"");
box((-1.5+w/2,-2-h-g),w/2,h,"$P$");

box((1.5,-2),w,h,"$G$");
box((1.5,-3-g),w/2,h,"Case");
box((1.5+w/2,-3-g),w/2,h,"$\neg P$");

box((0,-5),w,h,"$G$");
box((0,-6-g),w/2,h,"Case");
box((w/2,-6-g),w/2,h,"$\neg P$");
box((0,-7-g),w/2,h,"");
box((w/2,-7-g),w/2,h,"$Q$");

box((3,-5),w,h,"$G$");
box((3,-6-g),w/2,h,"Case");
box((3+w/2,-6-g),w/2,h,"$\neg P$");
box((3,-7-g),w/2,h,"Case");
box((3+w/2,-7-g),w/2,h,"$\neg Q$");

box((1.5,-9),w,h,"$G$");
box((1.5,-10-g),w/2,h,"Case");
box((1.5+w/2,-10-g),w/2,h,"$\neg P$");
box((1.5,-11-g),w/2,h,"Case");
box((1.5+w/2,-11-g),w/2,h,"$\neg Q$");
box((1.5,-12-g),w/2,h,"");
box((1.5+w/2,-12-g),w/2,h,"$R$");

box((4.5,-9),w,h,"$G$");
box((4.5,-10-g),w/2,h,"Case");
box((4.5+w/2,-10-g),w/2,h,"$\neg P$");
box((4.5,-11-g),w/2,h,"Case");
box((4.5+w/2,-11-g),w/2,h,"$\neg Q$");
box((4.5,-12-g),w/2,h,"Case");
box((4.5+w/2,-12-g),w/2,h,"$\neg R$");

draw((w/2,-0)--(-0.5,-1));
draw((w/2,-0)--(2.5,-1));
draw((2.5,-3.1)--(1,-4));
draw((2.5,-3.1)--(4,-4));
draw((4,-7.1)--(2.5,-8));
draw((4,-7.1)--(5.5,-8));

shipout(format="pdf");
