import java.util.Arrays;

CA myCA;

void setup() {
  frameRate(10);
  size(640, 480);
  background(255);
  myCA = new CA(); 
}

void draw() {
  myCA.run();
}
