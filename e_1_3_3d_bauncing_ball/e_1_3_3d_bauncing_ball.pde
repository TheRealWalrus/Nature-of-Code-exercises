import processing.opengl.*;

Ball ball;

void setup() {
  size(640, 480, OPENGL);
  smooth();
  noStroke();
  fill(255, 170, 0);
  ball = new Ball();
}

void draw() {
  background(0);
  lights();
  ball.display();
  ball.update();
}

class Ball {
  PVector location;
  PVector velocity;


  Ball() {
    location = new PVector (width/2, height/2, 0);
    velocity = new PVector (random(-10, 10), random(-10, 10), random(-10, 10));
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y, location.z);
    sphere(40);
    popMatrix();
    println(location.z);
  }

  void update () {
    location.add(velocity);

    if (location.x > width || location.x < 0) {
      velocity.x *= -1;
    }
    if (location.y > height || location.y < 0) {
      velocity.y *= -1;
    }
    if (location.z > 320 || location.z < -320) {
      velocity.z *= -1;
    }
  }
}