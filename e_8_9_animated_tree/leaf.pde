class Leaf {
  PVector location;
  float angle;
  int startTime;
  int endTime;
  float w = 10;
  float h = 5;
  
  Leaf(PVector _location, float _angle) {
    location = _location;
    angle = _angle;
    startTime = millis();
    endTime = startTime + 4000;
  }
  
  void render() {
    noStroke();
    float a = map(millis(), startTime, endTime, 0, 255);
    fill(84, 121, 128, a);
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    ellipse(w / 2, 0, w, h);
    popMatrix();
  }
}