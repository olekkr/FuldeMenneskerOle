import processing.sound.*;
int idSeed = 0;
SoundFile slurpF;
color bgColor = #f0f0f9;
ArrayList<DrunkPerson> drunks = new ArrayList<DrunkPerson>();  
ArrayList<ParticleSystem> partSystems = new ArrayList<ParticleSystem>();  

void setup () {

  size(800, 800);

  background(bgColor);

  for (int i = 10; i > 0; i--) {
    drunks.add(new DrunkPerson(random(0, width-132), random(0, height-237), random(-3, 3), random(-3, 3)));
  }

  slurpF = new SoundFile(this, "slurp.wav");
}

void draw() {
  background(bgColor);
  runAll();
}


void mousePressed() {
  //allDrink();
  save("save.png");
  int idx = 0;
  for (DrunkPerson drunk : drunks) {
    if (drunk.within(mouseX, mouseY)) {
      drunk.drink();
      break;
    }
  }
} 

void runAll() {
  for (DrunkPerson drunk : drunks) {
    drunk.run();
  }
}
void allDrink() {
  for (DrunkPerson drunk : drunks) {
    drunk.drink();
  }
}
void debug() {
  for (DrunkPerson drunk : drunks) {
    drunk.debug();
  }
}
