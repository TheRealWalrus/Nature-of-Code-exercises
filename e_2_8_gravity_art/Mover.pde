class Mover {
  float mass;
  PVector location;
  PVector pLocation;
  PVector velocity;
  PVector acceleration;

  Mover(float x, float y) {
    mass = random(0.1, 2);
    location = new PVector(x, y);
    pLocation = location.copy();
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }  

  void display() {
    strokeWeight(1);
    stroke(map(mass, 0.1, 2, 0, 255), 0, map(mass, 0.1, 2, 255, 0), 100);
    line(pLocation.x, pLocation.y, location.x, location.y);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    pLocation = location.copy();
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }
}