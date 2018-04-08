class Particle {
  PVector location, acceleration, velocity;
  float scl;


  Particle(PVector _location, float _scl) {
    location = _location;
    scl = _scl;
  }

  void display() {
    //rectMode(CORNER);
    fill(255, 0, 0);
    //noStroke();
    stroke(255);
    rect(location.x, location.y, scl, scl);
  }

  void update() {

  }

  void run() {
    display();
    update();
  }
}