// Flocking
// Daniel Shiffman <http://www.shiffman.net>
// The Nature of Code, Spring 2011

// Flock class
// Does very little, simply manages the ArrayList of all the boids

class Flock {
  ArrayList<Boid> boids; // An ArrayList for all the boids

  Flock() {
    boids = new ArrayList<Boid>(); // Initialize the ArrayList
  }

  void run() {

    if (debug) {
      Boid tester = boids.get(0);
      tester.drawDebug();
      for (Boid b : boids) {
        if (tester.sees(b)) {
          b.currentFill = color(255, 0, 0);
        }
      }
    }

    for (Boid b : boids) {
      b.run(boids);  // Passing the entire list of boids to each boid individually
    }
  }

  void addBoid(Boid b) {
    boids.add(b);
  }

  void respawn() {
    boids.clear();
    for (int i = 0; i < 50; i++) {
      Boid b = new Boid(random(width), random(height));
      flock.addBoid(b);
    }
  }
}