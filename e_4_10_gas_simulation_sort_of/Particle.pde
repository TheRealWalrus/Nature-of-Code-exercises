// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  //float lifespan;
  int d = 12;
  int r = d / 2;

  float mass = 1; // Let's do something better here!

  // Gravitational Constant
  float G = 100;

  Particle(PVector l) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    position = l.copy();
    //lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  void applyForce(PVector force) {
    PVector f = force.copy();
    f.div(mass);   
    acceleration.add(f);
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
    //lifespan -= 2.0;
    
    position.x = constrain(position.x, r, width - r);
    position.y = constrain(position.y, r, height - r);
    
  }

  // Method to display
  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(position.x, position.y, d, d);
  }

  // Is the particle still useful?
  //boolean isDead() {
  //  if (lifespan < 0.0) {
  //    return true;
  //  } else {
  //    return false;
  //  }
  //}

  PVector repel(Particle p) {
    PVector dir = PVector.sub(position, p.position);      // Calculate direction of force
    float d = dir.mag();                       // Distance between objects
    dir.normalize();                           // Normalize vector (distance doesn't matter here, we just want this vector for direction)
    d = constrain(d, 5, 100);                    // Keep distance within a reasonable range
    float force = -1 * G / (d * d);            // Repelling force is inversely proportional to distance
    dir.mult(force);                           // Get force vector --> magnitude * direction
    return dir;
  }
}