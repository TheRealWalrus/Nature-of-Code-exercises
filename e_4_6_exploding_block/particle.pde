class Particle {
  PVector location, acceleration, velocity;
  float scl;
  float jitter = 4;
  int timer = millis();
  int fuse = 3000;
  float saturation = 99;


  Particle(PVector _location, float _scl) {
    location = _location;
    scl = _scl;
  }

  void display() {
    colorMode(HSB);
    rectMode(CENTER);
    fill(20, saturation, 360);
    //noStroke();
    stroke(17, 72, 74);
    //rect(location.x + random(-jitter, jitter), location.y + random(-jitter, jitter), scl, scl);
    rect(location.x, location.y, scl, scl);
  }

  void update() {
  }

  void run() {
    display();
    update();
  }
}