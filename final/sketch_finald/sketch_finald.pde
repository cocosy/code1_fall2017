int r;
int state = 0;




Ball[] b = new Ball[100];

final int NUM_CIRCLES = 100;
float[] x = new float[NUM_CIRCLES];
float[] y = new float[NUM_CIRCLES];

void setup(){
  size(600,600);
  background(254,204,200);
  noStroke();
   for (int i = 0; i < b.length; i++) {
    b[i] = new Ball(random(0,600), random(0,600), color(map(i,0,b.length,0,255)));
  }
    
  //for (int i = 0; i < NUM_CIRCLES; i++) {
  //  x[i] = random(0,600);
  //  y[i] = random(0,600);
  //}
}

void draw(){

  switch (state) {
  case 0:
    drawIntro();
    break;
  case 1:
    drawScene1();
    break;
  case 2:
    drawScene2();
    break;
  case 3:
    drawScene3();
    break;
  case 4:
    drawEnding();
  default:
    break;
    
  }
}


void drawIntro(){
  fill(200);
  ellipse(width/2,height/2,r,r);
  if(r>600 ||r<0)
    {
      background(254,204,200);
     for (int i = 0; i < NUM_CIRCLES; i++) {
          b[i].update();
          b[i].display();
  }  
}else{
    r++;
    drawEye();
} 
}


void drawScene1() {
  
  
}

void drawScene2() {
}

void drawScene3() {
}

void drawEnding() {

}



void drawEye(){
  
  float rEyeX = width/2 +r/10;
  float rEyeY = height/2;
  float lEyeX = width/2 -r/10;
  float lEyeY = height/2;
  
  fill(255);
  ellipse(rEyeX, rEyeY, r/10, r/10);
  ellipse(lEyeX, lEyeY, r/10, r/10);
  fill(0);
  float mouseDistanceModifier = 0.01+r/600;
  ellipse(rEyeX + (mouseX - width/2) * mouseDistanceModifier, 
          rEyeY + (mouseY - height/2) * mouseDistanceModifier, r/14, r/14);
  ellipse(lEyeX + (mouseX - width/2) * mouseDistanceModifier, 
          lEyeY + (mouseY - height/2) * mouseDistanceModifier,r/14, r/14);
  
}

class Ball {
  float x;   //x position
  float y;   //y position
  float dx;  //x velocity
  float dy;  //y velocity
  color c;   //color
  float s;   //size

  //constructor takes an x, y, and color value
  Ball(float _x, float _y, color _c) {
    x = _x;
    y = _y;
    dx = random(-3, 3);  //set a random velocity
    dy = random(-3, 3);
    c = _c;
    s = random(10,50);   // set a random size
    //println("created a ball!");
  }

  // call this method to display the ball
  void display() {
    noStroke();
    fill(c);
    ellipse(x, y, s, s);
  }

  // call this method to update the ball's position
  void update() {
    //c = color(map(dist(mouseX,mouseY,x,y),0,100,255,0));
    if (x < s/2 || x > width-s/2) {
      dx *= -1;
      //x += dx;
    } else {
      x += dx;
    } 
    
    if (y < s/2 || y > height-s/2) {
      dy *= -1;
      //y += dy;
    } else { 
      y += dy;
    }
  }
  
  // call this method to set the size of the ball (instead of accessing its' fields directly)
  void setSize(float siz) {
    s = siz;
  }
}

void mousePressed(){
  r=-1;
   background(254,204,200);
  //r=10;
  
  for (int i = 0; i < NUM_CIRCLES; i++) {
    b[i].update();
    b[i].display();
  }
}


void keyPressed() {
  state++;
  if (state > 5) state = 1;
}