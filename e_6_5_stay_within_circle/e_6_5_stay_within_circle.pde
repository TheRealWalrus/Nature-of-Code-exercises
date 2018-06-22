Vehicle vehicle;

void setup() {
  size(640, 480, P2D);
  vehicle = new Vehicle(width / 2, height / 2);
}

void draw() {
  background(0);
  noFill();
  stroke(255);
  ellipse(width / 2, height / 2, height, height);
  
  vehicle.update();
  vehicle.wander();
  vehicle.display();
}

void keyPressed() {
  if (key == 'd') {
    vehicle.debug = !vehicle.debug;
  }
}
