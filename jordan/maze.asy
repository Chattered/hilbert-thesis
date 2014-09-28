unitsize(30);

file fin = input("mazePoints");

pair pt = fin;
path p = pt;
while (!eof(fin)) {
  pair pt = fin;
  p = p--pt;
}

fill(p--cycle,p=lightgreen);
//filloutside(p--cycle,p=lightblue);
draw(p,currentpen);

shipout(prefix="denseMaze",format="pdf");
