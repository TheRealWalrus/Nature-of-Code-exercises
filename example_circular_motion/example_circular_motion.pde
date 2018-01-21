float angle = 0.0;
float offset = 90;
float scalar = 50;
float speed = 0.05;
void setup() {
size(300, 300);
smooth();
}
void draw() {
float x = offset + cos(angle) * scalar;
float y = offset + sin(angle) * scalar;
ellipse( x, y, 40, 40);
angle += speed;
}