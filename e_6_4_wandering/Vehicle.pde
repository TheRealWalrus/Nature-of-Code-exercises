class Vehicle {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;                //Additional variable for size
  float maxforce;
  float maxspeed;
  
  int tCenterDist = 100;
  PVector tCenter;
  PVector tEdge;
  
  boolean debug = false;

  Vehicle(float x, float y) {
    acceleration = new PVector(0, 0);
    velocity = PVector.random2D();
    location = new PVector(x, y);
    r = 8.0;
    maxspeed = 4;        //    Arbitrary values for maxspeed and force; try varying these!
    maxforce = 0.1;

    tEdge = PVector.random2D();
    tEdge.setMag(30);
  }

  void update() {         //  Our standard "Euler integration" motion model
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);

    //BOUNDARY

    if (location.x < 0) {
      location.x += width;
    } else if (location.x > width) {
      location.x -= width;
    }

    if (location.y < 0) {
      location.y += height;
    } else if (location.y > height) {
      location.y -= height;
    }
  }

  void applyForce(PVector force) {  //  Newton's second law; we could divide by mass if we wanted.
    acceleration.add(force);
  }

  void wander() {    //  Our seek steering force algorithm

    tCenter = velocity.copy(); //<>//
    tCenter.setMag(tCenterDist);
    float jitter = 0.5;
    tEdge.rotate(random(jitter * -1, jitter));
    PVector target = PVector.add(location, tCenter);
    target.add(tEdge);

    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);
    applyForce(steer);
  }

  void display() {
    if (debug) {
      PVector lineSegment = PVector.add(location, tCenter);
      line(location.x, location.y, lineSegment.x, lineSegment.y);
      PVector lineSegment2 = PVector.add(lineSegment, tEdge);
      line(lineSegment.x, lineSegment.y, lineSegment2.x, lineSegment2.y);
      noFill();
      ellipse(lineSegment.x, lineSegment.y, tEdge.mag() * 2, tEdge.mag() * 2);
      fill(255, 0, 0);
      ellipse(lineSegment2.x, lineSegment2.y, 7, 7);
    }

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
