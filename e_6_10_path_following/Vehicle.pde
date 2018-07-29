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
    maxspeed = 4;
    maxforce = 0.1;
  }

  void update() {         //  Our standard "Euler integration" motion model
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
    fill(255, 0, 0);
    stroke(0);
    strokeWeight(1);
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

  void follow(Path p) {

    //Step 1: Predict the vehicle’s future location.

    PVector predict = location.copy();
    predict.normalize();
    predict.mult(25);
    PVector predictLoc = PVector.add(location, predict);

    //Step 2: Find the normal point along the path.

    PVector target = null;
    //Start with a very high record that can easily be beaten.
    float worldRecord = 1000000;

    for (int i = 0; i < p.points.size()-1; i++) {
      PVector a = p.points.get(i);
      PVector b = p.points.get(i+1);
      PVector normalPoint = getNormalPoint(predictLoc, a, b);
      if (normalPoint.x < a.x || normalPoint.x > b.x) {
        normalPoint = b.get();
      }

      float distance = PVector.dist(predictLoc, normalPoint);

      //If we beat the record, then this should be our target!
      if (distance < worldRecord) {
        worldRecord = distance;
        target = normalPoint.get();
      }
    }
    
    seek(target);
  }

  PVector getNormalPoint(PVector p, PVector a, PVector b) {

    //PVector that points from a to p

    PVector ap = PVector.sub(p, a);

    //PVector that points from a to b

    PVector ab = PVector.sub(b, a);

    //Using the dot product for scalar projection

    ab.normalize();
    ab.mult(ap.dot(ab));

    //Finding the normal point along the line segment

    PVector normalPoint = PVector.add(a, ab);

    return normalPoint;
  }
  
  boolean isAlive() {
    if (location.x > width + r)
      return true;
    return false;
  } 
}
