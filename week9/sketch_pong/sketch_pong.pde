int p1Score;
int p2Score;
int p3Score;
int p4Score;

boolean p1Up = false;
boolean p1Down = false;
boolean p2Up = false;
boolean p2Down = false;
boolean p3Left = false;
boolean p3Right = false;
boolean p4Left = false;
boolean p4Right = false;


Ball b;
Ball b2;
Paddle p1;
Paddle p2;
Paddle p3;
Paddle p4;

void setup() {
  size(1000, 700);
  b = new Ball();
  b2 = new Ball();
  p1 = new Paddle(0);
  p2 = new Paddle(1);
  p3 = new Paddle(2);
  p4 = new Paddle(3);
}

void draw() {

  background(200+p1Score*10,200+p2Score*10,233-p3Score*20+p4Score*10);

  b.checkCollisionWithPaddle(p1);
  b.checkCollisionWithPaddle(p2);
  b.checkCollisionWithPaddle(p3);
  b.checkCollisionWithPaddle(p4);
  b2.checkCollisionWithPaddle(p1);
  b2.checkCollisionWithPaddle(p2);
  b2.checkCollisionWithPaddle(p3);
  b2.checkCollisionWithPaddle(p4);


  b.update();
  b.display();
  b2.update();
  b2.display();
  
  p1.update();
  p1.display();
  p2.update();
  p2.display();
  p3.update();
  p3.display();
  p4.update();
  p4.display();

  textSize(36);
  fill(255);
  textAlign(CENTER, CENTER);

  text(p1Score, 100, 350);
  text(p2Score, width -100, 350);
  text(p3Score, 500, 100);
  text(p4Score, 500, 600);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      p2Up = true;
    }
    if (keyCode == DOWN) {
      p2Down = true;
    }
    if (keyCode == LEFT){
      p4Left = true;
  }
    if(keyCode == RIGHT){
      p4Right = true;
  } 
  }else{
    if (key == 'w') {
      p1Up = true;
    }
    if (key == 's') {
      p1Down = true;
    }
   if (key == 'a'){
      p3Left = true;
    }
    if (key == 'd'){
      p3Right = true;
    }
    }
  }  

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) {
      p2Up = false;
    }
    if (keyCode == DOWN) {
      p2Down = false;
    }
    if (keyCode == LEFT){
     p4Left =false;
  }
  if(keyCode == RIGHT){
    p4Right = false;
  }
  }else{
    if (key == 'w') {
      p1Up = false;
    }
    if (key == 's') {
      p1Down = false;
    }
   if (key == 'a'){
      p3Left = false;
    }
   if (key == 'd'){
      p3Right = false;
    }
  }
}

class Paddle {
  float x;
  float y;
  float w;
  float h;
  int playerNum;

  Paddle(int whichPlayer) {
    playerNum = whichPlayer;
    if (whichPlayer == 0) {
      x = 30;
      y = height/2;
      w = 20;
      h = 150;
    } else if (whichPlayer == 1) {
      y = height/2;
      w = 20;
      h = 150;
      x = width-30-w;
    }else if(whichPlayer ==2){
      y = 20;
      x = width/2;
      w = 150;
      h = 20;
  }else if(whichPlayer ==3){
      h = 20;
      x = width/2;
      w =150;
      y = height-30-h; 
  }
}

  void update() {

    if (playerNum == 0) {
      if (p1Up) {
        y-=10;
      } 
      if (p1Down) {
        y+=10;
      }
    }
    if (playerNum == 1) {
      if (p2Up) {
        y-=10;
      } 
      if (p2Down) {
        y+=10;
      }
    }
   if(playerNum == 2){
     if(p3Left){
       x-=10;
     }
     if(p3Right){
       x+=10;
     }
   }
   if(playerNum == 3){
     if(p4Left){
       x-=10;
     }
     if(p4Right){
       x+=10;
     }
   }
  }


  void display() {
    rectMode(CORNER);
    fill(255);
    rect(x, y, w, h);
  }
}


class Ball {
  float x;   //x position
  float y;   //y position
  float dx;  //x velocity
  float dy;  //y velocity

  //think of the constructor function as the setup() for the object instance.
  //notice there is no "void" or return type. Technically it returns itself (a Ball)
  //this constructor takes no arguments - it sets all fields automatically.
  Ball() {
    x = width/2;
    y = height/2;
    dx = 10;  //set a random velocity
    dy = random(-3, 3);
  }

  // call this method to display the ball
  void display() {
    //fill(255,200);
    noStroke();
    rectMode(CENTER);
    rect(x, y, 10, 10);
  }

  // call this method to update the ball's position
  void update() {
    //c = color(map(dist(mouseX,mouseY,x,y),0,100,255,0));
    x += sin(dx);

    if (x < 0 || x > width) {
       background(random(100,255));

      if (x < 0) {
        p2Score++;
      }

      if (x > width) {
        p1Score++;
      }
       x = width/2;
      y = height/2;
      dx = -dx;  //set a random velocity
      dx = random(-3, 3);
      
  }
      
      if(y<0 || y > height){
        background(random(100,255));
          
        if(y<0){
        p4Score++;
      }
      
      if(y>height){
        p3Score++;
      }
      
      x = width/2;
      y = height/2;
      dy = -dy;  //set a random velocity
      dy = random(-3, 3);
      
    } 

  //  if (y < 0 || y > height) {
  //    dy *= -1;
  //    y += dy;
  //  } else { 
  //    
  //  }
 x += dx;
 y +=dy;
  }

  void checkCollisionWithPaddle(Paddle p) {
    if (x > p.x && x < p.x + p.w) {
      if (y > p.y && y < p.y + p.h) {
        dx = -dx;
        dy = -dy;
        dy = random(-10, 10);
     
      }
      
    }
  }
}