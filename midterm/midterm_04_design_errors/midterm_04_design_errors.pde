// QUESTION 4 -
// this is currently drawing an angled line of rectangles - it should draw a square grid.

void setup() {
  size(600, 600);
}

void draw() {
  for (int i = 0; i < 600; i+=30) {
    for (int j = 0; j < 600; j+=30) {
      rect(i , j, 25, 25);
    }
  }
}