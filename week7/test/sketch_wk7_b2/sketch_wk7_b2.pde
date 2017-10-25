PImage img;

void setup() {
  size(600, 990);
  //img = loadImage("hkk.jpg");
  img = loadImage("1.JPG");
  //noSmooth();
  noStroke();
}

void draw(){
  background(0);

  int widthStep = 10;
  int heightStep = 10;
  
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
      star(0,0,4,8,5);
       popMatrix();
      
     }else{
        pushMatrix();
      translate(i,j);
      rotate(radians(frameCount));
      fill(c);
      rect(0,0,4,4);
      popMatrix();
    }}
  
  
}}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}