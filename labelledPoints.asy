struct LPt {
  pair pt;
  string label;
  pair dir;

  void operator init(pair pt, string label, pair dir) {
    this.pt = pt;
    this.label = label;
    this.dir = dir;
  }
}

void drawPoly(pen pen = currentpen ... LPt[] pts) {
  path p;
  for (LPt pt : pts) {
    p = p--pt.pt;
  }
  draw(p,p=pen);
}

void fillPoly(pen pen = currentpen, LPt pt ... LPt[] pts) {
  path p = pt.pt;
  for (LPt pt2 : pts) {
    p = p--pt2.pt;
  }
  p = p--cycle;
  fill(p,p=pen);
}

void dotLPt(... LPt[] pts) {
  for (LPt pt : pts) {
    dot(pt.label, pt.pt, pt.dir);
  }
}

