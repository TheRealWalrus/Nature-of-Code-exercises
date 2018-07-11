class Path {
 
//A path is only two points, start and end.
  PVector start;
  PVector end;
 
//A path has a radius, i.e. how wide it is.
  float radius;
 
  Path() {
//Picking some arbitrary values to initialize the path
    radius = 20;
    start = new PVector(0,height/3);
    end = new PVector(width,2*height/3);
  }
 
  void display() {  // Display the path.
    strokeWeight(radius*2);
    stroke(0,100);
    line(start.x,start.y,end.x,end.y);
    strokeWeight(1);
    stroke(0);
    line(start.x,start.y,end.x,end.y);
  }
}
