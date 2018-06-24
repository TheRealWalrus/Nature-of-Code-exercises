PVector staticV;
PVector dynamicV;
int vLength = 120;

void setup() {
  size(640, 480);
  staticV = new PVector(vLength, 0);
  newV();
}

void draw() {
  background(0);
  translate(width / 2, height / 2);

  strokeWeight(6);

  stroke(0, 255, 255);
  line(0, 0, staticV.x, staticV.y);

  stroke(255, 255, 0);
  line(0, 0, dynamicV.x, dynamicV.y);
 
  printAngle();
}

void mouseClicked() {
  newV();
}

void newV() {
  dynamicV = PVector.random2D();
  dynamicV.setMag(vLength);
}

void printAngle() {
  float angle = PVector.angleBetween(staticV, dynamicV);
  
  text(angle + " radians", 0, height / 2 - 40);
  text(degrees(angle) + " degrees", 0, height / 2 - 20);
}