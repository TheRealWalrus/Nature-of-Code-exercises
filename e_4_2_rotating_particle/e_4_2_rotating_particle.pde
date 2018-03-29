Particle p;

void setup() {
  size(640, 360);
  p = new Particle(new PVector(width/2, 10));
}

void draw() {
  background(255);
  //Operating the single Particle
  p.run();
  if (p.isDead()) {
    println("Particle dead!");
  }

  if (mousePressed) {
    p.wind.x = 0.09;
  } else {
    p.wind.x = 0;
  }
}



class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector gravity;
  PVector wind;
  float lifespan;
  float angle;


  Particle(PVector l) {
    //For demonstration purposes we assign the Particle an initial velocity and constant acceleration.
    acceleration = new PVector();
    wind = new PVector();
    gravity = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    location = l.copy();
    lifespan = 255.0;
  }


  void run() {
    acceleration.mult(0);
    applyForce(gravity);
    applyForce(wind);
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
    angle += 0.1;
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    stroke(255, 0, 0);
    noFill();
    rectMode(CENTER);
    //rect(0, 0, 16, 32);

    color flowerGreen = color(60, 200, 80, lifespan);
    color flowerPetal = color(255, 0, 0, lifespan);
    color flowerCenter = color(255, 255, 0, lifespan);

    stroke(flowerGreen);
    line(0, 16, 0, -8);

    stroke(0, lifespan);
    fill(flowerPetal);
    ellipse(-4, -12, 8, 8);
    ellipse(4, -12, 8, 8);
    ellipse(-4, -4, 8, 8);
    ellipse(4, -4, 8, 8);

    fill(flowerCenter);
    ellipse(0, -8, 8, 8);

    fill(flowerGreen);
    ellipse(4, 6, 8, 4);

    popMatrix();
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  //Is the Particle alive or dead?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}