void box(pair topleft,real w,real h,string s) {
  draw(topleft--topleft+(w,0)--topleft+(w,h)--topleft+(0,h)--topleft);
  label(s,(topleft.x+w/2,topleft.y+h/2));
}

unitsize(30);

real w = 2;
real h = 1;
real g = 0.1;

box((0,0),w,h,"$G$");
box((0,-1.1),w/2,h,"Case");
box((w/2,-1.1),w/2,h,"$P$");

box((-1.5,-3),w,h,"$G$");
box((-1.5,-3-h-g),w/2,h,"");
box((-1.5+w/2,-3-h-g),w/2,h,"$P$");

box((1.5,-3),w,h,"$G$");
box((1.5,-4-g),w/2,h,"Case");
box((1.5+w/2,-4-g),w/2,h,"$\neg P$");

box((0,-6),w,h,"$G$");
box((0,-7-g),w/2,h,"Case");
box((w/2,-7-g),w/2,h,"$\neg P$");
box((0,-8-g),w/2,h,"");
box((w/2,-8-g),w/2,h,"$Q$");

box((3,-6),w,h,"$G$");
box((3,-7-g),w/2,h,"Case");
box((3+w/2,-7-g),w/2,h,"$\neg P$");
box((3,-8-g),w/2,h,"Case");
box((3+w/2,-8-g),w/2,h,"$\neg Q$");

box((1.5,-10),w,h,"$G$");
box((1.5,-11-g),w/2,h,"Case");
box((1.5+w/2,-11-g),w/2,h,"$\neg P$");
box((1.5,-12-g),w/2,h,"Case");
box((1.5+w/2,-12-g),w/2,h,"$\neg Q$");
box((1.5,-13-g),w/2,h,"");
box((1.5+w/2,-13-g),w/2,h,"$R$");

box((4.5,-10),w,h,"$G$");
box((4.5,-11-g),w/2,h,"Case");
box((4.5+w/2,-11-g),w/2,h,"$\neg P$");
box((4.5,-12-g),w/2,h,"Case");
box((4.5+w/2,-12-g),w/2,h,"$\neg Q$");
box((4.5,-13-g),w/2,h,"");
box((4.5+w/2,-13-g),w/2,h,"$R$");

draw((w/2,-1.1)--(-0.5,-2));
draw((w/2,-1.1)--(2.5,-2));
draw((2.5,-4.1)--(1,-5));
draw((2.5,-4.1)--(4,-5));
draw((4,-8.1)--(2.5,-9));
draw((4,-8.1)--(5.5,-9));

shipout(format="pdf");
