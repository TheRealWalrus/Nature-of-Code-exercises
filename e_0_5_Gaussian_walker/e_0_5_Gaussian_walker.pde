//Random walker that incorporates the Gaussian distribution
import java.util.Random;

Random generator;

Walker walker;

void setup() {
  size(640, 480);
  background(0);
  generator = new Random();
  walker = new Walker();
}

void draw() {
  walker.display();
  walker.update();
  //println(walker.genGaus());
}

class Walker {
  float x,y;
  float lastX,lastY;

  int green = 0;
  int greenChange = 1;

  
   Walker() {
     x = width/2;
     y = height/2;
     lastX = width/2;
     lastY = height/2;
   }
   
   void display() {
     stroke(255, green, 0);
     line(lastX, lastY, x, y);
   }
   
   void update() {
     green += greenChange;
     if (green > 255) {
       greenChange = -1;
     } else if (green < 0) {
       greenChange = 1;
     }
     lastX = x;
     lastY = y;
     x = constrain(x + (this.genGaus() * this.plusMinus()), 0, width);
     y = constrain(y + (this.genGaus() * this.plusMinus()), 0, height);
   }
   
   float genGaus() {
     float num = (float) generator.nextGaussian();
     float sd = 3;
     float mean = 10;
     
     float gaus = sd * num + mean;
     
     return gaus;
   }
   int plusMinus() {
     int diceroll = int(random(2));
     if (diceroll == 0) {
       return -1;
     } else {
       return 1;
     }
   }
}