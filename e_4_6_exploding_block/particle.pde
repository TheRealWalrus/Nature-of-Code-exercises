class Particle {
  PVector location, acceleration, velocity;
  float scl;
  float jitter = 0;
  int timer = -1;
  int fuse = 3000;
  float blueGreen = 255;
  boolean explodes = false;
  float dirNoise = PI / 2;
  float velNoise = 1;
  PVector gravity;
  boolean isAlive = true;

  Particle(PVector _location, float _scl, PVector _sLocation) {
    gravity = new PVector(0, 0.05);
    acceleration = new PVector();
    location = _location;
    velocity = PVector.sub(location, _sLocation);
    //Prevents unmoving objects
    if (velocity.mag() < 0.1) {
      velocity = PVector.random2D();
    }
    velocity.rotate(random(-dirNoise, dirNoise));
    velocity.setMag(5 + random(-velNoise, velNoise));

    scl = _scl;
  }

  void display() {
    rectMode(CENTER);
    fill(255, blueGreen, blueGreen);
    stroke(255, 255, 0);
    rect(location.x, location.y, scl, scl);
    if (!explodes) {
      rect(location.x + random(-jitter, jitter), location.y + random(-jitter, jitter), scl, scl);
    } else {
      rect(location.x, location.y, scl, scl);
    }
  }

  void arm() {
    timer = millis();
  }

  void update() {
    if (timer > 0) {
      int time = millis() - timer;
      jitter = map(time, 0, fuse, 0, 8);
      blueGreen = map(time, 0, fuse, 255, 0);

      if (millis() > timer + fuse) {
        explodes = true;
      }
    }

    if (explodes) {
      acceleration.mult(0);
      applyForce(gravity);

      location.add(velocity);

      if (location.y > height) {
        isAlive = false;
      }
    }
  }

  void applyForce(PVector acceleration) {
    velocity.add(acceleration);
  }

  void run() {
    display();
    update();
  }
}