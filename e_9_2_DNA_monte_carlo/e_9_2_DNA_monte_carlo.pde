import java.util.*;

ArrayList<DNA> population = new ArrayList<DNA>();

void setup() {
  for (int i = 0; i < 100; i++) {
    // Initializing each member of the population
    population.add(new DNA());
  }

  for (int i = 0; i < population.size(); i++) {
    population.get(i).fitness();
  }

  Collections.sort(population, new DNAComparator());

  printList(population);
  println();

  // Start with an empty mating pool.
  ArrayList<DNA> matingPool = new ArrayList<DNA>();

  for (int i = 0; i < 100; i++) {
    matingPool.add(population.get(montecarlo()));
  }

  Collections.sort(matingPool, new DNAComparator());

  printList(matingPool);

  //println();
  //testMontecarlo();
}

void printList(List list) {
  for (int i = 0; i < list.size(); i++) {
    println(i + ". " + list.get(i));
  }
}

int montecarlo() {
  while (true) {
    float r1 = random(population.size());
    float probability = r1;
    float r2 = random(population.size());
    if (r2 < probability) {
      return (int) r1;
    }
  }
}

void testMontecarlo() {
  ArrayList<Integer> integers = new ArrayList<Integer>();

  for (int i = 0; i < population.size(); i++) {
    integers.add(montecarlo());
  }
  
  Collections.sort(integers);
  
  for (Integer number : integers) {
    println(number);
  }
}
