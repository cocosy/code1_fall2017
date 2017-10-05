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
}

void draw(){
 angle ++;
  float r = int(random(0,7));

    fill(0);
    ellipse(x-30, y-30, 3+angle,3+angle);

    fill(232,234,0+angle,6);
    ellipse(x, y, 60+r+angle,60+r+angle);
    

  
  if (r == 0){
    y-= 5;
    angle+=1;
    
  } else if (r ==1){
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