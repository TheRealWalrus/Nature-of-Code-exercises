//tree should consist of an arrayList of generations, that store each generation of branches

class Tree {
  ArrayList<Branch> branches;
  
  Tree(float x, float y, float len, float weight) {
    branches = new ArrayList<Branch>();
    branches.add(new Branch(new PVector(x, y), new PVector(x, y + len), weight));
    
  }
  
  void render() {
    for (Branch b : branches) {
      b.render();
    }
  }
  
  void generate() {
    
  }
}
