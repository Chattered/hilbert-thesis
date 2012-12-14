import "../labelledPoints" as labelledPoints;
unitsize(30);

LPt[] ps = {LPt((0,0),"$P_1$",SW),
            LPt((0,7),"$P_2$",NW),
            LPt((8,7),"$P_3$",NE),
            LPt((8,2),"$P_4$",SE),
            LPt((9,2),"$P_5$",SE),
            LPt((9,1),"$P_6$",SE),
            LPt((8,1),"$P_7$",SE),
            LPt((8,0),"$P_8$",SE),
            LPt((7,0),"$P_9$",SE),
            LPt((7,1),"$P_{10}$",SE),
            LPt((6,1),"$P_{11}$",SE),
            LPt((6,2),"$P_{12}$",SW),
            LPt((7,2),"$P_{13}$",SW),
            LPt((7,6),"$P_{14}$",SW),
            LPt((6,6),"$P_{15}$",SW),
            LPt((6,6),"$P_{16}$",SW),
            LPt((6,3),"$P_{17}$",SW),
            LPt((5,3),"$P_{18}$",SW),
            LPt((5,0),"$P_{19}$",SW),
            LPt((4,0),"$P_{20}$",SW),
            LPt((4,5),"$P_{21}$",SW),
            LPt((5,5),"$P_{22}$",SW),
            LPt((5,6),"$P_{23}$",SW),
            LPt((1,6),"$P_{24}$",NW),
            LPt((1,5),"$P_{25}$",SW),
            LPt((3,5),"$P_{26}$",SW),
            LPt((3,4),"$P_{27}$",SW),
            LPt((1,4),"$P_{28}$",SW),
            LPt((1,3),"$P_{29}$",SW),
            LPt((1,3),"$P_{30}$",SW),
            LPt((3,3),"$P_{31}$",SW),
            LPt((3,0),"$P_{32}$",SW),
            LPt((2,0),"$P_{33}$",SW),
            LPt((2,2),"$P_{34}$",SW),
            LPt((1,2),"$P_{35}$",SW),
            LPt((1,0),"$P_{36}$",SW),
            LPt((0,0),"$$",SW)};

pair[] inters;
pair[] qs;
for (int i=2; i < ps.length - 1; ++i) {
  pair inter = extension(ps[0].pt,ps[i].pt,ps[1].pt,ps[2].pt);
  if (inside(ps[1].pt--ps[2].pt--cycle,inter) && inter != ps[1].pt && inter != ps[2].pt) {
    inters.push(inter);
    qs.push(ps[i].pt);
  }
}

pair minInter = inters[0];
pair minPt    = qs[0];
for (pair inter : inters) {
  for (int i=0; i<inters.length; ++i) {
    if (inside(ps[1].pt--minInter--cycle,inters[i])) {
      minInter = inters[i];
      minPt    = qs[i];
    }
  }
}

path poly1;
int i=0;
while (ps[i].pt != minPt) {
  poly1 = poly1--ps[i].pt;
  ++i;
}
poly1 = poly1--minPt;

path poly2;
while (i < ps.length) {
  poly2 = poly2 -- ps[i].pt;
  ++i;
}

fill(poly1--cycle,p=lightgreen);
fill(poly2--cycle,p=lightblue);

drawPoly(...ps);
dotLPt(ps[0],ps[1],ps[2]);
for (int i=0; i<inters.length; ++i) {
  if (inters[i] != minInter) {
    draw(ps[0].pt--inters[i],p=dashed);
    dot(inters[i]);
    dot(qs[i]);
  }
}

dot("$P_m$",minPt,p=red,NW);
dot("$X$",minInter,p=red,N);
dot("$P_m'$",qs[7],p=red,ENE);
dot("$X'$",inters[7],p=red,N);
draw(ps[0].pt--minInter,p=dashed+red);

shipout(format="pdf");
