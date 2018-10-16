class KochFlake {
  ArrayList<KochCurve> kochCurves;

  KochFlake(float x, float y, float h) {
    kochCurves = new ArrayList<KochCurve>();

    PVector tmp = PVector.fromAngle(PI + HALF_PI);
    tmp.setMag(h / 2);

    PVector A = new PVector(x + tmp.x, y + tmp.y);
    tmp.rotate(TWO_PI / 3);
    PVector B = new PVector(x + tmp.x, y + tmp.y);
    tmp.rotate(TWO_PI / 3);
    PVector C = new PVector(x + tmp.x, y + tmp.y);

    kochCurves.add(new KochCurve(B, A));
    kochCurves.add(new KochCurve(C, B));
    kochCurves.add(new KochCurve(A, C));
  }

  void render() {
    for (KochCurve c : kochCurves) {
      c.render();
    }
  }

  void generate() {
    for (KochCurve c : kochCurves) {
      c.generate();
    }
  }
}
