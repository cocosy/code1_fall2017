//create an empty ArrayList - an empty dynamic collection type - that will accept type Ball
ArrayList<PetalSys> systems = new ArrayList<PetalSys>();
Petal b;

void setup() {
  size(600, 600);
  imageMode(CENTER);
  b = new Petal();
  
}

void draw() {
  background(0);
  //loop through everything in the ArrayList
  //for (int i = 0; i < Pedal.size(); i++) {
  //  //create a temporary Ball object, point it to the one in the arraylist
  //  //call the update and display method of that arraylist Ball
  //  Pedal b = Pedal.get(i);
    b.update();
    b.display();
  
}

void mousePressed() {
  //when the mouse is pressed, add a new instance of a Ball object to the ArrayList
  petal.add(new Petal(mouseX,mouseY));
}