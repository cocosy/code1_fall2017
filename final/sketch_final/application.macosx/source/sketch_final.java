import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.*; 

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
PImage room2;
PImage room3;
int r=1;
int n;
int state = 0;
int narrator;
int R =250;

int Xball=200;
int Yball=200;
int z=20;
int c=10;

int eyeR;
int eyeL;

float switchW = 100;
float switchH = 20;
float ballX =300;
float ballY =100;
float dirX =5;
float dirY =4;
float frameZ =0;



final int NUM_WALKERS = 5;

float[] imgX = new float[NUM_WALKERS];
float[] imgY = new float[NUM_WALKERS];


Ball[] b = new Ball[100];

final int NUM_CIRCLES = 100;
float[] x = new float[NUM_CIRCLES];
float[] y = new float[NUM_CIRCLES];

//import lib


Minim minim;
AudioPlayer piano;

//setup
public void setup() {
  
  background(254, 204, 200);
  noStroke();
  minim = new Minim(this);
  piano = minim.loadFile("piano.mp3", 2048);
  n=255;
  bug = loadImage("bug.png");
  bg1 = loadImage("side1.png");
  bg2 = loadImage("side2.png");
  bg3 = loadImage("side3.png");
  room2 = loadImage("room2.png");
  room3 = loadImage("room3.png");
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
    for(int i = 0; i < piano.bufferSize() - 1; i++)
  {
    line(i, 50  + piano.left.get(i)*50,  i+1, 50  + piano.left.get(i+1)*50);
    line(i, 150 + piano.right.get(i)*50, i+1, 150 + piano.right.get(i+1)*50);
  }
    break;
  case 4:
   drawScene4();
  //drawSceneTwo();
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
    r=0;
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
  //r=1;
  eyeR = mouseX;
  eyeL = mouseY;
  
  background(255);
  float switch1x = 20+random(10, 50);
  float switch1y = 260;

  float switch2x = 230+random(10, 30);
  float switch2y = 260;

  float switch3x = 380+random(50, 70);
  float switch3y = 260;

  fill(200, 200, 200);
  if(r>400)
  {
    fill(255,100,100);
  };
  ellipse(eyeR, eyeL, r, r);
  
  fill(0);
  textAlign(CENTER);
  textSize(18);
  text("Ughhhh, someone has messed up my living room", width/2, 70);
  text("Collect hints from the drawers,", width/2, 100);
  text("and find the DIFFERENCE(except fish)", width/2, 130);
  text("Memorize the positions & click",width/2, 160);

  drawEye();
  textSize(15);

  rect(switch1x, switch1y, switchW, switchH);
  rect(switch2x, switch2y, switchW, switchH);
  rect(switch3x, switch3y, switchW, switchH);


  if (eyeR > switch1x && eyeR < switch1x + switchW &&
    eyeL > switch1y && eyeL < switch1y + switchH) {
    background(20, 100, 20);
    r+=1;
    image(bg1,0,0);
    rect(182, 294, 25, 10);
    
  } else if (eyeR > switch2x && eyeR< switch2x + switchW &&
    eyeL > switch2y && eyeL < switch2y + switchH) {
    background(100, 220, 52); 
    r+=2;
    image(bg3,0,0);
    fill(168,0,0);
    //ellipse(92,554,19,26);
       
  } else if (eyeR > switch3x && eyeR < switch3x + switchW &&
    eyeL > switch3y && eyeL< switch3y + switchH) {
    background(23, 190, 240);
    r+=1;
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
      r=0;
    }else if((eyeR > 182 && eyeR < 182 + 25 &&
      eyeL > 294 && eyeL < 294 + 10)){
     background(200,200,200);
     textSize(24);
     textAlign(CENTER);
     fill(255, 204, 200);
     text("Hint: Something Under the drawer has changed.", height/2, width/2);
     text("Don't move/change My things.", height/2, width/2-30);
  text("Don't move/change My things.", height/2, width/2+30);
  text("Don't move/change My things.", height/2, width/2-60);
  text("Don't move/change My things.", height/2, width/2+60);
  text("Don't move/change My things.", height/2, width/2-90);
  text("Don't move/change My things.", height/2, width/2+90);
    text("BigBabol can tell the difference.", height/2, width/2+120);
   }else if((eyeR > 182 && eyeR < 182 + 25 &&
      eyeL > 343 && eyeL < 343 + 10)){
     background(200,200,200);
     textSize(24);
     textAlign(CENTER);
     fill(255, 204, 200);
     text("The Hint is in the other drawer above.SAD.", height/2, width/2);
      text("Don't move/change My things.", height/2, width/2-30);
  text("Don't move/change My things.", height/2, width/2+30);
  text("Don't move/change My things.", height/2, width/2-60);
  text("Don't move/change My things.", height/2, width/2+60);
  text("Don't move/change My things.", height/2, width/2-90);
  text("Don't move/change My things.", height/2, width/2+90);
    text("BigBabol HATE people do that.", height/2, width/2+120);
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
    r=0;
}



//scene2
public void drawScene3() {
 switchW = 60;
 switchH =60;
  background(room2);
  //background();
  //image(room2,0,0);
  fill(255-n,n);
  rect(0,0,600,600);
  println(n);
  //  imageMode(CENTER);
  //image(cover,mouseX,mouseY,width,height);
 
  eyeR = mouseX;
  eyeL = mouseY;
   
  
   if (r>600 ||r <= 0){
    background(254, 204, 200); 
    for (int i = 0; i < NUM_CIRCLES; i++) {
      b[i].update();
      b[i].display();
    }
  
   if(mousePressed == true){r=1;
  } }
frameRate(40);
  fill(255);
  text("CLickkkkk the Lights",width/2,height/2);
  rect(switchW+random(0, 600), switchH+random(0, 600), switchW, switchH);
  if (mousePressed == true) 
  {if (( 
  eyeR > switchW+random(0, 600) && eyeR < switchW+random(0, 600) + switchW &&
      eyeL > switchH+random(0, 600) && eyeL < switchH+random(0, 600) + switchH) ) 
      { 
      background(255);
    n-=10;
    r-=20;
  
    }
  }
  fill(255, 99);
 if(r>450){
    fill(255,100,100);
  };
  //rect(510,370,63,197);
  
  if (n<=130){
    r=50;

    fill(255);
    text("Bigbabol is so happy.",width/2,330);
    text("Bigbabol'd like to play piano for you",width/2,360);
    text("Click Piano and keep Clicking lights.",width/2,390);
   fill(254, 204, 200);
   
  if (mousePressed == true) {if (( eyeR > 510 && eyeR < 510 + 63 &&
      eyeL > 370 && eyeL < 370 + 197) ) 
     {
    // simply call loop again to resume playing from where it was paused
    piano.loop();
  }
      }
    }
  if(n<=30){
       state+=1;}
       
  ellipse(eyeR, eyeL, r, r);
  drawEye();
      if(r>600){
        textSize(18);
    text("BigBabol triggered. Press mouse to try again",width/2,height/2);}
   r++;
}




//scene3
public void drawScene4() {
  eyeR = Xball;
  eyeL = Yball;
 switchH =40;
 switchW =100;
 int PinkX = 121;
 int PinkY =270;
 int Siz =34;
 piano.pause();
  background(room3);
  fill(200);
  textSize(22);
  text("Use the Arrow Keys to",width/2,height/3);
  text("walk to the EXIT",width/2,height/3+30);
  text("Watch out bugggs",width/2,height/3+60);
  ellipse(Xball, Yball, c, c);
  drawEye();
  //if(c>25){
  //fill(200);
  //ellipse(Xball, Yball, 4, 4);}
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
 
    if((Xball > imgX[i] && Xball+c/2 < imgX[i] + 104) &&
      (Yball > imgY[i] && Yball+c/2 < imgY[i] + 20)) {
      background(20, 100, 20);
     c +=1 ;
     fill(255);
    text( "AHHHHHHH Bigbabol HATE Bugggggs",width/2,height/2);
      //state -=1;
    }
  }


    if (Xball > PinkX && Xball< PinkX + Siz &&
      Yball > PinkY && Yball < PinkY + Siz) {
      background(254, 204, 200);
     c =75 ;
     fill(255);
    text( "BigBaBol LOVE PINK :0",width/2,height/2);
      //state -=1;
    }
    
  rect(200, 480, switchW, switchH);
  fill(200);
  text("EXIT",250,510);
  if (Xball >200 && Xball < 200 + switchW &&
    Yball > 480 && Yball < 480 + switchH ) { 
    state +=1;
  }
  println(c);
}


//scene4
public void drawScene5() {
  background(254, 204, 200); 
  fill(255);
  textSize(22);
  text("Use the Paddle to help Bigbabol exercise",width/2,height/2);
      text("Bigbabol hate to be overweight",width/2,height/2+30);
  fill(200);
  ellipse(ballX, ballY, r+350, r+350);
    eyeR = PApplet.parseInt(ballX);
    eyeL = PApplet.parseInt(ballY);
  drawEye();
  fill(200);
  rect(mouseX, height-20, 200, 20);
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
    frameZ += 2;
    frameRate(60+frameZ);
    println(60+frameZ);
   fill(0);
   textSize(38);
   //fill(255,100,100);
    text("Bigbabol is so happy",width/2,height/2-40);
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
  
 if (r+350 <= 110){

    state +=1;
 
  }
  
  
}


//END
public void drawEnding() {
  r=R;
  eyeR = width/2;
  eyeL =height/2;
  background(254, 204, 200); 
  fill(200);
  ellipse(width/2, height/2,  R, R);
  drawEye();
  R--;
  if(R<=110){
    R=110;
  textSize(24);
 
  textAlign(CENTER);
  fill(0);
  text("END", height/2, width/2+35);
  }
  
}


public void Text() {
  textSize(20);
  fill(0);
  textAlign(CENTER);
  text("Hello.I'm BigBabol!", height/2, width/2-120);
  text("Welcome to BigBabol's home.", height/2, width/2-80);
  text("BigBabol is very short tempered,", height/2, width/2-40);
  text("and is afraid of lots of things on Earth,", height/2,width/2);
  text("BigBabol may explode and disappear sometime!", height/2, width/2+40);
  text("Discover around & touch things carefully",height/2, width/2+80);
  fill(150);
  text("GOOD (Press Shift) LUCK", height/2, width/2+120);
}

public void Text2() {
  textSize(24);
  fill(0);
  textAlign(CENTER);
  text("Just want to let you know:", height/2, width/2-90);
  text("BigBabol hate people to change its things", height/2, width/2-60);
  text("Time out...", height/2, width/2);
  text("Press ALT to start again", height/2, width/2+30);
  fill(n, 204, 200);
  text("Hint: Under the drawer.", height/2, width/2+60);
  text("or you can press SHIFT to visit to the next room", height/2, width/2+90);
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
      c+=4;
    } else if (keyCode == DOWN) {
      Yball -= 10;
      z -=1;
      c-=5;
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
