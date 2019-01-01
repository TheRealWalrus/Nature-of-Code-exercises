import java.util.*;

ArrayList<DNA> population = new ArrayList<DNA>();

void setup() {
  initializePopulation();
  updateFitness();
  
  Collections.sort(population, new DNAComparator());
  
  printList(population);
  println();
  
  ArrayList<DNA> matingPool = new ArrayList<DNA>();
  
  for (int i = 0; i < population.size(); i++) {
    for(int j = 0; j <= i; j++) {
      matingPool.add(population.get(i));
    }
  }
    
  printList(matingPool);
}

void updateFitness() {
  for (int i = 0; i < population.size(); i++) {
    population.get(i).fitness();
  }
}

void initializePopulation() {
  for (int i = 0; i < 100; i++) {
    population.add(new DNA());
  }
}

void printList(List list) {
  for (int i = 0; i < list.size(); i++) {
    println(i + ". " + list.get(i));
  }
}
