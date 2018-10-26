void setup() {
  size(640, 480);
  background(255);
  branch(width / 2, height, 150, 20);
}

void branch(float x, float y, float len, float weight) {
  translate(x, y);

  if (x != 0) x = 0;
  if (y != 0) y = 0;
  
  strokeWeight(weight);
  line(0, 0, 0, -len);
  translate(0, -len);

  final float theta = PI / 6; 

  //Each branch’s length shrinks by two-thirds.
  len *= 0.66;
  weight *= 0.66;

  if (len > 2) {
    pushMatrix();
    rotate(theta);

    //Subsequent calls to branch() include the length argument.
    branch(x, y, len, weight);
    popMatrix();

    pushMatrix();
    rotate(-theta);
    branch(x, y, len, weight);
    popMatrix();
  }
}
