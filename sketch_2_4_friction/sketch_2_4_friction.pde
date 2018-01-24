Car car;

PVector friction;
float frictionMag;

int iceStart = 250;
int iceEnd = 500;
int dirtStart = 800;
int dirtEnd = 950;

void setup() {
  size(1000, 400);
  smooth();
  car = new Car();
  friction = new PVector(0, 0);
}

void draw() {
  background(0);
  noStroke();
  fill(0, 200, 255);
  rect(iceStart, 0, iceEnd - iceStart, height);
  fill(170, 80, 60);
  rect(dirtStart, 0, dirtEnd - dirtStart, height);
  car.display();
  if (car.position.x + car.carWidth / 2 > iceStart && car.position.x + car.carWidth / 2 < iceEnd) {
    frictionMag = 0;
  } else if (car.position.x + car.carWidth / 2 > dirtStart && car.position.x + car.carWidth / 2 < dirtEnd) {
    frictionMag = -0.09;
  } else {
    frictionMag = -0.05;
  }
  car.baseAcc();
  friction = car.velocity.copy();
  friction.setMag(frictionMag);
  car.applyForce(friction);
  car.update();
  //println(car.acceleration.x);
}

class Car {
  PVector position;
  PVector velocity;
  PVector acceleration;

  int carWidth = 100;
  int carHeight = 60;
  int speedlimit = 3;

  Car() {
    position = new PVector(50, 170);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void display() {
    noStroke();
    fill(255, 0, 0);
    rect(position.x, position.y, carWidth, carHeight);
  }

  void baseAcc() {
    if (keyPressed && (key == CODED)) { // If it’s a coded key
      if (keyCode == LEFT) { // If it’s the left arrow
        acceleration.x = -0.1;
      } else if (keyCode == RIGHT) { // If it’s the right arrow
        acceleration.x = 0.1;
      }
    } else {
      acceleration.x = 0;
    }
  }

  void update() {
    position.add(velocity);
    velocity.add(acceleration);
    //velocity.limit(speedlimit);

    if (position.x > width - carWidth) {
      position.x = width - carWidth;
      velocity.mult(0);
      acceleration.mult(0);
    } else if (position.x < 0) {
      position.x = 0;
      velocity.mult(0);
      acceleration.mult(0);
    }
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }
}