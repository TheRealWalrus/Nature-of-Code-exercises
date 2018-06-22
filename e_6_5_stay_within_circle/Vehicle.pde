class Vehicle { //<>//

  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;                //Additional variable for size
  float maxforce;
  float maxspeed;

  boolean debug = false;
  PVector targetForce;

  Vehicle(float x, float y) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    location = new PVector(x, y);
    r = 8.0;
    maxspeed = 4;        //    Arbitrary values for maxspeed and force; try varying these!
    maxforce = 0.1;
    targetForce = PVector.random2D();
  }

  void update() {         //  Our standard "Euler integration" motion model
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  void seek(PVector target) {    //  Our seek steering force algorithm
    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);
    applyForce(steer);
  }

  void applyForce(PVector force) {  //  Newton's second law; we could divide by mass if we wanted.
    acceleration.add(force);
  }

  void wander() {
    
    int spacing = 50;
    PVector origo =  new PVector(width / 2, height / 2);
    
    if (location.dist(origo) > height / 2 - spacing) {
      float angle = PVector.angleBetween(PVector.sub(location, origo), targetForce);
      targetForce.rotate(2 * PI - angle * 2);
    }
        
    seek(targetForce);
  
    if (debug) {
      noFill();
      stroke(255, 0, 0);
      ellipse(width / 2, height / 2, height - 2 * spacing, height - 2 * spacing);
    }
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
