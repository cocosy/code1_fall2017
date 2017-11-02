class Petal {
  PImage Petal;
  float x; //x position
  float y; //y position
  float dx;//x velocity
  float dy;//y velocity
  int c;
  //color
  // float s; //size
  //constructor takes an x and a y value to set the ball's position
  
  Petal() {
    x = width/2;
    y = height/2;
    dx = random(-3, 3);
    dy = random(-3, 3);
  //c = (int)random(150);
  //s = random(10,50);
    println("created a ball!");
  }

  void display() {
    translate(x,y);
    Petal = loadImage("petal.png");
    imageMode(CENTER);
    pushMatrix();
    rotate(c/10);
    image(Petal,0,0,30,30);
    rotate(c/30);
    image(Petal,-30,-30,30,30);
    rotate(-c/5);
    image(Petal,30,30,30,30);
    rotate(-c/7);
    image(Petal,30,30,30,30); 
    popMatrix();
    c++;
  }

//  void update() {
//    //c = color(map(dist(mouseX,mouseY,x,y),0,100,255,0));
//  }
void update() {
    if (x < 0 || x > width) {
      dx *= -1;
      x += dx;
    } else {
      x += dx;

    } 
    
    if (y < 0 || y > height) {
      dy *= -1;
      y += dy;
    } else { 
      y += dy;
    }
  }
}