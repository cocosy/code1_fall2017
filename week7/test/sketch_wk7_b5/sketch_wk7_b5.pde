//import processing.pdf.*;
PImage img;


void setup() {
  size(1100, 600);
  img = loadImage("hkk.jpg");
  noSmooth();
  //for (int a=0; a < degArray.length; a++) { 
  //  degArray[a]=a;}
    
}

void draw(){
  background(0);

  int widthStep = 3;
  int heightStep = 10;
  


  for (int i = 0; i < width; i+=widthStep) {
      
    for (int j = 0; j < height; j+=heightStep) {  
          color c = img.get(i, j);
          
      //float w = map(brightness(c),0,255,0,600);
      //float h = map(hue(c),0,255,0,1100);
     
      //float r = red(c);
      //float g = green(c);
      //float b = blue(c);
      //if (brightness(c)>200){
       
      stroke(c);
      line(i,j,i+mouseX/20,j+mouseY/20);
        
      //curveVertex(brightness(c), i+hue(c));
       
  }

}
      
     
  //  println("Finished.");
  //exit();
}