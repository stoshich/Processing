int x, y, r, w, q;
float alf;
void setup () {
  size (900, 900);
  r=200;
}
void draw () {
  background (0, 56, 65);
  color c = color(mouseX, mouseY, 255);
  fill (c);
  alf=alf+1;
  x=450+round(r*cos(PI*alf/180));
  y=450+round(r*sin(PI*alf/180));
  ellipse (x, y, 100, 100);
  w=450+round(r/2*cos(PI*alf/180));
  q=450+round(r/2*sin(PI*alf/180));
  ellipse (w, q, 50, 50);
}