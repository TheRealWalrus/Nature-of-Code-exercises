//NOT FINISHED

// Extending Dan Shiffman's flocking example with vision

// Flocking
// Daniel Shiffman <http://www.shiffman.net>
// The Nature of Code, Spring 2009

// Demonstration of Craig Reynolds' "Flocking" behavior
// See: http://www.red3d.com/cwr/
// Rules: Cohesion, Separation, Alignment

// Click mouse to add boids into the system

Flock flock;
boolean debug = true;

void setup() {
  size(640, 480, P2D);
  flock = new Flock();
  // Add an initial set of boids into the system
  flock.respawn();
  //smooth();
}

void draw() {
  background(255);
  flock.run();
  //line(20, 20, 170, 20 );

  // Instructions
  fill(0);
  //text("Drag the mouse to generate new boids.",10,height-16);
}

// Add a new boid into the System
void mousePressed() {
  flock.addBoid(new Boid(mouseX, mouseY));
}

void keyPressed() {
  if (key == 'd') {
    debug = !debug;
  }

  if (key == 'c') {
    flock.respawn();
  }
}
