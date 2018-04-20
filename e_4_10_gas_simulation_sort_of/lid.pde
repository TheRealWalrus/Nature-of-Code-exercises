class Lid {
  float location;
  
  Lid() {
    
  }
  
  void run() {
    display();
    update();
  }
  
  void display() {
    stroke(255, 0, 0);
    strokeWeight(3);
    line(0, location, width, location);
    
  }
  
  void update() {
    location = constrain(mouseY, 0, height / 3 * 2);
  }
}