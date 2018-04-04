class Particle {
  PVector location, velocity;
  
  Particle(PVector _location, PVector _velocity) {
    location = _location;
    velocity = _velocity;
  }
  
  void run() {
    display();
    update();
  }
  
  void display() {
    noStroke();
    fill(255, 170, 0, 70);
    ellipse(location.x, location.y, 5, 5);
  }
  
  void update() {
    location.add(velocity);
  }
}