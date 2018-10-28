class Tree {
  ArrayList<ArrayList<Branch>> generations;
  ArrayList<Leaf> leaves;
  float len;
  float weight;
  final int maxGenerations = 9;

  Tree(float x, float y, float _len, float _weight) {
    len = _len;
    weight = _weight;

    generations = new ArrayList<ArrayList<Branch>>();
    generations.add(new ArrayList<Branch>());
    generations.get(0).add(new Branch(new PVector(x, y), new PVector(x, y - len), weight, 1000 * maxGenerations));
    leaves = new ArrayList<Leaf>();
  }

  void run () {
    render();
    grow();
  }

  void render() {
    for (int i = 0; i < generations.size(); i++) {
      for (int j = 0; j < generations.get(i).size(); j++) {
        generations.get(i).get(j).render();
      }
    }
    for (Leaf l : leaves) {
      l.render();
    }
  }

  void grow() {
    if (generations.get(generations.size() - 1).get(0).isFinished()) {
      if (generations.size() < maxGenerations) generate();
      else {
        if (leaves.size() == 0)
          sprout();
      }
    }
  }

  void generate() {
    generations.add(new ArrayList<Branch>());

    for (Branch b : generations.get(generations.size() - 2)) {
      PVector branch1 = PVector.sub(b.end, b.start);
      branch1.mult(0.66);
      branch1.rotate(PI / 6);
      PVector branch2 = PVector.add(b.end, branch1);
      branch1.rotate(-PI / 3);
      branch1.add(b.end);

      generations.get(generations.size() - 1).add(new Branch(b.end, branch1, weight * pow(0.66, generations.size() - 1), 
        (maxGenerations - generations.size()) * 1000));
      generations.get(generations.size() - 1).add(new Branch(b.end, branch2, weight * pow(0.66, generations.size() - 1), 
        (maxGenerations - generations.size()) * 1000));
    }
  }

  void sprout() {
    for (Branch b : generations.get(generations.size() - 1)) {
      PVector tmp = PVector.sub(b.end, b.start);
      leaves.add(new Leaf(b.end, tmp.heading()));
    }
  }
}