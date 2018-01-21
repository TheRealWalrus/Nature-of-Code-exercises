class Attractor {
  PVector location;
  Attractor() {
    location = new PVector(width / 2, height / 2);
  }

  void display() {
    noStroke();
    fill(255, 0, 0);
    ellipse(location.x, location.y, 30, 30);
  }

  PVector exertForce(Mover m) {
    PVector force = PVector.sub(location, m.location);
    float dist = force.mag();
    
    float magnitude = constrain(abs(dist - 100) * (dist - 100) / 1000, -1,  1);
    force.setMag(magnitude);
    return(force);
  }
}