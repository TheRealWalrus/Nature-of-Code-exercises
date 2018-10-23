class KochLine {
  PVector start;
  PVector end;
  color segmentColor;

  KochLine(PVector _start, PVector _end) {
    start = _start;
    end = _end;
  }

  void render() {
    stroke(segmentColor);
    line(start.x, start.y, end.x, end.y);
  }

  void setColor(int index, int arrayLength) {
    float g = map(index, 0, arrayLength, 0, 255);
    segmentColor = color(0, g, 255);
  }
}
