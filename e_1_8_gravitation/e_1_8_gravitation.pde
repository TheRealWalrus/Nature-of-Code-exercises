Mover mover;

void setup() {
  size(640, 480);
  smooth();
  mover = new Mover();
}

void draw() {
  background(0);
  mover.display();
  mover.update();
}

class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector mouse;
  
  int speedLimit = 3;
  
  float dist;
  
  Mover() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mouse = new PVector(mouseX, mouseY);
  }
  
  void display() {
    noStroke();
    fill(255);
    ellipse(location.x, location.y, 40, 40);
  }
  
  void update() {
    mouse.x = mouseX;
    mouse.y = mouseY;
    
    acceleration = PVector.sub(mouse, location);
    dist = acceleration.mag();
    acceleration.setMag(10 / (dist * dist));
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(speedLimit);
  }
}