ArrayList<LSystem> plants;
int currentPlant = 0;

void setup() {
  size(640, 600);
  background(255);
  plants = new ArrayList<LSystem>();

  plants.add(new LSystem("F", 5, 25.7));
  plants.get(0).addRule('F', "F[+F]F[-F]F");

  plants.add(new LSystem("F", 5, 20));
  plants.get(1).addRule('F', "F[+F]F[-F][F]");

  plants.add(new LSystem("F", 4, 22.5));
  plants.get(2).addRule('F', "FF-[-F+F+F]+[+F-F-F]");

  plants.add(new LSystem("X", 7, 20));
  plants.get(3).addRule('X', "F[+X]F[-X]+X");
  plants.get(3).addRule('F', "FF");

  plants.add(new LSystem("X", 7, 25.7));
  plants.get(4).addRule('X', "F[+X][-X]FX");
  plants.get(4).addRule('F', "FF");

  plants.add(new LSystem("X", 5, 22.5));
  plants.get(5).addRule('X', "F-[[X]+X]+F[+FX]-X");
  plants.get(5).addRule('F', "FF");
  
  plants.get(0).generate();
  plants.get(0).render();
}

void draw() {
}

void mouseClicked() {
  background(255);

  LSystem p = plants.get(currentPlant);

  p.generate();
  p.render();

  if (p.isFinished()) {
    p.reset();
    currentPlant++;
  }

  if (currentPlant > plants.size() - 1)
    currentPlant = 0;
}
