import processing.pdf.*;
PImage img;

void setup() {
  size(1100, 600);
  img = loadImage("hkk.jpg");
  //img = loadImage("1.JPG");
  //noSmooth();
  noStroke();
}

void draw(){
  background(0);

  int widthStep = 5;
  int heightStep = 3;
  
  for (int i = 0; i < width; i+=widthStep) {
    for (int j = 0; j < height; j+=heightStep) {  
          color c = img.get(i, j);
       
      //float r = red(c);
      //float g = green(c);
      //float b = blue(c);
      if (brightness(c)>200){
        
        pushMatrix();
         translate(i,j);
      rotate(radians(random(100)));
      fill(c);
      rect(0,0,2,2);
       popMatrix();
      
     }else{
        pushMatrix();
      translate(i,j);
      //rotate(radians(frameCount));
      fill(c);
      rect(0,0,3,3);
      popMatrix();}
      
      
  //     PGraphicsPDF pdf = (PGraphicsPDF) g; 
  //if (frameCount == 3) {
  //  exit();
  //} else {
  //  pdf.nextPage();  // Tell it to go to the next page 
  //}
 
    }}
  
  
}