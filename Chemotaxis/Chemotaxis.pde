/* @pjs preload="s.jpg"; */

Bacteria[] bact;
PImage swamp;

void setup()   
{     
  size(600, 600);
  background(0);
  swamp = loadImage("s.jpg");
  bact = new Bacteria[2500];
  for (int i = 0; i < bact.length; i++) {
    int x = (int)(width*Math.random());
    int y = (int)(height*Math.random());
    int r = (int)(3*Math.random())+2;
    bact[i] = new Bacteria(x, y, r);
  }
}   
void draw()   
{ 
  swamp.resize(600, 600);
  image(swamp, 0, 0);
  for (int i = 0; i < bact.length; i++) {
    bact[i].move();
  }
  for (int i = 0; i < bact.length; i++) {
    bact[i].show();
  }
}  
class Bacteria    
{     
  int x_pos;
  int y_pos;
  int randX;
  int randY;
  int radius;

  Bacteria(int x, int y, int rad) {
    x_pos = x;
    y_pos = y;
    radius = rad;
  }

  void move() {
    x_pos += -5 + (Math.random()*11);
    y_pos += -5 + (Math.random()*11);
    if(x_pos > width || x_pos < 0 || y_pos > height || y_pos < 0){
      x_pos = width / 2;
      y_pos = height / 2;
    }
  }
  
  void show() {
    pushMatrix();
    translate(x_pos, y_pos);
    fill(0);
    ellipse(0, 0, radius, radius);
    popMatrix();
  }
}    
