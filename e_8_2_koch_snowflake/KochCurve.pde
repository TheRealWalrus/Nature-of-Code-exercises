class KochCurve { //<>//
  ArrayList<KochLine> kochLines;

  KochCurve(PVector start, PVector end) {
    kochLines = new ArrayList<KochLine>();
    kochLines.add(new KochLine(start, end));
  }

  void generate() {
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
  }

  void render() {
    for (KochLine l : kochLines) {
      l.render();
    }
  }
}
