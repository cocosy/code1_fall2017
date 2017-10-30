//import processing.pdf.*;
PImage img;


void setup() {
  size(1100, 600);
  img = loadImage("hkk.jpg");
  noSmooth();
    
}

void draw(){
  background(0);

  int widthStep = 3;
  int heightStep = 5;
  


  for (int i = 0; i < width; i+=widthStep) {
      
    for (int j = 0; j < height; j+=heightStep) {  
          color c = img.get(i, j);
          
      //float w = map(brightness(c),0,255,0,600);
      //float h = map(hue(c),0,255,0,1100);
   
      stroke(c);
      line(i,j+mouseX/20-mouseY/15,i+2,j-mouseX/15-mouseY/10);
      //stroke(c);
      //line(j+mouseX/20,i,j-mouseX/15,i+2);
        
      //curveVertex(brightness(c), i+hue(c));
       
  }

}
      
     
  //  println("Finished.");
  //exit();
}