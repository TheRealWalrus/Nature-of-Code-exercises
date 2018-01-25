class Ship {
  PVector location;
  PVector velocity;
  PVector acceleration;

  float dir = 0;
  float angVel = 0.1;

  boolean isLeft, isRight, isUp, isDown;

  Ship(float _x, float _y) {
    location = new PVector(_x, _y);
    velocity = new PVector(0, - 4);
    acceleration = new PVector(0, 0);
  }
  void display() {
    stroke(255);
    pushMatrix();
    translate(location.x, location.y);
    rotate(dir);
    line(0, - 15, - 10, 15);
    line(0, - 15, 10, 15);
    line(- 8, 10, 8, 10);
    popMatrix();
  }

  void update() {
    acceleration.mult(0);

    /*if (keyPressed && (key == CODED)) { // If it’s a coded key
     if (keyCode == LEFT) { // If it’s the left arrow
     dir -= 0.1;
     } else if (keyCode == RIGHT) { // If it’s the right arrow
     dir += 0.1;
     } else if (keyCode == UP) {
     PVector thrust = new PVector(0.05 * cos(dir + 1.5 * PI), 0.05 * sin(dir + 1.5 * PI));
     applyForce(thrust);
     }
     }*/

    //x = constrain(x + v*(int(isRight) - int(isLeft)), r, width  - r);

    dir = dir + angVel * (int(isRight) - int(isLeft));
    if (isUp) {
      PVector thrust = new PVector(0.05 * cos(dir + 1.5 * PI), 0.05 * sin(dir + 1.5 * PI));
      applyForce(thrust);
    }

    friction();

    velocity.add(acceleration);
    velocity.limit(4);
    location.add(velocity);
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