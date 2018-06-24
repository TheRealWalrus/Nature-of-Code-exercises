class Vehicle {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;                //Additional variable for size
  float maxforce;
  float maxspeed;

  Vehicle(float x, float y) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    location = new PVector(x, y);
    r = 6.0;
    maxspeed = 4;
    maxforce = 0.1;
  }

  void update() {         //  Our standard "Euler integration" motion model
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);

    if (location.x - r > width) {
      location.x -= width + 2 * r;
    } else if (location.x + r < 0) {
      location.x += width + 2 * r;
    }

    if (location.y - r > height) {
      location.y -= height + 2 * r;
    } else if (location.y + r < 0) {
      location.y += height + 2 * r;
    }
  }

  void applyForce(PVector force) {  //  Newton's second law; we could divide by mass if we wanted.
    acceleration.add(force);
  }

  void seek() {    //  Our seek steering force algorithm
    //PVector desired = PVector.sub(target, location);
    PVector desired = field.currentTile(location);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);
    //steer.rotate(PI);
    applyForce(steer);
  }

  void display() {
    //Vehicle is a triangle pointing in the direction of velocity; 
    //since it is drawn pointing up, we rotate it an additional 90 degrees.
    float theta = velocity.heading() + PI/2;    
    fill(#8B4513);
    stroke(0);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();
  }
}