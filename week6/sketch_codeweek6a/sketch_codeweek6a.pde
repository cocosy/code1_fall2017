int[] myArray = new int[60];
int[] myList = new int[100];
float x;
float y;
int angle;

void setup(){
  size(600,600);
  background(0);
  rectMode(CENTER);
  x = width/2;
  y = height/2;
  noStroke();
  for (int i = 0; i < myArray.length; i++) {
    myArray[i] = int(random(600));
  }
  
  for (int i = 0; i < myList.length; i++) {
    myList[i] = int(random(800));
  }
}

void draw(){
 angle ++;
  float r = int(random(0,7));
  
    for (int i = 0; i < myArray.length; i++) {

    fill(0);
    ellipse(myArray[i]-30, myList[i]-30, 3+angle,3+angle);

    fill(myArray[i],234,0+angle,6);
    //ellipse(x, y, 60+r+angle,60+r+angle);
    ellipse(myArray[i],myList[i],60+r+angle,60+r+angle);
    
    }
  
  if (r == 0){
    y-= 5;
    angle+=1;
    
  } else if (r == 1){
    x+= 5;
    angle-=1;
    
    
  }else if(r ==2){
    y+= 5;
    angle+=4;
    
  }else if (r ==3){
    x-=5;
    angle-=4;
    
  }
  
  println("x:" +x+" ,y "+y);
  
    fill(0,2);
    ellipse(x, y, 100+r,100+r);
  
}