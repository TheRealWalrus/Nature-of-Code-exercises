class Particle {
  PVector location, velocity;
  int lifespan = 200;
  boolean isDead = false;

  Particle(PVector _location, PVector _velocity) {
    location = _location;
    velocity = _velocity;
  }

  void run() {
    display();
    update();
  }

  void display() {
    noStroke();
    fill(255, 170, 0, lifespan);
    ellipse(location.x, location.y, 5, 5);
  }

  void update() {
    location.add(velocity);
    lifespan -= 4;
  }

  boolean isDead() {
    if (lifespan < 0) {
      return true;
    } else {
      return false;
    }
  }
}