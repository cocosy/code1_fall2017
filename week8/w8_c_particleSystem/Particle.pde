class Particle {
  float x; 
  float y;
  float dx;
  float dy;
  color c;
  float s;
  float life;

  //constructor
  Particle() {
    x = random(width);
    y = -50;
    dx = random(-1, 1);
    dy = random(20,30);
    c = color(255, random(30, 185));
    s = random(40, 100);
    //println("created a ball!");
    life = 300;
  }

  void display() {
    //noStroke();
    stroke(c);
    line(x, y, x, y+s);
  }

  void update() {
    life--;
    s = map(life, 300, 0, 50, 0);

    //c = color(map(dist(mouseX,mouseY,x,y),0,100,255,0));

//    if (x<0 || x > width) {
//      x=random(0, 600);
//    }

    if (y > height) {
      //image(splashImg, x, y);
      //y=random(0, 600);
    }

    x += dx;
    y += dy;

    //if(y>590){

    //}





    //if (x < s/2 || x > width-s/2) {
    //  dx *= -1;
    //}

    //if (y < s/2 || y > height-s/2) {
    //  dy *= -1;
    //}

    //x += dx;
    //y += dy;
  }

  void setSize(float siz) {
    s = siz;
  }
}