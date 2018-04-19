class ParticleSystem {
  ArrayList<Particle> particles;
  int flowersToGo = 30;
  boolean toDelete = false;

  //This particular ParticleSystem implementation includes an origin point where each Particle begins.

  PVector origin;

  ParticleSystem(PVector location) {
    origin = location.copy();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    //The origin is passed to each Particle when it is added.
    if (flowersToGo > 0) {
      if (random(1) > 0.5) {
        particles.add(new Arrow(origin));
      } else {
        particles.add(new Particle(origin));
      }
      flowersToGo--;
    } else {
      if (particles.size() == 0) {
        toDelete = true;
      }
    }
  }

  void run() {

    for (int i = particles.size() - 1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      p.display();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}