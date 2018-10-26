class KochCurve { //<>//
  ArrayList<KochLine> kochLines;
  int currentSegment;

  KochCurve(PVector start, PVector end) {
    kochLines = new ArrayList<KochLine>();
    kochLines.add(new KochLine(start, end));
    currentSegment = 0;
    setColor();
  }

  void generate() {
    currentSegment = 0;
    ArrayList<KochLine> newArray = new ArrayList<KochLine>();

    for (KochLine l : kochLines) {
      PVector tmp = PVector.sub(l.end, l.start);  
      tmp.setMag(tmp.mag() / 3);

      PVector B = PVector.add(l.start, tmp);
      PVector D = PVector.sub(l.end, tmp);
      tmp.rotate(PI / 3);
      PVector C = PVector.add(B, tmp);

      newArray.add(new KochLine(l.start, B));
      newArray.add(new KochLine(B, C));
      newArray.add(new KochLine(C, D));
      newArray.add(new KochLine(D, l.end));
    }

    kochLines = newArray;
    setColor();
  }

  void render() {
    for (int i = 0; i < currentSegment; i++) {
      KochLine l = kochLines.get(i);
      l.render();
    }
    
    if (animationInProgress()) {
      currentSegment++;
    }
  }

  void setColor() {
    for (int i = 0; i < kochLines.size(); i++) {
      KochLine l = kochLines.get(i);
      l.setColor(i, kochLines.size());
    }
  }
  
  boolean animationInProgress() {
    return currentSegment < kochLines.size();
  }
  
  void setSegmentRotation(float value) {
    for (KochLine l : kochLines) {
      l.setRotation(value);
    }
  }
}
