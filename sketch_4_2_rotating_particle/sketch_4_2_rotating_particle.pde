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
    //stroke(0, lifespan);
    //fill(0, lifespan);
    //ellipse(location.x, location.y, 8, 8);

    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    //stroke(255, 0, 0);
    //rectMode(CENTER);
    //rect(0, 0, 16, 32);

    rectMode(CORNER);
    noStroke();
    fill(240, 175, 70, lifespan);
    rect(-4, 12, 8, -20);

    ellipse(-4, 12, 8, 8);
    ellipse(4, 12, 8, 8);
    fill(232, 126, 218, lifespan);
    ellipse(0, -10, 9, 12);
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