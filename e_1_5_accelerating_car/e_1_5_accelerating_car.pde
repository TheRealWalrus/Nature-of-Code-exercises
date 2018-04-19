Car car;

void setup() {
  size(1000, 400);
  smooth();
  car = new Car();
}

void draw() {
  background(0);
  car.display();
  car.update();
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
    fill(255);
    rect(position.x, position.y, carWidth, carHeight);
  }

  void update() {
    if (keyPressed && (key == CODED)) { // If it’s a coded key
      if (keyCode == LEFT) { // If it’s the left arrow
        acceleration.x -= 0.001;
      } else if (keyCode == RIGHT) { // If it’s the right arrow
        acceleration.x += 0.001;
      }
    }
    
    position.add(velocity);
    velocity.add(acceleration);
    velocity.limit(speedlimit);
    
    /*if (position.x >= width - carWidth || position.x <= 0) {
      velocity.mult(0);
      acceleration.mult(0);
    }*/
  }
}