Vehicle vehicle;

void setup() {
  size(640, 480, P2D);
  vehicle = new Vehicle(width / 2, height / 2);
}

void draw() {
  background(0);
  vehicle.update();
  vehicle.wander();
  vehicle.display();
}

void keyPressed() {
  if (key == 'd') {
    vehicle.debug = vehicle.debug ? false : true;
  }
}
