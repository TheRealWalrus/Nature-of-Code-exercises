//Note: Correcting the location vector when the balloon bouces is a pretty good idea!
//What is an extended loop? (Mover m : movers) ?

Mover[] movers;

PVector gravity;
PVector wind;

float noiseTime = 0;
float windMin = 0.03;
float windMax = 0.06;

void setup() {
  size(640, 480);
  smooth();

  movers = new Mover[5];
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(int(random(2)));
  }

  gravity = new PVector(0, 0.1);
  wind = new PVector(0, 0);
}

void draw () {
  background(0);
  if (mousePressed) {
    wind.x = map(noise(noiseTime), 0, 1, windMin, windMax);
    noStroke();
    fill(0, 170, 255);
    rect(0, height - 15, map(wind.x, 0, windMax, 0, width / 2), 15);
  } else {
    wind.x = 0;
  }
  noiseTime += 0.1;

  for (int i = 0; i < movers.length; i++) {
    movers[i].display();
    movers[i].applyForce(wind);
    PVector f = gravity.copy();
    f.mult(movers[i].mass);
    movers[i].applyForce(f);
    movers[i].applyForce(calcRepulsion(movers[i].location.x));
    movers[i].update(); 
    movers[i].checkEdges();
  }
}

class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;

  int r;
  int d;
  int mass;
  color ballColor1;
  color ballColor2;

  Mover(int type) {
    d = 40;
    r = d / 2;

    location = new PVector(random(width), height / 2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);

    if (type == 0) {
      mass = 1;
      ballColor1 = color(255, 0, 0);
      ballColor2 = color(255, 0, 0, 150);
    } else {
      mass = 2;
      ballColor1 = color(255, 255, 0);
      ballColor2 = color(255, 255, 0, 150);
    }
  }

  void display() {
    stroke(ballColor1);
    strokeWeight(2);
    fill(ballColor2);
    ellipse(location.x, location.y, d, d);
  }

  void checkEdges() {
    /*if (location.x > width - r) {
      location.x = width - r;
      velocity.x *= -1;
    } else if (location.x < r) {
      location.x = r;
      velocity.x *= -1;
    }*/
    if (location.y < r) {
      location.y = r;
      velocity.y *= -1;
    } else if (location.y > height - r) {
      location.y = height - r;
      velocity.y *= -1;
    }
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    PVector f = force.copy();
    f.div(mass);
    acceleration.add(f);
  }
}

PVector calcRepulsion(float x) {
  int fieldWidth = 60;
  float returnX;
  
  if (x > width - fieldWidth) {
    returnX = map(constrain(x - (width - fieldWidth), 0, fieldWidth), 0, fieldWidth, 0, -0.15);
  } else if (x < fieldWidth) {
    returnX = map(constrain(x - fieldWidth, fieldWidth * -1, 0), fieldWidth * -1, 0, 0.15, 0);
  } else {
    returnX = 0;
  }
  return(new PVector(returnX, 0));
}