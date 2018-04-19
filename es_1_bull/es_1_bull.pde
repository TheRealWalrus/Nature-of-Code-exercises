Mover mover;

void setup() {
  size(640, 480);
  smooth();
  mover = new Mover();
}

void draw() {
  background(0);
  mover.display();
  mover.checkCollision();
  mover.update();
}

class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector mouse;

  int speedLimit = 8;
  
  float accMag = 0.02;

  Mover() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = PVector.fromAngle(random(2 * PI)); //Static function "PVector" returns an object, therefore "new" is not needed
  }

  void display() {
    noStroke();
    fill(255);
    ellipse(location.x, location.y, 40, 40);
  }

  void update() {
    acceleration.setMag(accMag);
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(speedLimit);
  }

  void checkCollision() {
    if (location.x > width) {
      velocity.mult(0);
      location.x = width;
      acceleration = PVector.fromAngle(random(PI, 3 * PI));
    } else if (location.x < 0) {
      velocity.mult(0);
      location.x = 0;
      acceleration = PVector.fromAngle(random(3 * PI, 5 * PI));
    }
    
    if (location.y > height) {
      velocity.mult(0);
      location.y = height;
      acceleration = PVector.fromAngle(random(2 * PI, 4 * PI));
    } else if (location.y < 0) {
      velocity.mult(0);
      location.y = 0;
      acceleration = PVector.fromAngle(random(2 * PI));
    }
  }
}