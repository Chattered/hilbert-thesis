unitsize(30);

file fin = input("/home/s0785695/Maze/mazePoints");

pair pt = fin;
path p = pt;
while (!eof(fin)) {
  pair pt = fin;
  p = p--pt;
}

fill(p--cycle,p=lightgreen);
//filloutside(p--cycle,p=lightblue);
draw(p,currentpen*2);

shipout(prefix="denseMaze",format="pdf");
