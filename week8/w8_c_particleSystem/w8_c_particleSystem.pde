ArrayList<ParticleSystem> systems = new ArrayList<ParticleSystem>();

void setup() {
  size(600, 600);
  systems.add(new ParticleSystem(random(0,600),random(0,600)));
}

void draw() {
  
  background(0);
  fill(0,200);
  textAlign(CENTER,CENTER);
  stroke(255);
  textSize(20);
  text("click on the canvas to start the rain", width/2, height/2);
  for (int i = 0; i < systems.size(); i+=1) {
    ParticleSystem t = systems.get(i);
    t.update();
    //background(i);
  }
 

} 



//void mousePressed() {

  
//}