//Note: Correcting the location vector when the balloon bouces is a pretty good idea!

Mover mover;

PVector gravity;
PVector wind;

float noiseTime = 0;
float windMin = 0.03;
float windMax = 0.06;

void setup() {
  size(640, 480);
  smooth();
  mover = new Mover();
  gravity = new PVector(0, -0.1);
  wind = new PVector(0, 0);

}

void draw () {
  background(0);
  mover.display();
  if (mousePressed) {
    wind.x = map(noise(noiseTime), 0, 1, windMin, windMax);
    noStroke();
    fill(0, 170, 255);
    rect(0, height - 15, map(wind.x, 0, windMax, 0, width / 2), 15);
    
  } else {
    wind.x = 0;
  }
  mover.applyForce(wind);
  mover.applyForce(gravity);
  mover.update(); 
  mover.checkEdges();
  noiseTime += 0.1;
}

class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  int r;
  int d;
  
  Mover() {
    d = 40;
    r = d / 2;

    location = new PVector(width / 2, height - 100);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  
  void display() {
    stroke(255, 0, 0);
    strokeWeight(2);
    fill(255, 0, 0, 150);
    ellipse(location.x, location.y, d, d);
  }
  
  void checkEdges() {
    if (location.x > width - r) {
      location.x = width - r;
      velocity.x *= -1;
    } else if (location.x < r) {
      location.x = r;
      velocity.x *= -1;
    }
    if (location.y < r) {
      location.y = r;
      velocity.y *= -1;
    }
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
}