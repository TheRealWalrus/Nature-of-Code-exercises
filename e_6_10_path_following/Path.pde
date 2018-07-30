class Path {

  //A Path is now an ArrayList of points (PVector objects).
  ArrayList<PVector> points;
  float radius;

  Path() {
    radius = 20;
    points = new ArrayList<PVector>();

    init();
  }

  //This function allows us to add points to the path.
  void addPoint(float x, float y) {
    PVector point = new PVector(x, y);
    points.add(point);
  }

  void insertPoint(float x, float y) {
    PVector point = new PVector(x, y);
    points.add(points.size() - 1, point);
  }
  
  void init() {
    points.clear();
    addPoint(0, height / 2);
    addPoint(width, height / 2);
  }

  //Display the path as a series of points.
  void display() {
    stroke(#8B4513);
    strokeWeight(radius * 2);
    noFill();
    beginShape();
    for (PVector v : points) {
      vertex(v.x, v.y);
    }
    endShape();
  }
}
