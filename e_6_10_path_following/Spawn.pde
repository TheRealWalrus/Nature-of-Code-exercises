class Spawn {
  int interval = 2000;
  int timer;
  int spawnHeight = height / 2;
  int spread = 100;
  
  Spawn() {
    timer = millis();
    spawn();
  }
  
  void run() {
    if (timer + interval < millis()) { //<>//
      timer = millis();
      spawn();
    }
  }
  
  void spawn() {
    vehicles.add(new Vehicle(0, random(spawnHeight - spread, spawnHeight + spread)));
  }
}
