class Arrow extends Particle {
  float k;
  float angAcc;

  Arrow(PVector l) {
    super(l);
    k = 0.005;
    angVel = 0;
    angle = 2.5;
  }

  void display() {
    fill(#50EACF);
    stroke(#744015);

    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    beginShape(); 
    vertex(0, 20);
    vertex(5, 10);
    vertex( -5, 10);
    endShape(CLOSE);
    line(0, -20, 0, 10);
    popMatrix();
  }

  //void update() {
  //  velocity.add(acceleration);
  //  location.add(velocity);
  //  lifespan -= 2.0;
  //  angle += angVel;
  //}

  void update() {
    super.update();
    angAcc = -1 * angle * k;
    angVel += angAcc;
    angVel *= 0.99;
  }
}