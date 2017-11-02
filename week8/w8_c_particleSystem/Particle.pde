class Particle {
  float x; 
  float y;
  float dx;
  float dy;
  color c;
  float s;
  float life;

  //constructor
  Particle(float _x, float _y) {
    x = _x;
    y = _y;
    dx = random(-5, 5);
    dy = random(-10, 10);
    c = color(255,random(30,185));
    s = random(40,100);
    //println("created a ball!");
    life = 300;
  }

  void display() {
    //noStroke();
    stroke(c);
    line(x,y,x,y+s);
  }

  void update() {
    life--;
    s = map(life, 300, 0, 50, 0);
    
    //c = color(map(dist(mouseX,mouseY,x,y),0,100,255,0));
    
     if (x<0 || x > width) {
      x=random(0,600);
      
    }
    
    if (y< 0 || y > height) {
      y=random(0,600);
      
    }
    if(y>590){
      y = y-dy-25;
    }
    
  x += dx;
  y += dy+y;
    
    
    
    
    
     
    
    
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