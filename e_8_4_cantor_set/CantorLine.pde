class CantorLine {
  PVector start;
  PVector end;
  
  CantorLine(PVector _start, PVector _end) {
    start = _start;
    end = _end;
  }
  
  void render() {
    rectMode(CORNERS);
    noStroke();
    fill(0);
    rect(start.x, start.y, end.x, end.y + 10);
  }
}
