file fin = input("/home/mediafoo/mazeWalls");

real cellWidth = 5;
real wallWidth = 5;
int mazeWidth = 1000;
draw((-cellWidth,-cellWidth),p=lightblue);
real r = (cellWidth+wallWidth)*mazeWidth-wallWidth;
draw((r+cellWidth,r+cellWidth),p=lightblue);

int walls[][][];

struct segment {
  pair x;
  pair y;

  void operator init(pair x, pair y) {
    this.x = x;
    this.y = y;    
  }
}

void pushnew(segment[] ps, segment p) {
  bool found=false;
  for (segment p2: ps) {
    if ((p.x == p2.x && p.y == p2.y) || (p.x == p2.y && p.y == p2.x)) {
      found=true;
    }
  }
  if (!found) {
    ps.push(p);
  }
}

int i = 0;
for (int y=0; y<mazeWidth; ++y) {
  int[][] row;
  for (int x=0; x<mazeWidth; ++x) {
    int[] cell;
    int w = fin;
    cell.push(w);

    w = fin;
    cell.push(w);    

    w = fin;
    cell.push(w);    

    w = fin;
    cell.push(w);

    row.push(cell);
  }
  walls.push(row);
}

segment[] ps;

for (int y=0; y<mazeWidth; ++y) {
  for (int x=0; x<mazeWidth; ++x) {
    write(format("%d",y));
    write(format("%d",x));
    write("=====");
    real cx = x * (cellWidth+wallWidth);
    real cy = y * (cellWidth+wallWidth);

    if (walls[y][x][0] == 0 && walls[y][x][1] == 0) {
      pushnew(ps,segment((cx+cellWidth,cy),
                         (cx+cellWidth,cy-wallWidth)));
    }
    if (walls[y][x][2] == 0 && walls[y][x][1] == 0) {
      pushnew(ps,segment((cx+cellWidth,cy+cellWidth),
                         (cx+cellWidth+wallWidth,cy+cellWidth)));
    }
    if (walls[y][x][2] == 0 && walls[y][x][3] == 0) {
      pushnew(ps,segment((cx,cy+cellWidth),
                         (cx,cy+cellWidth+wallWidth)));
    }
    if (walls[y][x][0] == 0 && walls[y][x][3] == 0) {
      pushnew(ps,segment((cx,cy),(cx-wallWidth,cy)));
    }
    
    if (walls[y][x][0] == 1) {
      pushnew(ps,segment((cx,cy),(cx+cellWidth,cy)));
      if (walls[y][x][1] == 0) {
        pushnew(ps,segment((cx+cellWidth,cy),
                           (cx+cellWidth+wallWidth,cy)));
      }
      if (walls[y][x][3] == 0) {
        pushnew(ps,segment((cx,cy),(cx-wallWidth,cy)));
      }
    }
    if (walls[y][x][1] == 1) {
      pushnew(ps,segment((cx+cellWidth,cy),
                         (cx+cellWidth,cy+cellWidth)));
      if (walls[y][x][0] == 0) {
        pushnew(ps,segment((cx+cellWidth,cy),
                           (cx+cellWidth,cy-wallWidth)));
      }
      if (walls[y][x][2] == 0) {
        pushnew(ps,segment((cx+cellWidth,cy+cellWidth),
                           (cx+cellWidth,cy+cellWidth+wallWidth)));
      }
    }
    if (walls[y][x][2] == 1) {
      pushnew(ps,segment((cx,cy+cellWidth),
                         (cx+cellWidth,cy+cellWidth)));
      if (walls[y][x][1] == 0) {
        pushnew(ps,segment((cx+cellWidth,cy+cellWidth),
                           (cx+cellWidth+wallWidth,cy+cellWidth)));
      }
      if (walls[y][x][3] == 0) {
        pushnew(ps,segment((cx,cy+cellWidth),
                           (cx-wallWidth,cy+cellWidth)));
      }
    }
    if (walls[y][x][3] == 1) {
      pushnew(ps,segment((cx,cy),(cx,cy+cellWidth)));
      if (walls[y][x][0] == 0) {
        pushnew(ps,segment((cx,cy),(cx,cy-wallWidth)));
      }
      if (walls[y][x][2] == 0) {
        pushnew(ps,segment((cx,cy+cellWidth),
                           (cx,cy+cellWidth+wallWidth)));
      }
    }
  }
}

pair pt = (0,0);
path p;
int j=0;
while (ps.length > 0) {
  write(format("%d",j));
  ++j;
  bool found=false;
  for (int i=0; i<ps.length && !found; ++i) {
    if (pt == ps[i].x) {
      p = p--ps[i].x--ps[i].y;
      pt=ps[i].y;
      ps.delete(i);
      write(format("%f",pt.x));
      write(format("%f",pt.y));
      write("Found");
      found=true;
    }
    else if (pt == ps[i].y) {
      p = p--ps[i].y--ps[i].x;
      pt=ps[i].x;
      write(format("%f",pt.x));
      write(format("%f",pt.y));
      write("Found");
      ps.delete(i);
      found=true;;
    }
  }
  if (!found) {
    write(format("%f",pt.x));
    write(format("%f",pt.y));
    abort("Not found");
  }
}

fill(p--cycle,p=lightgreen);
filloutside(p--cycle,p=lightblue);
draw(p);

//for (int i=0; i<ps.length; ++i) {
//  draw(ps[i].x--ps[i].y);
//}

shipout(prefix="maze2",format="pdf");
