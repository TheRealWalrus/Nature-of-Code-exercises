class Branch {
  PVector start;
  PVector end;
  float maxWeight;
  PVector currentEnd;
  final float growthRate;
  float growthStatus = 0;
  int timeStart;
  int timeEnd;

  Branch(PVector _start, PVector _end, float _weight, int timer) {
    start = _start;
    end = _end;
    maxWeight = _weight;
    growthRate = (float) 1 / 60;
    timeStart = millis();
    timeEnd = millis() + timer;
  }

  void render() {
    currentEnd = PVector.lerp(start, end, growthStatus);
    float weight = 1;

    if (maxWeight > 1.1)
      weight = map(millis(), timeStart, timeEnd, 1, maxWeight);
    
    weight = constrain(weight, 1, maxWeight);
    strokeWeight(weight);
    stroke(#594F4F);
    line(start.x, start.y, currentEnd.x, currentEnd.y);
    if (growthStatus < 1) {
      growthStatus += growthRate;
    }
    growthStatus = constrain(growthStatus, 0, 1);
  }

  boolean isFinished() {
    if (growthStatus == 1)
      return true;
    return false;
  }
}