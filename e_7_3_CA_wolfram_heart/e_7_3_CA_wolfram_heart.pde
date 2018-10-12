import java.util.Arrays;

CA myCA;

void setup() {
  frameRate(10);
  size(390, 390);
  background(255);
  myCA = new CA(); 
  
  //myCA.run();
}

void draw() {
  myCA.run();
  //saveFrame("output/wh_####.png");
}
