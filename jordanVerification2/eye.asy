unitsize(30);

void lookat(pair pos, pair target, pen pen=currentpen, bool los=true) {
  pen oldpen = currentpen;
  currentpen = pen;
  void eye(transform t) {
    path iris = E..N..W;
    real iris1 = 0.75;
    real iris2 = 1.25;
    real pupil1 = 0.85;
    real pupil2 = 1.15;
    
    pair outer1 = (0.5,1.2);
    pair outer2 = (-0.5,1.2);
    pair meet = extension(outer1,point(iris,iris1),outer2,point(iris,iris2));

    t = t*inverse(shift(point(iris,1)));
    draw(t*(subpath(E..N..W,iris1,iris2)));
    draw(t*(outer1--meet--outer2));
    fill(t*(point(iris,pupil1){SSW}..point(iris,pupil2){NNW}--subpath(iris,pupil1,pupil2)--cycle));
    if (los) {
      draw(t*(point(iris,1))--target,p=pen+dashed);
    }
  }

  pair targetDir = target-pos;
  real length = sqrt(targetDir.x*targetDir.x + targetDir.y*targetDir.y);
  pair normalDir = targetDir / length;
  real angle;
  if (normalDir.x == 0) {
    if (normalDir.y > 0) {
      angle = radians(90);
    }
    else if (normalDir.y < 0) {
      angle = radians(-90);
    }
    else {
      angle = 0;
    }
  }
  else {
    angle = atan(normalDir.y/normalDir.x);
    if (normalDir.x < 0) {
      angle = angle + radians(180);
    }
  }
  eye(shift(pos)*rotate(degrees(angle)-90)*scale(0.3));
  currentpen = oldpen;
}

pair raycast(pair pos, pair target, path p) {
  pair[] inters = intersectionpoints(pos--target,p);
  inters.push(target);
  inters = sort(inters,new bool(pair p,pair q) {return (arclength(pos--p) < arclength(pos--q));});
  return inters[0];
}

bool pointEq(pair p, pair q) {
  return (arclength(p--q) < 0.001);
}

bool inRangeHack(pair p) {
  return (p.x < 100 && p.y < 100 && p.x > -100 && p.y > -100);
}

struct eye {
  pair pos,target;
}

void drawEye(eye e, pen pen=currentpen,bool los=true) {
  lookat(e.pos,e.target,pen,los);
}

pair[] squeeze(eye e, pair newTarget, pair[] ps, bool show=false) {
  if (show) {
    dot(newTarget);
  }
  pair[] ss;
  ss.push(e.pos);
  for (pair p : ps) {
    pair s = ss[ss.length-1];
    if (inside(s--e.target--newTarget--cycle,p)) {
      pair s2 = extension(p,newTarget,e.pos,e.target);
      if (!pointEq(e.target,s2) && inRangeHack(s2)) {
        if (show) {
          dot(p);
          pair hit = extension(newTarget,p,e.pos,e.target);
          draw(newTarget--hit,p=dashed);
          dot(hit);
        }          
        ss.push(s2);
      }
    }
  }
  
  return reverse(ss);
}

path pathOfPolyseg(pair[] ps) {
  path polyseg;
  for (pair p:ps) {
    polyseg = polyseg -- p;
  }
  return (polyseg -- cycle);
}

void showSqueeze(eye e, pair newTarget, pair[] ps, pen pen=currentpen) {
  pen oldpen = currentpen;
  currentpen = pen;
  pair[] ss = squeeze(e, newTarget, ps);
  dot(ss[0],p=red);
  draw(ss[0]--newTarget,p=red+dashed);
  dot(intersectionpoints(ss[0]--newTarget,pathOfPolyseg(ps))[0],p=red);
  if (ss.length > 1) {
    for (pair p : ss[1:ss.length-1]) {
      dot(p);
      draw(p--newTarget,p=dashed);
    }
  }
  currentpen = oldpen;
}

pair three(pair p, pair q) {
  //return midpoint(p--q);
  return p + 0.5*(q - p);
}

pair squeeze2(eye e, pair newTarget, pair[] ps, bool show=false) {
  return three(e.target,squeeze(e,newTarget,ps,show)[0]);
}

int next(int i, pair[] ps) {
  if (i+1 == ps.length) {
    return 0;
  }
  else {
    return i+1;
  }
}

int prev(int i, pair[] ps) {
  if (i == 0) {
    return ps.length-1;
  }
  else {
    return i-1;
  }
}

eye convexMove1(eye e,pair[] ps,int i,bool show=false) {
  eye newEye;
  newEye.pos = squeeze2(e,ps[i],ps,show);
  newEye.target = ps[i];
  return newEye;
}

eye convexMove2(eye e,pair[] ps,int i, bool show=false) {
  eye e2;
  e2.pos = ps[next(i,ps)];
  e2.target = ps[i];

  eye newEye;
  newEye.pos = e.pos;
  newEye.target = squeeze2(e2,e.pos,ps,show);
  return newEye;
}

pair extend(pair p, pair q) {
  return p + (0.2 * q);
}

pair concaveExtend(eye e,pair[] ps,int i) {
  return three(ps[i],raycast(ps[i]+0.001*(ps[i]-ps[prev(i,ps)]),extend(ps[i], ps[i]-ps[prev(i,ps)]),pathOfPolyseg(ps)));
}

eye concaveMove1(eye e, pair[] ps, int i, bool show=false) {
  eye newEye;
  pair p = concaveExtend(e,ps,i);
  newEye.pos = squeeze2(e,p,ps,show);
  newEye.target = p;
  return newEye;
}

eye concaveMove2(eye e, pair[] ps, int i, bool show=false) {
  eye e2;
  e2.pos = ps[next(i,ps)];
  e2.target = ps[i];
  eye newEye;
  newEye.pos = e.target;
  newEye.target = squeeze2(e2,e.target,ps,show);
  return newEye;
}

bool convex(eye e, pair[] ps, int i) {
  return (intersectionpoints(e.pos--ps[next(i,ps)],ps[prev(i,ps)]--ps[i]).length == 0);
}

eye move1(eye e, pair[] ps, int i, bool show=false) {
  if (convex(e, ps, i)) {
    return convexMove1(e,ps,i,show);
  }
  else {
    return concaveMove1(e,ps,i,show);
  }
}

eye move2(eye e, pair[] ps, int i, bool show=false) {
  if (convex(e, ps, i)) {
    return convexMove2(e,ps,i,show);
  }
  else {
    return concaveMove2(e,ps,i,show);
  }
}

