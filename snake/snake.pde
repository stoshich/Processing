import processing.sound.*;
SoundFile file;
PImage img;
ArrayList<Integer> x = new ArrayList<Integer>(), y = new ArrayList<Integer>();
int w=30,h=30,r=20,dir=2,apx=12,apy=10, score=0;
int[]dx={0,0,1,-1},dy={1,-1,0,0};
boolean gameover=false;
void setup() {
  file = new SoundFile(this, "wmd_swan.mp3");
  file.loop();
  file.amp(0.01);
  img = loadImage ("image.jpg");
  size(600, 600); 
  x.add(5); 
  y.add(5);
}
void draw() {  
  image (img, 0, 0, width, height);
  text ("Score:" + score, 0, 30);
  textSize(30);
  for (int i=0;i<w;i++) line(i*r,0,i*r,height);
  for(int i=0;i<h;i++)line(0,i*r,width,i*r); fill(0, 255, 0); 
  for (int i = 0 ; i < x.size(); i++) rect(x.get(i)*r, y.get(i)*r, r, r);
  if (!gameover) {  
    fill(255, 0, 0); rect(apx*r, apy*r, r, r); 
    if (frameCount%4==0) {
      x.add(0, x.get(0) + dx[dir]); y.add(0, y.get(0) + dy[dir]);
      if(x.get(0) < 0 || y.get(0) < 0 || x.get(0) >= w || y.get(0) >= h) gameover = true;
      for(int i=1;i<x.size();i++) if(x.get(0)==x.get(i)&&y.get(0)==y.get(i)) gameover=true;
      if (x.get(0)==apx && y.get(0)==apy) { 
      apx = (int)random(0, w); apy = (int)random(0, h); score=score+1;
    }
      else { 
      x.remove(x.size()-1); y.remove(y.size()-1); 
    }
    }
  }
  else {
    fill(200, 20, 30); textSize(30); text("Конец игры. Нажмите пробел",width/7,height/2); score=0;
    if(keyPressed&&key==' ') { 
    x.clear(); y.clear(); x.add(5);  y.add(5); gameover = false; 
  }
  }}
void keyPressed() { 
  int nd=key=='s'? 0:(key=='w'?1:(key=='d'?2:(key=='a'?3:-1)));
  if (nd!=-1&&(x.size()<=1||!(x.get(1)==x.get(0)+dx[nd]&&y.get(1)==y.get(0)+dy[nd]))) dir=nd;
}