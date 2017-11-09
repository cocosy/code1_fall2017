float x[] = new float[100];
float y[] = new float[100];
float z[] = new float[100];
float angle;
float rate;
float amplitude;

void setup() {
  size(700, 700,P3D);
  //noStroke();

  angle = 0;
  amplitude = 250;
  rate = 0.2;
}

void draw() {
  background(255);
  //noStroke();
  angle += rate;
  for (int i = 0; i < x.length; i+=1) {
    x[i] = width/2 + sin((angle + i) * 0.1) * amplitude;
    y[i] = cos((angle - i) * 0.1) * amplitude+ width/2;
    z[i] = tan((angle - i) * 0.1) * amplitude+ width/2;
    //fill(map(i, 0, x.length, 0, 250));
    
    float siz = map(i, 0, x.length, 10, 70);
    float yPos = map(i, 0, x.length, 0, height-10);
    
    //translate(200,200);
    //scale(0.5);
    //box(x[i]/2,siz,y[i]/2);
    
    
    //box(x[i]/15);
    stroke(map(i, 0, x.length, 5,250));
    rect(x[i], yPos, siz, siz);
    rect(y[i], yPos, siz, siz);
    fill(map(z[i], 0, x.length, 50,250));
      

    //box(y[i],yPos,xPos);

    
  }
}