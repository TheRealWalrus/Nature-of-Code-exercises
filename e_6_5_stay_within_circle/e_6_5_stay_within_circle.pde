Vehicle vehicle;

void setup() {
  size(640, 480, P2D);
  PVector origo = new PVector(width /2, height / 2);
  PVector spawnPoint = PVector.random2D();
  spawnPoint.setMag(random(height / 4));
  spawnPoint.add(origo);
  vehicle = new Vehicle(spawnPoint.x, spawnPoint.y);
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
