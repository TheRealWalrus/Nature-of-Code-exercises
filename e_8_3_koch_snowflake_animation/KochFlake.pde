class KochFlake {
  ArrayList<KochCurve> kochCurves;
  int currentCurve;
  boolean rotating = false;

  KochFlake(float x, float y, float h) {
    currentCurve = 0;
    kochCurves = new ArrayList<KochCurve>();

    PVector tmp = PVector.fromAngle(PI + HALF_PI);
    tmp.setMag(h / 2);

    PVector A = new PVector(x + tmp.x, y + tmp.y);
    tmp.rotate(TWO_PI / 3);
    PVector B = new PVector(x + tmp.x, y + tmp.y);
    tmp.rotate(TWO_PI / 3);
    PVector C = new PVector(x + tmp.x, y + tmp.y);

    kochCurves.add(new KochCurve(A, C));
    kochCurves.add(new KochCurve(C, B));
    kochCurves.add(new KochCurve(B, A));
  }

  void render() {  
    for (int i = 0; i <= currentCurve; i++) {
      KochCurve c = kochCurves.get(i);
      c.render();
    }

    if (!kochCurves.get(currentCurve).animationInProgress() && currentCurve < kochCurves.size() - 1) {
      currentCurve++;
    }
  }

  void generate() {
    for (KochCurve c : kochCurves) {
      c.generate();
    }
    currentCurve = 0;
  }

  void toggleRotation() { 
    for (KochCurve c : kochCurves) {
      if (!rotating) c.setSegmentRotation(0.002);
      else           c.setSegmentRotation(0);
    }
    rotating = !rotating;
  }
}
