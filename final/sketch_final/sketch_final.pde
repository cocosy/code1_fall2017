PImage bug;
PImage bg1;
PImage bg2;
PImage bg3;
PImage room2;
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
void setup() {
  size(600, 600);
  background(254, 204, 200);
  noStroke();
  n=255;
  bug = loadImage("bug.png");
  bg1 = loadImage("side1.png");
  bg2 = loadImage("side2.png");
  bg3 = loadImage("side3.png");
  room2 = loadImage("room2.png");
  for (int i = 0; i < b.length; i++) {
    b[i] = new Ball(random(0, 600), random(0, 600), color(map(i, 0, b.length, 0, 255)));
  };

  for (int i = 0; i < NUM_WALKERS; i++) {
    imgX[i] = width/2;
    imgY[i] = height/2;
  };
}


//draw
void draw() {

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
  //drawSceneTwo();
   
    break;
  case 5:
   drawScene4();
   
    break;
  case 6:
   drawScene5();
  break;
  case 7:
    drawEnding();
  default:
    break;
  }
}



//Intro
void drawIntro() {
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
void drawScene1() {
  eyeR = mouseX;
  eyeL = mouseY;
  
  background(255);
  float switch1x = 20+random(10, 50);
  float switch1y = 260;

  float switch2x = 250;
  float switch2y = 260+random(10, 30);

  float switch3x = 400;
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
     fill(n, 204, 200);
     text("Hint: Under the drawer.", height/2, width/2);
  
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
void drawScene2(){
  
  
     background(254, 204, 200);
    for (int i = 0; i < NUM_CIRCLES; i++) {
      b[i].update();
      b[i].display();
    };
    Text2();
    r=0;
}



//scene2
void drawScene3() {
  //imageMode(CENTER);

// 
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
   
  
 //  if (r>600 ||r <= 0){
 //   background(254, 204, 200); 
 //   for (int i = 0; i < NUM_CIRCLES; i++) {
 //     b[i].update();
 //     b[i].display();
 //   }
 //     background(254, 204, 200);
 //   state+=1;
 ////Text3();
 // } else {
 
 // }
  
  fill(0);
  rect(switchW+random(0, 600), switchH+random(0, 600), switchW, switchH);
  if (mousePressed == true) 
  {if (( eyeR > switchW+random(0, 600) && eyeR < switchW+random(0, 600) + switchW &&
      eyeL > switchH+random(0, 600) && eyeL < switchH+random(0, 600) + switchH) ) 
      { 
      //background(255);
n-=10;
r-=20;

      ellipse(eyeR, eyeL, r, r);
      drawEye();
      //state +=2;
  
    }
  }
  fill(255, 99);
 if(r>450){
    fill(255,100,100);
  };
  
  if (n<=130){
    r=200;
   fill(254, 204, 200);}
   
  if(n<=30){
       state+=2;}
       
  ellipse(eyeR, eyeL, r, r);
  drawEye();
   r++;
}


//scene2 ending
//void drawSceneTwo(){

//  r=1;
//  textSize(24);
//  fill(0);
//  textAlign(CENTER);
//  text("Time out", height/2, width/2);
//  //fill(()
//  text("Press ALT to start again", height/2, width/2+30);
//  fill(20);
//  text("Press SHIFT to start again", height/2, width/2+30);
//}



//scene3
void drawScene4() {

  background(255);
  ellipse(Xball, Yball, c, c);
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
void drawScene5() {
 
  background(254, 204, 200); 
  ellipse(ballX, ballY, r+350, r+350);
    eyeR = int(ballX);
    eyeL = int(ballY);
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
void drawEnding() {

  background(254, 204, 200); 
  textSize(24);
  fill(0);
  textAlign(CENTER);
  text("END", height/2, width/2);
}


void Text() {
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

void Text2() {
  textSize(24);
  fill(0);
  textAlign(CENTER);
  text("Just want to let you know that:", height/2, width/2-90);
  text("BigBabol hate people to change its things", height/2, width/2-60);
  text("Time out", height/2, width/2);
  text("Press ALT to start again", height/2, width/2+30);
  fill(n, 204, 200);
  text("Hint: Under the drawer.", height/2, width/2+60);
  text("or you can press SHIFT to visit to the next room", height/2, width/2+90);
}




//EYE
void drawEye() {

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
    lEyeY + (mouseY - height/2) * mouseDistanceModifier, r/14, r/14);
}




//KEY
void keyPressed() {
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