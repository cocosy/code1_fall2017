PImage bug;
int r;
int state = 0;

int a=200;
int d=200;
int z=20;
int c=5;

int eyeR;
int eyeL;

float switchW = 100;
float switchH = 20;
float ballX =300;
float ballY =100;
float dirX =5;
float dirY =4;



final int NUM_WALKERS = 5;

float[] imgX = new float[NUM_WALKERS];
float[] imgY = new float[NUM_WALKERS];


Ball[] b = new Ball[100];

final int NUM_CIRCLES = 100;
float[] x = new float[NUM_CIRCLES];
float[] y = new float[NUM_CIRCLES];

void setup(){
  size(600,600);
  background(254,204,200);
  noStroke();
    bug = loadImage("bug.png");
   for (int i = 0; i < b.length; i++) {
    b[i] = new Ball(random(0,600), random(0,600), color(map(i,0,b.length,0,255)));
  }


for (int i = 0; i < NUM_WALKERS; i++) {
    imgX[i] = width/2;
    imgY[i] = height/2;
  }
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
  eyeR = height/2;
  eyeL = width/2;
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

if(mousePressed == true){ 
  if(mouseX > width/2-r/2 && mouseX < width/2+r/2 &&
     mouseY > height/2-r/2 && mouseY<height/2+r/2) {
  r=-1;
   background(254,204,200);
  //r=10;
  
  for (int i = 0; i < NUM_CIRCLES; i++) {
    b[i].update();
    b[i].display();
  
}}}
}


void drawScene1() {
  eyeR = mouseX;
  eyeL = mouseY;
background(255);
float switch1x = 50+random(10,50);
float switch1y = 260;

float switch2x = 200;
float switch2y = 260+random(10,30);

float switch3x = 350;
float switch3y = 260+random(50,70);

    

  fill(200,200,200);
  ellipse(eyeR,eyeL,r,r);
  
  drawEye();
  rect(switch1x, switch1y, switchW, switchH);
  rect(switch2x, switch2y, switchW, switchH);
  rect(switch3x, switch3y, switchW, switchH);
  
  
  if (eyeR > switch1x && eyeR < switch1x + switchW &&
        eyeL > switch1y && eyeL < switch1y + switchH) {
         background(20,100,20);
      r+=5;
     rect(switch1y, switch2x, switchW, switchH);

      
    }
    else if (eyeR > switch2x && eyeR< switch2x + switchW &&
             eyeL > switch2y && eyeL < switch2y + switchH) {
      background(100,220,52); 
          r+=5;
    }
    else if (eyeR > switch3x && eyeR < switch3x + switchW &&
             eyeL > switch3y && eyeL< switch3y + switchH) {
      background(23,190,240);
          r+=5;
    }
    
     if(mousePressed == true){if((eyeR > switch1y && eyeR < switch1y + switchW &&
        eyeL > switch2x && eyeL < switch2x + switchH) )
     {
    background(0);
  state +=1;
  
}}

 if(r>600 ||r<0)
    {
      background(254,204,200);
     for (int i = 0; i < NUM_CIRCLES; i++) {
          b[i].update();
          b[i].display();
        }}
}

void drawScene2() {
}

void drawScene3() {
  background(255);
  ellipse(a,d,c,c);
  for (int i = 0; i < NUM_WALKERS; i++) {
    int r = int(random(5));
     
    float moveAmount = map(i, 0, NUM_WALKERS, 0, 40);
    switch (r) {
      case 0:
        imgX[i] -= moveAmount;
        break;
      case 1:
        imgY[i] += moveAmount;
        break;
      case 2:
        imgX[i] += moveAmount;
        break;
      case 3:
        imgY[i] -= moveAmount;
        break;
      default:
        break;
    }
    image(bug,imgX[i],imgY[i]);
      if (a > imgX[i] && a < imgX[i] + 104 &&
        d > imgY[i] && d < imgY[i] + 20) {
         background(20,100,20);
      state +=1;
      
    }
  }
  
   rect(switchW, switchH, switchW, switchH);
 if(( a > switchW && a < switchW + switchW &&
        d > switchH && d < switchH + switchH) )
     { state +=1;
     }
}
  

void drawEnding() {
  
  background(255,255,0);
  ellipse(ballX,ballY,20,20);
  fill(0,0,0);
  rect(mouseX,380,80,20);
  if(ballY>=400)
  {
    dirY = -4;
    ballY += dirY;
  }
  else if(ballY <= 0)
  {
    dirY =4;
    ballY += dirY;
  }else if(ballY>=380 && ballX >= mouseX && ballX <= mouseX+80)
  {
    dirY =-4;
    ballY += dirY;
  }
  else
  {
    ballY += dirY;
  }
  if (ballX <= 0)
  {
    dirX =4;
    ballX += dirX;
  }else if ( ballX >= 600)
  {dirX =-4;
    ballX += dirX;
  }else
  {
    ballX+= dirX;
  }
}


//EYE
void drawEye(){
  
  float rEyeX = eyeR +r/10;
  float rEyeY = eyeL;
  float lEyeX = eyeR -r/10;
  float lEyeY = eyeL;
  
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



// BALL
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




//KEY
void keyPressed() {
  if (key == CODED){
    if (keyCode == RIGHT) {
      a += 10;
      c-=3;
    }
    else if (keyCode == SHIFT) {
           state+=1;
    } 
    else if (keyCode == UP) {
      d += 10;
      z +=1;
      c+=10;
    }
    else if (keyCode == DOWN) {
      d -= 10;
      z -=1;
      c-=10;
    }else if(keyCode == LEFT){
      a -= 10;
      c+=3;
    }
    else{if (key == ' ') {
    z+=10;
    }}
    if (key == 's') {
      z -=10;
    }}
   
}