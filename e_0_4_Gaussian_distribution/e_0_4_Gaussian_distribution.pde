import java.util.Random; //!!! We can make use of a class known as Random, which we get for free as part of the default Java libraries imported into Processing

Random generatorX; //Random is a special class, it provides the seed for the generator variable?
Random generatorY;
Random generatorH;

void setup() {
  size(640,360);
  generatorX = new Random();
  generatorY = new Random();
  generatorH = new Random();
  background(0);
}

void draw() {
//Note that nextGaussian() returns a double.
  float numX = (float) generatorX.nextGaussian();
  float numY = (float) generatorY.nextGaussian();
  float numH = (float) generatorY.nextGaussian();
  float sdX = 60; //60
  float sdY = 33;
  float sdH = 60;
  float meanX = 320;
  float meanY = 180;
  float meanH = 180;
 
//Multiply by the standard deviation and add the mean.
  float x = sdX * numX + meanX;
  float y = sdY * numY + meanY;
  float h = sdH * numH + meanH;
  
  noStroke();
  colorMode(HSB);
  fill(h, 100, 100, 10);
  ellipse(x,y,16,16);
}