class Ship {
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float dir = 0;
  
  Ship(float _x, float _y) {
    location = new PVector(_x, _y);
    velocity = new PVector(0, - 4);
    acceleration = new PVector(0, 0);
    
  }

  /*void display() {
    stroke(255);
    pushMatrix();
    translate(location.x, location.y);
    rotate(dir);
    line(location.x, location.y - 15, location.x - 10, location.y + 15);
    line(location.x, location.y - 15, location.x + 10, location.y + 15);
    line(location.x - 8, location.y + 10, location.x + 8, location.y + 10);
    popMatrix();
  }*/
  
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

    if (keyPressed && (key == CODED)) { // If it’s a coded key
      if (keyCode == LEFT) { // If it’s the left arrow
        dir -= 0.1;
      } else if (keyCode == RIGHT) { // If it’s the right arrow
        dir += 0.1;
      }
    }

    friction();

    velocity.add(acceleration);
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
}