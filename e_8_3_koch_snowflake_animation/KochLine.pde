class KochLine {
  PVector start;
  PVector end;
  color segmentColor;
  float angVel;

  KochLine(PVector _start, PVector _end) {
    start = _start;
    end = _end;
    angVel = 0;
    
  }

  void render() {
    rotateLine(angVel);
    stroke(segmentColor);
    line(start.x, start.y, end.x, end.y);
  }

  void setColor(int index, int arrayLength) {
    float g = map(index, 0, arrayLength, 0, 255);
    segmentColor = color(0, g, 255);
  }
  
  void rotateLine(float angle) {
    PVector dir = PVector.sub(end, start);
    dir.div(2);
    PVector center = PVector.add(start, dir);
    dir.rotate(angle);
    
    end = PVector.add(center, dir);
    start = PVector.sub(center, dir);
  }
  
  void setRotation(float value) {
    angVel = value;
  }
}
