int r;

final int NUM_CIRCLES = 100;
float[] x = new float[NUM_CIRCLES];
float[] y = new float[NUM_CIRCLES];

void setup(){
  size(600,600);
  background(254,204,200);
  noStroke();
    
  for (int i = 0; i < NUM_CIRCLES; i++) {
    x[i] = random(0,600);
    y[i] = random(0,600);
  }
}

void draw(){
  fill(200);
  ellipse(width/2,height/2,r,r);
  
  if(r>600 ||r<0)
  {
  background(254,204,200);
  //r=10;
  
  for (int i = 0; i < NUM_CIRCLES; i++) {
    fill(map(i, 0, NUM_CIRCLES, 0, 255));
    ellipse(x[i], y[i], i/2, i/2);
  }

}
  else{
    r++;
    drawEye();
}

}
void drawEye(){
  
  float rEyeX = width/2 +r/10;
  float rEyeY = height/2;
  float lEyeX = width/2 -r/10;
  float lEyeY = height/2;
  
  fill(255);
  ellipse(rEyeX, rEyeY, r/10, r/10);
  ellipse(lEyeX, lEyeY, r/10, r/10);
  fill(0);
  float mouseDistanceModifier = 0.01+r/600;
  ellipse(rEyeX + (mouseX - width/2) * mouseDistanceModifier, 
          rEyeY + (mouseY - height/2) * mouseDistanceModifier, r/14, r/14);
  ellipse(lEyeX + (mouseX - width/2) * mouseDistanceModifier, 
          lEyeY + (mouseY - height/2) * mouseDistanceModifier,r/14, r/14);
  
}