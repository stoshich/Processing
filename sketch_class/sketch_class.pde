class Kvadrat {
  float x, y, s;
  Kvadrat(float _x, float _y, float _s){
    this.x = _x;
    this.y = _y;
    this.s = _s;
  }
  
  void draw() {
    rect(this.x,this.y,this.s,this.s);
  }
  
  void right(float _s) {
    this.x+=_s;
  }
}

class KvadratSon extends Kvadrat {
  KvadratSon(float _x, float _y, float _s){
    super(_x, _y, _s);
  }
  
  void raskr(float r, float g, float b) {
    fill (r, g, b);
  }
}

KvadratSon[] k_arrayson;

void setup()
{
  size(600,600);
  k_arrayson = new KvadratSon[10]; 
  
  for(int i=0; i<10; i++){
    k_arrayson[i] = new KvadratSon(random(width), random(height), 100.0);
  }
}

void draw()
{
  background(0);
  for(int i=0; i<10; i++){
     k_arrayson[i].draw();
     k_arrayson[i].right(random(5));
     k_arrayson[i].raskr(random(255), random(30), random(6));
  }
}