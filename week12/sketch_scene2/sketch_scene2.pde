
int r =10;


float switchW = 50;
float switchH = 20;


void setup(){
  size(500,500);
  noStroke();
  
}

void draw(){
       background(255);
float switch1x = 50+random(10,50);
float switch1y = 260;

float switch2x = 200;
float switch2y = 260+random(10,30);

float switch3x = 350;
float switch3y = 260+random(50,70);

    

    fill(200,200,200);
  ellipse(mouseX,mouseY,r,r);
      drawEye();
   rect(switch1x, switch1y, switchW, switchH);
  rect(switch2x, switch2y, switchW, switchH);
  rect(switch3x, switch3y, switchW, switchH);
  
  
  if (mouseX > switch1x && mouseX < switch1x + switchW &&
        mouseY > switch1y && mouseY < switch1y + switchH) {
      background(20,100,20);
      r+=1;
      
    }
    else if (mouseX > switch2x && mouseX< switch2x + switchW &&
             mouseY > switch2y && mouseY < switch2y + switchH) {
      background(100,220,52); 
          r+=1;
    }
    else if (mouseX > switch3x && mouseX < switch3x + switchW &&
             mouseY > switch3y && mouseY< switch3y + switchH) {
      background(23,190,240);
          r+=1;
    } 
  
}


void drawEye(){
  
  float rEyeX = mouseX +r/10;
  float rEyeY = mouseY;
  float lEyeX = mouseX -r/10;
  float lEyeY = mouseY;
  
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