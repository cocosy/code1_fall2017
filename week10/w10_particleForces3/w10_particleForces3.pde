ArrayList<Particle> particles = new ArrayList<Particle>();
float x;
float y;

void setup() {
  size(1000, 600);

}

void draw() {
  background(0);
  
  particles.add(new Particle(width/2, height/2));

    
    
  fill(random(250,255),random(80,220),random(40,220),random(150,200));
    noStroke();   
  for (int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    p.addAttract(random(200,300),random(500,520), 20);
    p.addRepel(mouseX, mouseY, 25);
    p.addRepel(width/2, height/2, 10);
    p.addRepel(random(700,750), random(530,600), 10);
    p.addGather(20);    
    p.update();
    //particles.add(new Particle(p.x,p.y));
    p.display();

  
    
    if (p.life < 0) {
      particles.remove(i);
    }
  }
}

  