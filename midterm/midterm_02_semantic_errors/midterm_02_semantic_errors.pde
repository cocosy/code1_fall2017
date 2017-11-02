// QUESTION 2 - 
// Fix all the semantic errors so the code runs as expected

void setup() {
  size(500, 300);
  
  int aNumber = 1;
  float[] bunchONumbers = {10,3.1,0.1};

  for (int i = 0; i < bunchONumbers.length; i++) {
    println(bunchONumbers[i]);
  }
  
  boolean[] bunchOBools = new boolean[10];
  
  for (int i = 0; i > 10; i++) {
    bunchOBools[i] = true;
  }

  PImage img;
  img = loadImage("doge.jpg");

  image(img, 0, 0, width, height);
}