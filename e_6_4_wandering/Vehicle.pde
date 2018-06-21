class Vehicle {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;                //Additional variable for size
  float maxforce;
  float maxspeed;

  PVector tCenter;
  PVector tEdge;
  
  boolean debug = true;

  Vehicle(float x, float y) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    location = new PVector(x, y);
    r = 8.0;
    maxspeed = 4;        //    Arbitrary values for maxspeed and force; try varying these!
    maxforce = 0.1;

    tCenter = PVector.random2D();
    tCenter = tCenter.setMag(60);

    tEdge = PVector.random2D();
    tEdge = tEdge.setMag(30);
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

    //PVector target = new PVector(mouseX, mouseY);
    tCenter = tCenter.rotate(PVector.angleBetween(tCenter, velocity)); //<>//
    //tEdge = tEdge.rotate(velocity.heading());
    tEdge = tEdge.rotate(random(0.2));
    PVector target = PVector.add(location, tCenter, tEdge);

    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);
    //steer.rotate(PI);
    applyForce(steer);
  }

  void display() {
    if (debug) {
      PVector lineSegment = PVector.add(location, tCenter);
      line(location.x, location.y, lineSegment.x, lineSegment.y);
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
