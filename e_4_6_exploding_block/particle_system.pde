class PSystem {
  ArrayList<Particle> particles; 
  PVector location;
  float scl = 40;
  float res = 5;
  boolean isAlive = true;

  PSystem(PVector _location) {
    particles = new ArrayList();
    location = _location.copy();
    for (float x = 0.5; x - 0.5 < res; x++) {
      for (float y = 0.5; y - 0.5 < res; y++) {
        PVector pLoc = new PVector(location.x + x * scl / res - scl / 2, location.y + y * scl / res - scl / 2);
        particles.add(new Particle(pLoc, scl / res, location));
      }
    }
  }
  
  void arm() {
      for (int i = particles.size() - 1; i >= 0; i--) {
      Particle part = particles.get(i);
      
      part.arm();
    }
  }

  void run() {
    for (int i = particles.size() - 1; i >= 0; i--) {
      Particle part = particles.get(i);
      part.run();
      
      if (!part.isAlive) {
        particles.remove(i);
      }
    }
    if (particles.size() == 0) {
      isAlive = false;
    }
  }
  
  boolean isClicked() {
    if (mouseX > location.x - scl / 2 && mouseX < location.x + scl / 2 &&  mouseY > location.y - scl / 2 && mouseY < location.y + scl /2) {
      return true;
    } else {
      return false;
    }
  }
}