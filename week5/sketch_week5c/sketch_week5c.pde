float angle =0;
  int z ;
  int i;
  int j;

void setup(){
  size(800,800);
    z=50;
}


void draw(){
  background(255);
  angle++;
  noStroke();

  
  if(z>250){
    z=30;
    z= z-1;}
  else{z++;}

    for (int i = 0; i <= width*2; i+=40) {
    for(int j=0; j<=height*2; j+=40){
    pushMatrix();
    
    fill(angle,random(0,255),i,z);
    ellipse( i+5, j+5,30, 30);
   float a=map(mouseX,0,800,0,255);
    fill(a,i,angle,z-50);
    //stroke(map(i,0,200,0,255), 255);
    float x = map(z, 0, 600, 0, 6);
    //rotate(x);
    ////curve(38, 239, 238 , 493, 204, 235, 263,455);
    ellipse( i-x, j-x,30, 30);

    popMatrix();
  } 
}

}