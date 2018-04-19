class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;

  Mover(float x_, float y_) {
    location = new PVector(x_, y_);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  void display() {
    stroke(255);
    fill(255, 150);
    ellipse(location.x, location.y, 20, 20);
  }

  void update() {
    location.add(velocity);
    velocity.add(acceleration);
  }

  void applyForce(PVector force) {
    //velocity.add(force);
    velocity = force;
  }
}