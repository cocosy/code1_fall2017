//import processing.pdf.*;
PImage img;
 float[] deg = {1,2,1,2,1};
int a=0;
void setup() {
  size(1100, 600);
  img = loadImage("hkk.jpg");
  //img = loadImage("1.JPG");
  //noSmooth();
  noStroke();
  //for (int a=0; a < degArray.length; a++) { 
  //  degArray[a]=a;}
    
}

void draw(){
  background(0);

  int widthStep = 4;
  int heightStep = 10;
  


  for (int i = 0; i < width; i+=widthStep) {
    for (int j = 0; j < height; j+=heightStep) {  
          color c = img.get(i, j);
       
      //float r = red(c);
      //float g = green(c);
      //float b = blue(c);
      //if (brightness(c)>200){
        
      pushMatrix();
      translate(570,320);
      //for(int b=0;b< 7; b++){
      rotate(i-j+radians(frameCount));
      scale(0.5);
      fill(c);
      //noFill();
      triangle(i,j+(random(10)),i+9,j+4,4+i,j+9);
       popMatrix();
       
  }}
      

  //  println("Finished.");
  //exit();
}