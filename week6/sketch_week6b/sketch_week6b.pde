boolean switchState = true;
boolean buttonState = true;

int n;

float switchPosX = -20;
float switchPosY = 300;
float switchRadius = 50;

float buttonPosX =500;
float buttonPosY = 550;
float buttonRadius = 20;

PImage car;


void setup() {
  size(600, 600);
  car =loadImage("car.png");
   
}

void draw() {
 background(255);
 
 //trees
  if (buttonState == true) {
    
  
  } 
 
  pushMatrix();
  translate(n,0);
      tree();
    popMatrix();

  
    pushMatrix();
    translate(250+n,0);
      tree();
    popMatrix();
    
      pushMatrix();
    translate(500+n,0);
       tree();
    popMatrix();
    
  //car
  if(switchState) {
    switchPosX += 2;
  } else{
    switchPosX += 0;}
 
  image(car,switchPosX,350);
  
  
  //when car and trees meet the end
   if (n>700 || n<-700){
    n=0;}
    
    if(switchPosX>620 || switchPosX<-30){
     buttonState = false;
   switchPosX =0;}
    
    
 //button and switch
  ellipse(buttonPosX-400,buttonPosY, switchRadius*1.2, switchRadius*1.2);
   fill(#e65c00);
  ellipse(buttonPosX-400,buttonPosY, switchRadius, switchRadius);
   rect(buttonPosX-2,buttonPosY-2,buttonRadius*1.2,buttonRadius*1.2);
  fill(#00cc00);
  rect(buttonPosX,buttonPosY,buttonRadius,buttonRadius);
}


void mousePressed() {
  if (dist(mouseX, mouseY, buttonPosX-400, buttonPosY) < switchRadius ) {
    switchState = !switchState;}
    
   if(dist(mouseX,mouseY,buttonPosX+0.5*buttonRadius,buttonPosY+0.5*buttonRadius)<buttonRadius*0.75){
    buttonState = !buttonState;
    //switchState = !switchState;
  }
  
}

  
  
 //tree
void tree(){
 translate(-100,30);
  noStroke();
  fill(#00cc00);
  triangle(150, 115, 38, 295, 250, 295);
  fill(#ccffcc);
  triangle(150, 35, 58, 205, 230, 205);
  fill(#663300);
  rect(130, 295, 40, 80);
  
}
  