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
  //background(230);
  //casting a value to another type
  //float r = random(0,4); original
  float r = int(random(0,7));// now
 
  //line(r,x,r+30,y);
  //rect(x,y,10,10);
    //arc( width/2, height/2, x,y,HALF_PI, PI);

    fill(0,97);
    ellipse(x-30, y-30, 3+angle,3+angle);

    fill(232,234,0+angle,6);
    ellipse(x, y, 60+r+angle,60+r+angle);
    //rotate(angle);
    

  
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