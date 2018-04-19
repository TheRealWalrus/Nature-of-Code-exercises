//Random walker with a tendency to follow the mouse pointer

Walker walker;

void setup() {
  size(640, 480);
  background(0);
  walker = new Walker();
}

void draw() {
  walker.display();
  walker.update();
}

class Walker {
  float x,y;
  float lastX,lastY;
  int scatter = 20;
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
     if (x > mouseX) {
       x = constrain(x + random(-1 * scatter, 0.5 * scatter), 0, width);
     } else {
       x = constrain(x + random(-0.5 * scatter, scatter), 0, width);
     }
     if (y > mouseY) {
       y = constrain(y + random(-1 * scatter, 0.5 * scatter), 0, height);
     } else {
       y = constrain(y + random(-0.5 * scatter, scatter), 0, height);
     }
   }
}