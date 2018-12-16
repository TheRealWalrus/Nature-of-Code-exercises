String target;

void setup() {
  size(300, 200);
  target = "cat";
}

void draw() {
  background(#342759);
  String current = randomString(target.length());

  fill(#FFC0CB);
  textSize(32);
  text("Target: " + target + 
    System.lineSeparator() +
    "Current: " + current, 
    10, 50);
    
   if (target.equals(current)) {
     noLoop();
   }
}

String randomString(int sLength) {
  String output = "";

  for (int i = 0; i < sLength; i++) {
    char random = (char) random(97, 123);
    output += random;
  }

  return output;
}
