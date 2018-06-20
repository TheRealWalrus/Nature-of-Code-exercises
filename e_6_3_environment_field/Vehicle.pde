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
    r = 8.0;
  }

  void update() {         //  Our standard "Euler integration" motion model
    int tile = field.currentTile(location);

    if (tile == 0) { //water
      maxspeed = 2;
      maxforce = 0.02;
    } else if (tile == 1) { //forrest
      maxspeed = 2;
      maxforce = 0.1;
    } else if (tile == 2) { //mud
      maxspeed = 4;
      maxforce = 0.2;
    } else { //concrete
      maxspeed = 4;
      maxforce = 0.1;
    }

    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  void applyForce(PVector force) {  //  Newton's second law; we could divide by mass if we wanted.
    acceleration.add(force);
  }

  void seek(PVector target) {    //  Our seek steering force algorithm
    PVector desired = PVector.sub(target, location);
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
    fill(255, 150, 0);
    stroke(255);
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
