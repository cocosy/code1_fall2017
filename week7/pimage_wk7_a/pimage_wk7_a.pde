//we'll use this number just to set up our array size
int IMG_NUM = 5;
PImage img;
//create the image array of size 10
PImage[] eye = new PImage[5];

//store a variable that we'll use to draw a selected image from the array
int whichEye = 0;

void setup() {
  size(500,500);
  imageMode(CENTER);
  
  //load all the images into our array
  for (int i = 0; i < eye.length; i++) {
    eye[i] = loadImage("eye"+i+".jpg");    
  }
  img = loadImage("eye3.jpg");
}

void draw() {
  color c = img.get(mouseX,mouseY);
  background(c);
  
  //draw the image in the array at index position "whichPusheen"
  
  for (int i = 75; i < 500; i+=120) {
    for (int j =75; j < 500; j+=120) {
      
      //translating a 1D index from 2D positions = width * row + column
      //int index = (int)sqrt(IMG_NUM) * j + i;
      image(eye[whichEye], i,j,100,100);
     
  //we've discussed now the modulo operator (%) just a little bit.
  //can you figure out what this conditional statement is looking for?
  if (frameCount % 10 == 0) {
    whichEye++;
  }
  
  //bring the index variable back down to zero if it gets out of the array scope
  if (whichEye >= eye.length) {
    whichEye = 0;
  }
}}}