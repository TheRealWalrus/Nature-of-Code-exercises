class PSystem {
  ArrayList<Particle> particles; 
  PVector location;
  float scl = 40;
  float res = 5;

  PSystem(PVector _location) {
    particles = new ArrayList();
    location = _location.copy();
    for (float x = 0.5; x - 0.5 < res; x++) {
      for (float y = 0.5; y - 0.5 < res; y++) {
        PVector pLoc = new PVector(location.x + x * scl / res - scl / 2, location.y + y * scl / res - scl / 2);
        particles.add(new Particle(pLoc, scl / res));
      }
    }
  }

  void display() {
    rectMode(CENTER);
    fill(255);
    noStroke();
    rect(location.x, location.y, scl, scl);
  }

  void update() {
    for (int i = particles.size() - 1; i >= 0; i--) {
      Particle part = particles.get(i);
      part.run();
    }
  }

  void run() {
    display();
    update();
  }
}