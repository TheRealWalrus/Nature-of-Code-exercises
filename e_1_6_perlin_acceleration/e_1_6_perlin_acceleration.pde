Bouncer bouncer;

void setup() {
  size(640, 480);
  smooth();
  bouncer = new Bouncer();
}

void draw() {
  background(0);
  bouncer.display();
  bouncer.update();
}

class Bouncer {
  PVector position;
  PVector velocity;
  PVector acceleration;

  int bouncerR = 40;
  int speedlimit = 1000;
  
  float noiseTime;

  Bouncer() {
    position = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void display() {
    noStroke();
    fill(255);
    ellipse(position.x, position.y, bouncerR, bouncerR);
    println(acceleration.y); //for debugging
  }

  void update() {
    position.add(velocity);
    velocity.add(acceleration);
    velocity.limit(speedlimit);
    
    if (position.x > width + bouncerR) {
      position.x = -bouncerR;
    } else if (position.x < -bouncerR) {
      position.x = width + bouncerR;
    }
    if (position.y > height + bouncerR) {
      position.y = -bouncerR;
    } else if (position.y < -bouncerR) {
      position.y = height + bouncerR;
    }
    
    acceleration.x = map(noise(noiseTime), 0, 1, -0.05, 0.05);
    acceleration.y = map(noise(noiseTime + 10000), 0, 1, -0.05, 0.05);
    
    noiseTime += 0.1;
  }
}