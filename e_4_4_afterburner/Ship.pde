class Ship {
  PVector location;
  PVector velocity;
  PVector acceleration;

  float dir = 0;
  float angVel = 0.1;

  boolean isLeft, isRight, isUp, isDown;

  Ship(float _x, float _y) {
    location = new PVector(_x, _y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  void display() {
    stroke(255);
    fill(0);
    pushMatrix();
    translate(location.x, location.y);
    rotate(dir);
    beginShape();
    vertex(0, - 15);
    vertex(- 10, 15);
    vertex(- 8, 10);
    vertex(8, 10);
    vertex(10, 15);
    endShape(CLOSE);
    popMatrix();
  }

  void update() {
    acceleration.mult(0);

    dir = dir + angVel * (int(isRight) - int(isLeft));
    if (isUp) {
      PVector thrust = new PVector(0.05 * cos(dir + 1.5 * PI), 0.05 * sin(dir + 1.5 * PI));
      applyForce(thrust);
      
      //AFTERBURNER
      PVector flameDir = PVector.fromAngle(dir);
      flameDir.rotate(PI * 0.5);
      flameDir.setMag(3);
      PVector flameOrigo = flameDir.copy();
      flameDir.rotate(random(-0.1 * PI, 0.1 * PI));
      flameOrigo.setMag(8);
      flameOrigo.add(location);
      particles.add(new Particle(flameOrigo, flameDir));
    }

    friction();

    velocity.add(acceleration);
    velocity.limit(4);
    location.add(velocity);

    //TORUS TOPOLOGY
    if (location.x > width + 15) {
      location.x -= width + 30;
    } else if (location.x < - 15) {
      location.x += width + 30;
    }

    if (location.y > height + 15) {
      location.y -= height + 30;
    } else if (location.y < -15) {
      location.y += height + 30;
    }
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void friction() {
    float fMag = 0.02;
    PVector force = velocity.copy();
    if (velocity.mag() >= fMag) {
      force.setMag(- fMag);
    } else {
      force.setMag(- velocity.mag());
    }
    applyForce(force);
  }



  boolean setMove(int k, boolean b) {
    switch (k) {
    case UP:
      return isUp = b;

    case DOWN:
      return isDown = b;

    case LEFT:
      return isLeft = b;

    case RIGHT:
      return isRight = b;

    default:
      return b;
    }
  }
}