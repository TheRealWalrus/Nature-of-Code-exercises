class Branch {
  PVector start;
  PVector end;
  float weight;
  
  Branch(PVector _start, PVector _end, float _weight) {
    start = _start;
    end = _end;
    weight = _weight;
  }
  
  void render() {
    strokeWeight(weight);
    line(start.x, start.y, end.x, end.y);
  }
}
