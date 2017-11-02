//PImage milk;
PImage egg;
PImage donut;
PImage window;
PImage model;

float angle;

void setup(){
  size(800,800);
 // milk = loadImage("milk.png");
  egg = loadImage("egg.png");
  donut = loadImage("donut.png");
  window = loadImage("46.gif");
  model = loadImage("70.png");
  imageMode(CENTER);}
  
void draw() {
  background(220, 150, 210 );
  angle= angle+1;
  
  //1
  pushMatrix();  
  translate(200, height/6); // apply 3 matrix transformations (translate, scale, rotate)
  scale(0.2);  // normal scale
  rotate(radians(-angle + mouseX * 0.2));  // rotate based on mouse position and an arbitrary starting angle
  //fill(200, 100, 80);
  image(donut,0,0);  // draw rectangle at origin (0, 0) of transformed coordinate system
  popMatrix();  // restore saved coordinate system
  
  //2
  pushMatrix();
  translate(650, height/2.5);
  scale(0.3);
  rotate(radians(-angle - mouseX * 0.2+40));
  //fill(80, 200, 100);
  image(donut,200,200);
  popMatrix();
  
  //3
  pushMatrix();
  translate(440, height/5);
  scale(0.5);
  rotate(radians(-angle - mouseX * 0.2));
  //fill(80, 200, 100);
  image(egg,10,0);
  popMatrix();
  
  //4
  pushMatrix();
  translate(width/3, 600);
  scale(0.3);
  rotate(radians(angle+ mouseY * 0.5));
  //fill(100, 80, 200);
  image(egg,100,100);
  popMatrix();
  
  //5
  pushMatrix();
  translate(width/1.2, 660);
  scale(0.6);
  rotate(radians(angle+ mouseY * 0.7));
  //fill(100, 80, 200);
  image(donut,20,20);
  popMatrix();
  
  //6
  pushMatrix();
  translate(width/8.5, 430);
  scale(0.11);
  rotate(radians(angle- mouseY * 9));
  //fill(100, 80, 200);
  image(egg,20,20);
  popMatrix();
  
  //Center pics
  fill(random(255),230,40+angle);
  rect(260,290,120,130);
  fill(230+mouseX,random(80),20+mouseY,random(233));
  rect(450,280,160,140);
  imageMode(CENTER);
  scale(0.7);
  image(model,625,600);

  scale(1.48);
  image(window,400,400);
  
  //whirl
  
  
  
 
 
 
 
  
  
  
  
  
  
  
  
  
  //image(banana, 0, 0, banana.width + mouseX, banana.height + mouseY); 
  //translate(width, height);
  //rotate(radians(angle));
  //image(banana,0,0,mouseX,mouseY);
  
}