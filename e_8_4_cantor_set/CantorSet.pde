class CantorSet {
  ArrayList<CantorLine> cantorLines;
  final int MARGINS = 30;
  final int SPACING = 30;

  CantorSet() {
    cantorLines = new ArrayList<CantorLine>();
    cantorLines.add(new CantorLine(new PVector(MARGINS, SPACING), 
      new PVector (width - MARGINS, SPACING)));
    render();
  }

  void generate() { 
    ArrayList<CantorLine> tmpArray = new ArrayList<CantorLine>();
    
    for (int i = 0; i < cantorLines.size(); i++) {
      CantorLine l = cantorLines.get(i);
      
      l.start.y += SPACING;
      l.end.y += SPACING;

      PVector dir = PVector.sub(l.end, l.start);
      dir.div(3);
      tmpArray.add(new CantorLine(l.start, PVector.add(l.start, dir)));
      dir.mult(2);
      tmpArray.add(new CantorLine(PVector.add(l.start, dir), l.end));
    }   
    cantorLines = tmpArray;
    render();
  }

  void render() {
    for (CantorLine l : cantorLines) {
      l.render();
    }
  }
}
