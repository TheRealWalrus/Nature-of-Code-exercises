class Plane {
  PVector position;
  PVector velocity;
  PVector accelereation;

  float w = 40;
  float h = 20;

  Plane(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    accelereation = new PVector(0, 0);
  }

  void display() {
    //rectMode(CENTER);
    noStroke();
    fill(50, 255, 50);
    ellipse(position.x, position.y, w, h);
  }

  void thrust() {
    PVector thrustForce  = new PVector(0, 0);
    if (keyPressed) { // If it’s a coded key
      if (keyCode == LEFT) { // If it’s the left arrow
        thrustForce = new PVector(-1.2, -1.2);
      } else if (keyCode == RIGHT) { // If it’s the right arrow
        thrustForce = new PVector(1.2, -1.2);
      }
    }
    applyForce(thrustForce);
  }

  void update() {
    velocity.add(accelereation);
    position.add(velocity);
  }

  void applyForce(PVector force) {
    accelereation.add(force);
  }

  void checkEdges() {
    if (position.y + h / 2 > height) {
      position.y = height - h / 2;
      velocity.mult(0);
    } else if (position.y < h / 2) {
      position.y = h / 2;
      velocity.mult(0);
    }
    if (position.x + w / 2 > width) {
      position.x = width - w / 2;
      velocity.mult(0);
    } else if (position.x < w / 2) {
      position.x = w / 2;
      velocity.mult(0);
    }
  }

  boolean isInside(Air object) {
    if (position.x - w / 2 >= object.x && position.x + w / 2 <= object.x + object.w && position.y + h / 2 >= object.y && position.y + h / 2 <= object.y + object.h) {
      return(true);
    } else {
      return(false);
    }
  }


  void drag(Air object) {
    float speed = velocity.mag();
    PVector force = velocity.copy();
    force.setMag(object.c * speed * speed);
    applyForce(force);
  }
}