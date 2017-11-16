class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  PVector target;
  float life;
  float maxSpeed;
  float a;


  Particle(float x, float y) {

    target = new PVector(mouseX,mouseY);
    pos = new PVector(x, y);
    vel = new PVector(random(-1, 6), random(-1, 6));
    acc = new PVector(0, 0);
    life = 300;
    maxSpeed = 40;
  }

  void update() {

    acc.mult(0.5);
    vel.add(acc);
    vel.limit(maxSpeed);
    pos.add(vel);
   

    life--;
  }

  void display() {
    float s = map(life, 300, 0, 20, 0);
    //float a = atan2(pos.y-y, pos.x-x);
    pushMatrix();
    //rotate(a/6);
    rect(pos.x, pos.y,s, s);
    popMatrix();
  }

  void addAttract(float x, float y, float maxForce) {
    float angle = atan2(y - pos.y, x - pos.x);
    float forceStr = maxForce / (1 + dist(pos.x, x, pos.y, y));
    PVector newForce = new PVector(cos(angle), sin(angle));
    newForce = newForce.mult(forceStr);
    acc.add(newForce);
  }
  
  void addRepel(float x, float y, float maxForce) {
     float angle = atan2(pos.y-y, pos.x-x);
    float forceStr = maxForce*2 / (1 + dist(pos.x, x, pos.y, y));
    PVector newForce = new PVector(cos(angle), sin(angle));
    newForce = newForce.mult(forceStr);
    acc.add(newForce);
    
  }
  
 void addGather(float maxForce){
   float angle = atan2(target.y - pos.y, target.x - pos.x);
   float forceStr = maxForce/pos.dist(target);
   PVector newForce = new PVector(sin(angle), sin(angle));
    newForce = newForce.mult(forceStr);
    acc.add(newForce);
   
   
 }
}