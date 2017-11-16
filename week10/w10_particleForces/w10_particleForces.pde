ArrayList<Particle> particles = new ArrayList<Particle>();
float x;
float y;

void setup() {
  size(1000, 600);
  background(50);
}

void draw() {
  background(80);
  
  particles.add(new Particle(width/2, height/2));

      
  for (int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    p.addAttract(mouseX, mouseY, 5);
    p.addRepel(mouseX, mouseY, 20);
    p.addRepel(random(200,300),random(500,520), 10);
    p.addRepel(random(700,750), random(530,600), 5);
        
    p.update();
    //particles.add(new Particle(p.x,p.y));
    p.display();

  
    
    if (p.life < 0) {
      particles.remove(i);
    }
  }
}

  