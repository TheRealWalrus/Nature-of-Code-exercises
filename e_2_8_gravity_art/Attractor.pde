class Attractor {
  float mass;
  PVector location;
  float G;

  Attractor(float x, float y) {
    location = new PVector(x, y);
    mass = 20;
    G = 0.4;
  }

  PVector attract(Mover m) {
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag();
    //Remember, we need to constrain the distance so that our circle doesn’t spin out of control.
    //distance = constrain(distance, 5.0, 25.0);
    force.normalize();
    float strength = (G * mass * m.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }

  void display() {
    strokeWeight(3);
    stroke(255);
    noFill();
    ellipse(location.x, location.y, mass*2, mass*2);
  }
}