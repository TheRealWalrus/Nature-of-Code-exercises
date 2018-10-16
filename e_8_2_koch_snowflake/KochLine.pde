class KochLine {
  PVector start;
  PVector end;
  
  KochLine(PVector _start, PVector _end) {
    start = _start;
    end = _end;
  }
  
  void render() {
    line(start.x, start.y, end.x, end.y);
  }
}
