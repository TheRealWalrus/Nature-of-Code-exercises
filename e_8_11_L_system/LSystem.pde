class LSystem {
  String axiom;
  int iterations;
  float angle;

  String sentance;
  int generation;
  HashMap<Character, String> ruleSet;

  LSystem(String _axiom, int _iterations, float _angle) {
    axiom = _axiom;
    iterations = _iterations;
    angle = _angle;
    reset();
    ruleSet = new HashMap<Character, String>();
  }

  void addRule(Character input, String output) {
    ruleSet.put(input, output);
  }

  void generate() {
    StringBuilder next = new StringBuilder();

    for (int i = 0; i < sentance.length(); i++) {
      char myKey = sentance.charAt(i);
      String value = ruleSet.get(myKey);
      next.append(value != null ? value : myKey);
    }
    sentance = next.toString();
    generation++;
  }

  void render() {
    Turtle turtle = new Turtle(86 * pow(1.7, -generation), radians(angle));
    for (int i = 0; i < sentance.length(); i++) {
      turtle.instruction(sentance.charAt(i));
    }
    displayRules();
  }

  void reset() {
    generation = 0;
    sentance = axiom;
  }

  boolean isFinished() {
    return generation >= iterations ? true : false;
  }

  void displayRules() {
    float margin = 20;
    float y = height / 2 + 60;
    String config = "n = " + iterations + ", δ = " + angle + "°" + "\n" + axiom;
    fill(0);
    textSize(20);
    text(config, margin, y);

    int counter = 1;
    for (HashMap.Entry<Character, String> entry : ruleSet.entrySet()) {
      StringBuilder rule = new StringBuilder();
      counter++;
      for (int i = 0; i < counter; i++)
        rule.append("\n");
      rule.append(entry.getKey() + " → " + entry.getValue());
      text(rule.toString(), margin, y);
    }
  }
}
