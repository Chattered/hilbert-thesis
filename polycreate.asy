import geometry;
import animation;

struct polypair {
  pair[] fstPoly;
  pair[] sndPoly;
}

path polyPath(pair[] poly) {
  path p;
  for (pair pt : poly) {
    p = p -- pt;
  }
  p = p -- poly[0];
  return p;
}

void rotate(pair[] ps) {
  pair pt = ps.pop();
  ps.insert(0,pt);
}

void backRotate(pair[] ps) {
  pair pt = ps[0];
  ps.push(pt);
  ps.delete(0);
}

void rotateToTri(pair[] ps) {
  while (collinear(ps[0]-ps[1], ps[1]-ps[2])) {
    rotate(ps);
  }
}

void rotateToNonCircle(pair[] ps) {
  while (inside(ps[0]--ps[1]--ps[2]--cycle,ps[-1])) {
    backRotate(ps);
  }         
}

bool anyInsideTri(pair p1, pair p2, pair p3, pair[] ps) {
  for (pair p : ps) {
    if (p != p1 && p != p2 && p != p3) {
      if (inside(p1--p2--p3--cycle, p))
        return true;
    }
  }
  return false;
}

bool insidePoly(pair[] leftPoly, pair[] rightPoly) {
  for (pair p : leftPoly) 
    if (inside(polyPath(rightPoly)--cycle,p))
      return true;
  return false;
}

pair squeeze(pair p1, pair p2, pair p3, pair[] poly) {
  int i = 0;
  for (pair p : poly) {
    if (p != p1 && p != p2) {
      pair q = extension(p2,p3,p1,p);
      pair[] poly2 = copy(poly);
      poly2.delete(i);
      if (inside(p1--p2--p3--cycle, p) && !anyInsideTri(p1,p2,q,poly2)) {
        return p;
      }      
    }
    ++i;
  }
  abort("No squeeze point!");
  return (0,0);
}

polypair split(pair[] poly) {  
  rotateToTri(poly);
  pair squeezePt = squeeze(poly[0],poly[1],poly[2],poly);
  pair[] poly1;
  pair[] poly2;

  int i=0;
  while (poly[i] != squeezePt) {
    poly1.push(poly[i]);
    ++i;
  }
  poly1.push(poly[i]);
  poly1.cyclic = true;

  while (poly[i] != poly[0]) {
    poly2.push(poly[i]);
    ++i;
  }
  poly2.push(poly[0]);
  poly2.cyclic = true;

  if (poly1.length == poly.length || poly2.length == poly.length) {
    write(poly);
    abort("Split failed");
  }
  
  polypair pair = new polypair;
  pair.fstPoly = poly1;
  pair.sndPoly = poly2;

  return pair;
}

pair[][] subdivide(pair[] poly) {
  pair[][] subdivisions;
  if (poly.length > 3) {
    rotateToTri(poly);
    rotateToNonCircle(poly);  
    polypair polypair = split(poly);
    subdivisions.append(subdivide(polypair.fstPoly));
    subdivisions.append(subdivide(polypair.sndPoly));
  }
  subdivisions.push(poly);
  return subdivisions;
}

void subdivide2(pair[] poly, pair[][] base, picture[] pics, pen additive, pen subtractive) {
  picture newpic;
  unitsize(newpic, 100);
  for (pair[] poly : base) {
    fill(newpic,polyPath(poly)--cycle,lightgray);
  }
  if (poly.length > 3) {
    rotateToTri(poly);
    rotateToNonCircle(poly);  

    polypair polypair = split(poly);

    if (insidePoly(polypair.fstPoly,polypair.sndPoly)) {
      subdivide2(polypair.sndPoly, base, pics, additive, subtractive);
      fill(newpic,polyPath(poly)--cycle,additive);
      pair[][] newbase = copy(base);
      newbase.push(poly);
      subdivide2(polypair.fstPoly, newbase, pics, subtractive, additive);
    }

    else if (insidePoly(polypair.sndPoly,polypair.fstPoly)) {
      subdivide2(polypair.fstPoly, base, pics, additive, subtractive);
      fill(newpic,polyPath(poly)--cycle,additive);
      pair[][] newbase = copy(base);
      newbase.push(poly);
      subdivide2(polypair.sndPoly, newbase, pics, subtractive, additive);
    }

    else {
      subdivide2(polypair.fstPoly, base, pics, additive, subtractive);
      pair[][] newbase = copy(base);
      newbase.push(poly);
      subdivide2(polypair.sndPoly, base, pics, additive, subtractive);
      fill(newpic,polyPath(poly)--cycle,additive);
    }
  }
  else {
    fill(newpic,polyPath(poly)--cycle,additive);
  }
  
  pics.push(newpic);
}

void subdivide3(pair[] poly, pair[][] shadow, picture[] pics) {
  picture newpic;
  unitsize(newpic, 100);
  for (pair[] poly : shadow) {
    fill(newpic,polyPath(poly)--cycle,lightgray);
  }
  fill(newpic,polyPath(poly)--cycle,gray);
  pics.push(newpic);
  
  if (poly.length > 3) {
    rotateToTri(poly);
    rotateToNonCircle(poly);  

    polypair polypair = split(poly);

    pair[] innerPoly;
    pair[] outerPoly;
    if (insidePoly(polypair.fstPoly,polypair.sndPoly)) {
      innerPoly = polypair.fstPoly;
      outerPoly = polypair.sndPoly;
    }
    else if (insidePoly(polypair.sndPoly,polypair.fstPoly)) {
      innerPoly = polypair.sndPoly;
      outerPoly = polypair.fstPoly;
    }
    else {
      picture newpic;
      pair[][] newshadow = copy(shadow);
      newshadow.push(polypair.sndPoly);
      fill(newpic, polyPath(polypair.fstPoly)--cycle, p=blue);
      pics.push(newpic);
      subdivide3(polypair.fstPoly, newshadow, pics);

      newshadow = copy(shadow);
      newshadow.push(polypair.fstPoly);
      fill(newpic, polyPath(polypair.sndPoly)--cycle, p=blue);
      pics.push(newpic);
      subdivide3(polypair.sndPoly, newshadow, pics);

      return;
    }

    picture newpic;
    fill(newpic, polyPath(poly)--cycle, p=blue);
    fill(newpic, polyPath(innerPoly)--cycle, p=gray);
    pics.push(newpic);
    subdivide3(outerPoly, shadow, pics);
    pair[][] newshadow = copy(shadow);
    newshadow.push(outerPoly);
    subdivide3(innerPoly, newshadow, pics);
  }
}


//pair ps[] = {(1,0),(0,1),(1,2),(1,4),(0,5),(2,6),(4,6),(4,2),(3,4),(2,3),(2,1),(3,0.5),(3.5,1),(2.5,2),(3,2.5),(4,1),(3,0)};
pair ps[] = {(1,0),(1,3),(0,2.5),(0,4.5),(2.5,5),(2.5,4),(2,3.5),(2,1),(4,3),(4,5.5),(2,5.5),(2,7),(3.5,7),(6.5,10),(6.5,12),(7,12.5),(7,10),(14,10),(14,4.5),(6,4.5),(5.5,5),(6,5.5),(6.5,5),(13.5,5),(13.5,9.5),(7,9.5),(7,6),(12,6),(12,8.5),(8.5,8.5),(8.5,7),(10,7),(10,7.5),(9,7.5),(9,8),(11,8),(11,6.5),(8,6.5),(8,9),(13,9),(13,5.5),(6.5,5.5),(6.5,9.5),(4,7),(5.5,6),(4.5,5.5),(4.5,3),(10,3),(10,4),(12.5,4),(12.5,1),(9,1),(10,2),(4,2),(2,0)};
ps.cyclic = true;

unitsize(20);
draw(polyPath(ps));
shipout("foo","pdf");

//pair[][] base;
//picture[] pics;
//subdivide(ps,base,pics);

// animation a;

// a.prefix="foo";
// for (picture pic : pics) {
//   draw(pic,polyPath(ps)--cycle,p=red);
//   a.add(pic);
// }

// a.export("foo");
// a.merge(delay=10);
// a.shipout("foo");
