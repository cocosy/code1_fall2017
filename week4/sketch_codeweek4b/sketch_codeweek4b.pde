int x = 0;
int a =50;
int angle = 0;
int r = 10;





void setup(){
  size(600,600);
  fill(255,3);
  background(#091744);
  strokeWeight(3);
  //ellipse(width/2,height/2,530,530);
}

void draw(){
  if( angle < 600 == true){
 thisIsPattern();}
  else {
 
  r=0 ;}
  x = x +1;
  //float  y = map(mouseX, 0, width, 0, 255);
  r=r+1;
 }


void thisIsPattern( ){
  float rColor = map(x, 0, width, 10, 200);
  float gColor = map(x, 0, height, 20, 200);
  stroke(rColor,gColor,r+40+x);
 

 translate(width/2,height/2);

 rotate(degrees(angle));

  pushMatrix();
  line(0,0,a,a);
  //line(width/2, height/2,-30,-30);
  rotate(degrees(angle));
  popMatrix();
  
  pushMatrix();
  translate(40+r/3,40+r/3);
  line(0,0,a,a);
  //line(width/2, height/2,-30,-30);
  rotate(degrees(angle));
  popMatrix();
  
  angle ++;}