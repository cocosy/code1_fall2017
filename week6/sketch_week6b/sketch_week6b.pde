boolean switchState = true;
boolean buttonState = true;

int[] treePos = {-20,0,100,80,200,50};
int[] treesPos = new int[5];
int j;

float switchPosX = -20;
float switchPosY = 300;
float switchRadius = 50;

float buttonPosX =500;
float buttonPosY = 550;
float buttonRadius = 20;


float carPosX ;

PImage car;


void setup() {
  size(600, 600);
  car =loadImage("car.png");
}


void draw() {
  background(255);
    for (int i = 0; i < treesPos.length; i++) {
    treesPos[i] = int(random(100));}
  //button
    fill(#00cc00);
    ellipse(buttonPosX-400,buttonPosY, switchRadius*1.2, switchRadius*1.2);
    fill(#e65c00);
    ellipse(buttonPosX-400,buttonPosY, switchRadius, switchRadius);
  //switch
    rect(buttonPosX-2,buttonPosY-2,buttonRadius*1.2,buttonRadius*1.2);
    fill(#00cc00);
    rect(buttonPosX,buttonPosY,buttonRadius,buttonRadius);

//button & car
if(buttonState) {
    carPosX += 2;
   } else{
    carPosX += 0;}
 image(car,carPosX,350);
if(carPosX>620 || carPosX<-30){
   carPosX =-27;}
   
   
   //tree   
if (switchState == true) {for(int j = 0; j< treePos.length; j++){

    tree(treePos[j]);}
  }
if(switchState == false){for(int i = 0; i< treesPos.length; i++){
  
  tree(treesPos[i]);
  carPosX += 10;}}

}

  

void mousePressed() {
//button
if (dist(mouseX, mouseY, buttonPosX-400, buttonPosY) < switchRadius ) {
   buttonState = !buttonState;
    }
    
 //switch
   if(dist(mouseX,mouseY,buttonPosX+0.5*buttonRadius,buttonPosY+0.5*buttonRadius)<buttonRadius*0.75){
   switchState = !switchState;
  }
}

  
  
 //tree
void tree(int j){
 translate(j,0);
  noStroke();
  fill(#00cc00);
  triangle(150, 115, 38, 295, 250, 295);
  fill(#ccffcc);
  triangle(150, 35, 58, 205, 230, 205);
  fill(#663300);
  rect(130, 295, 40, 80);
}
  