class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  PVector target;
  float life;
  float maxSpeed;


  Particle(float x, float y) {
    target = new PVector(mouseX,mouseY);
    pos = new PVector(x, y);
    vel = new PVector(random(-1, 1), random(-1, 1));
    acc = new PVector(0, 0);
    life = 200;
    maxSpeed = 30;
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
  
    ellipse(pos.x, pos.y, s, s);
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
    float forceStr =  1/dist(pos.x, x, pos.y, y)*maxForce;
    PVector newForce = new PVector(cos(angle), sin(angle));
    newForce = newForce.mult(forceStr);
    acc.add(newForce);
    
  }
  
 void addGather(){
   float angle = atan2(target.y - pos.y, target.x - pos.x);
   float forceStr = pos.dist(target) *0.05;
   PVector newForce = new PVector(cos(angle), sin(angle));
    newForce = newForce.mult(forceStr);
    acc.add(newForce);
   
   
 }
}