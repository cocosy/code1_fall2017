import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_final extends PApplet {

PImage bug;
PImage bg1;
PImage bg2;
PImage bg3;
int r=1;
int n;
int state = 0;
int narrator;

int Xball=200;
int Yball=200;
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


//setup
public void setup() {
  
  background(254, 204, 200);
  noStroke();
  n=255;
  bug = loadImage("bug.png");
  bg1 = loadImage("side1.png");
  bg2 = loadImage("side2.png");
  bg3 = loadImage("side3.png");
  for (int i = 0; i < b.length; i++) {
    b[i] = new Ball(random(0, 600), random(0, 600), color(map(i, 0, b.length, 0, 255)));
  };

  for (int i = 0; i < NUM_WALKERS; i++) {
    imgX[i] = width/2;
    imgY[i] = height/2;
  };
}


//draw
public void draw() {

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
    drawScene4();
    break;
  case 5:
    drawScene5();
    break;
  case 6:
    drawEnding();
  default:
    break;
  }
}



//Intro
public void drawIntro() {
  eyeR = height/2;
  eyeL = width/2;
  fill(200);
  ellipse(width/2, height/2, r, r);
  if (r>600 ||r <= 0)
  {
    background(254, 204, 200); 
    for (int i = 0; i < NUM_CIRCLES; i++) {
      b[i].update();
      b[i].display();
    }
    Text();
  } else {
    r++;
    drawEye();
  }
  if (mousePressed == true) { 
    if (mouseX > width/2-r/2 && mouseX < width/2+r/2 &&
      mouseY > height/2-r/2 && mouseY<height/2+r/2) {
      r=0;
    }
  }
}



//scene 1
public void drawScene1() {
  eyeR = mouseX;
  eyeL = mouseY;
  
  background(255);
  float switch1x = 50+random(10, 50);
  float switch1y = 260;

  float switch2x = 200;
  float switch2y = 260+random(10, 30);

  float switch3x = 350;
  float switch3y = 260+random(50, 70);

  fill(200, 200, 200);
  if(r>400){
    fill(255,100,100);
  };
  ellipse(eyeR, eyeL, r, r);
  
  fill(0);
  textAlign(CENTER);
  text("Ughhhh, someone has messed up my living room", width/2, 30);
  text("Collect hints from the drawers and find the DIFFERENCE", width/2, 60);
  text("Memorize the positions & click",width/2, 90);

  drawEye();
  textSize(15);

  rect(switch1x, switch1y, switchW, switchH);
  rect(switch2x, switch2y, switchW, switchH);
  rect(switch3x, switch3y, switchW, switchH);


  if (eyeR > switch1x && eyeR < switch1x + switchW &&
    eyeL > switch1y && eyeL < switch1y + switchH) {
    background(20, 100, 20);
    r+=5;
    image(bg1,0,0);
    rect(182, 294, 25, 10);
    
  } else if (eyeR > switch2x && eyeR< switch2x + switchW &&
    eyeL > switch2y && eyeL < switch2y + switchH) {
    background(100, 220, 52); 
    r+=5;
    image(bg3,0,0);
    fill(168,0,0);
    //ellipse(92,554,19,26);
       
  } else if (eyeR > switch3x && eyeR < switch3x + switchW &&
    eyeL > switch3y && eyeL< switch3y + switchH) {
    background(23, 190, 240);
    r+=5;
    image(bg2,0,0);
    rect(182, 343, 25, 10);
  }

  if (mousePressed == true) {
    if ((eyeR > 91-10 && eyeR < 91 + 10 &&
      eyeL > 554-14 && eyeL < 554 + 14) )
    { fill(168,0,0);
      ellipse(92,554,19,26);
      background(0);
      state +=2;
    }else if((eyeR > 182 && eyeR < 182 + 25 &&
      eyeL > 294 && eyeL < 294 + 10)){
        
     background(200,200,200);
     textSize(24);
     textAlign(CENTER);
     fill(n, 204, 200);
     text("Hint: Under the fish tank.", height/2, width/2);
  
   }else if((eyeR > 182 && eyeR < 182 + 25 &&
      eyeL > 343 && eyeL < 343 + 10)){
     background(200,200,200);
     background(200,200,200);
     textSize(24);
     textAlign(CENTER);
     fill(n, 204, 200);
     text("Hint is in the other knob above.", height/2, width/2);
   }
  }
  if (r>600 ||r<0)
  {state+=1;
  r=0;

  }
}


//Scene1 ending
public void drawScene2(){
  
  
     background(254, 204, 200);
    for (int i = 0; i < NUM_CIRCLES; i++) {
      b[i].update();
      b[i].display();
    };
    Text2();
}



//scene2
public void drawScene3() {
  background(0);
  //  imageMode(CENTER);
  //image(cover,mouseX,mouseY,width,height);
  fill(255, 99);
  eyeR = mouseX;
  eyeL = mouseY;
  r=100;
  ellipse(eyeR, eyeL, r, r);
  drawEye();

  fill(0);
  rect(switchW+random(0, 300), switchH, switchW, switchH);
  if (mousePressed == true) 
  {
    if (( eyeR > switchW && eyeR < switchW + switchW &&
      eyeL > switchH && eyeL < switchH + switchH) ) 
      { 
      background(255);
      

      ellipse(eyeR, eyeL, r, r);
      drawEye();
      state +=1;
  
    }
  }
}






//scene3
public void drawScene4() {

  background(255);
  ellipse(Xball, Yball, c, c);
  for (int i = 0; i < NUM_WALKERS; i++) {
    int r = PApplet.parseInt(random(5));

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
    image(bug, imgX[i], imgY[i]);
 
    if (Xball > imgX[i] && Xball+r/2 < imgX[i] + 104 &&
      Yball > imgY[i] && Yball+r/2 < imgY[i] + 20) {
      background(20, 100, 20);

      state -=1;
    }
  }

  rect(switchW, switchH, switchW, switchH);
  if (( Xball > switchW && Xball < switchW + switchW &&
    Yball > switchH && Yball < switchH + switchH) ) { 
    state +=1;
  }
}


//scene4
public void drawScene5() {
 
  background(254, 204, 200); 
  ellipse(ballX, ballY, r+350, r+350);
    eyeR = PApplet.parseInt(ballX);
    eyeL = PApplet.parseInt(ballY);
  drawEye();
  fill(200);
  rect(mouseX, height-20, 100, 20);
  //bottom
  if (ballY>= height)
  {
    ballY -=dirY;
  //top
  } 
  else if (ballY <= 0)
  {
    dirY =4;
    ballY += dirY;
  } 
  //bottom on paddle
  else if (ballY>=579 && ballX >= mouseX && ballX <= mouseX+80)
  {
    r = r-10;
    dirY =-4;
    ballY += dirY;
  }
  // other situations
  else
  {
    ballY +=dirY;
  }
  //left
  if (ballX <= 0)
  {
    dirX =4;
    ballX += dirX;
  } 
  //right
  else if ( ballX >= width)
  { dirX =-4;
    ballX += dirX;
  } 
  //other sides
  else
  {
    ballX+= dirX;
  }
  
  if (r == 20){
    state +=1;
  }
}


//END
public void drawEnding() {

  background(254, 204, 200); 
  textSize(24);
  fill(0);
  textAlign(CENTER);
  text("END", height/2, width/2);
}


public void Text() {
  textSize(20);
  fill(0);
  textAlign(CENTER);
  text("Hello.I'm BigBabol!", height/2, width/2-120);
  text("Welcome to my home.", height/2, width/2-80);
  text("I am very short tempered,", height/2, width/2-40);
  text("As I'm afraid of lots of things on Earth,", height/2,width/2);
  text("I may explode and disappear sometime!", height/2, width/2+40);
  text("Discover around & touch things carefully",height/2, width/2+80);
  fill(150);
  text("GOOD (Press Shift) LUCK", height/2, width/2+120);
}

public void Text2() {
  textSize(24);
  fill(0);
  textAlign(CENTER);
  text("Time out", height/2, width/2);
  text("Press ALT to start again", height/2, width/2+30);
  fill(n, 204, 200);
  text("Hint: Under the fish tank.", height/2, width/2+60);
}



//EYE
public void drawEye() {

  float rEyeX = eyeR +r/10;
  float rEyeY = eyeL;
  float lEyeX = eyeR -r/10;
  float lEyeY = eyeL;

  fill(255);
  ellipse(rEyeX, rEyeY, r/10, r/10);
  ellipse(lEyeX, lEyeY, r/10, r/10);
  fill(0);
  float mouseDistanceModifier = 0.01f+r/600;
  ellipse(rEyeX + (mouseX - width/2) * mouseDistanceModifier, 
    rEyeY + (mouseY - height/2) * mouseDistanceModifier, r/14, r/14);
  ellipse(lEyeX + (mouseX - width/2) * mouseDistanceModifier, 
    lEyeY + (mouseY - height/2) * mouseDistanceModifier, r/14, r/14);
}




//KEY
public void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      Xball += 10;
      c-=3;
    } else if (keyCode == SHIFT) {
      state+=1;
    } else if (keyCode == ALT) {
      state-=1;
      n-=7;
    } else if (keyCode == UP) {
      Yball += 10;
      z +=1;
      c+=10;
    } else if (keyCode == DOWN) {
      Yball -= 10;
      z -=1;
      c-=10;
    } else if (keyCode == LEFT) {
      Xball -= 10;
      c+=3;
    } else {
      if (key == ' ') {
        z+=10;
      }
    }
    if (key == 's') {
      z -=10;
    }
  }
}

//void mouseDragged(){
  
//  state -=1;
//}
class Ball {
  float x;   //x position
  float y;   //y position
  float dx;  //x velocity
  float dy;  //y velocity
  int c;   //color
  float s;   //size

  //constructor takes an x, y, and color value
  Ball(float _x, float _y, int _c) {
    x = _x;
    y = _y;
    dx = random(-3, 3);  //set a random velocity
    dy = random(-3, 3);
    c = _c;
    s = random(10,50);   // set a random size
    //println("created a ball!");
  }

  // call this method to display the ball
  public void display() {
    noStroke();
    fill(c);
    ellipse(x, y, s, s);
  }

  // call this method to update the ball's position
  public void update() {
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
  public void setSize(float siz) {
    s = siz;
  }
  
  
}
  public void settings() {  size(600, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#FECCC8", "--stop-color=#cccccc", "sketch_final" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
