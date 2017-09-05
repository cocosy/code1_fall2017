void setup(){
   size(500,500);}
   
void draw(){
  for (int i = 30; i < width*1.8; i = i+60) {
  for (int j = 0; j < height*1.8; j = j+120) {
    noFill();
    stroke(100);
    arc(50,50, i, j, 0, HALF_PI);
}
}
}


//void setup(){
//   size(500,500);}
   
//void draw(){
//  for (int i = 30; i < width; i = i+30) {
//  for (int j = 0; j < height; j = j+50) {

//    fill(j);
//    arc(i+mouseX,j+10+mouseY, 50, 50, 0, HALF_PI);
//}
//}
//}