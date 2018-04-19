int animation = 0;

void setup() {
  size(640, 480);
}

void draw () {
  loadPixels(); //???
  noiseDetail(5);
  float xoff = 0;
  for (int x = 0; x < width; x++) {
    float yoff = 0.0;

    for (int y = 0; y < height; y++) {
      //float bright = map(noise(xoff, yoff), 0, 1, 0, 255);
      float red = map(noise(xoff, yoff, animation), 0, 1, 0, 255);
      float green = map(noise(xoff + 10000, yoff + 10000, animation), 0, 1, 0, 255);
      float blue = map(noise(xoff + 20000, yoff + 20000, animation), 0, 1, 0, 255);
      pixels[x+y*width] = color(red, green, blue);
      yoff += 0.01;
    }
    xoff += 0.01;
  }
  updatePixels(); //???
  animation++;
}