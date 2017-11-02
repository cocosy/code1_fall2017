// QUESTION 9 - 
// put together a skeleton Pong game.

// create a bouncing ball that starts in the middle of the screen 
// either use a class or independent variables, it doesn't matter
// make it bounce only on the top and bottom walls
// create two paddles. this can also be a class or not
// have key presses control the up and down movement of the paddles independently
// make the ball reverse x direction when it touches the paddles
// return the ball to the middle of the screen with a random position when it goes off screen
// keep score for the two players
float x=300;
float y=300;
float r=40;
float dx =5; //speed; d = delta
float dy =3; //gravity
float directionX =1;
float directionY =1;

//int up =0;
//int down =0;
//int left =0;
//int right =0; 

float boxX =100;
float boxY =100;
float boxW =100;
float boxH =50;



float boxX_2 =400;
float boxY_2 =400;
float boxW_2 =50;
float boxH_2 =20;


void setup() {
    size(600,600);
}

void keyPressed(){
  boxX+= 1;
  
}

void draw() {
    background(255);
   x = x+dx*directionX;
   y = y+dy*directionY;
   
    ellipse(x,y,r*2,r*2);
    
    //bounce
  if (x > width -r || x<r){
  dx=-dx;//  dx*=-1;
}

  if (y > height -r || y<r){
  dy=-dy;//  dx*=-1;
}

//paddle
if(x>boxX-r && x<boxX+boxW+r && 
   y>boxY-r && y<boxY+boxH+r){

         directionX = -directionX;  directionY = -directionY;}
if(x>boxX_2-r && x<boxX_2+boxW_2+r && 
   y>boxY_2-r && y<boxY_2+boxH_2+r){

         directionX = -directionX;  directionY = -directionY;}



rect(boxX,boxY,boxW,boxH);
rect(boxX_2boxY_2,boxW_2,boxH_2);
}