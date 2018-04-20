class ParticleSystem {
  ArrayList<Particle> particles;
  //PVector origin;

  ParticleSystem() {
    //origin = position.copy();
    particles = new ArrayList<Particle>();
    for (int i = 0; i < 5; i++) {
      PVector origin = new PVector(random(width), random(height));
      particles.add(new Particle(origin));
    }
  }

  //void addParticle() {
  //  particles.add(new Particle(new PVector(random())));
  //}

  // A function to apply a force to all Particles
  void applyForce(PVector f) {
    for (Particle p : particles) {
      p.applyForce(f);
    }
  }

  //void applyRepeller(Repeller r) {
  //  for (Particle p: particles) {
  //    PVector force = r.repel(p);        
  //    p.applyForce(force);
  //  }
  //}


  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      
      for (Particle j : particles) {
        PVector force = p.repel(j);        
        p.applyForce(force);
      }


      p.run();
      //if (p.isDead()) {
      //  particles.remove(i);
      //}
    }
  }
}