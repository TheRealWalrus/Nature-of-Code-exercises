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

  void followMouse() {
    //PVector force = new PVector(mouseX, mouseY);
    PVector force = new PVector(mouseX - location.x, mouseY - location.y);
    force.normalize();
    force.mult(0.05);
    applyForce(force);
  }
  
  PVector repel (Mover other) {
    PVector force = PVector.sub(other.location, location); 
    force.setMag(0.004);
    return(force);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }
  void test() {
  }
}