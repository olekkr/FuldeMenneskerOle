import processing.sound.*;
int idSeed = 0;
SoundFile slurpF;
color bgColor = #f0f0f9;
ArrayList<DrunkPerson> drunks = new ArrayList<DrunkPerson>();  
ArrayList<ParticleSystem> partSystems = new ArrayList<ParticleSystem>();  

void setup (){
  
  size(800,800);
  drunks.add(new DrunkPerson(50,50,0,0));  
  drunks.add(new DrunkPerson(400,50,0,0));  
  background(bgColor);
  
  slurpF = new SoundFile(this, "slurp.wav");
 
}

void draw(){
  background(bgColor);
  runAll();
  
}


void mouseClicked(){
  //allDrink();
  save("save.png");
  int idx = 0;
  for(DrunkPerson drunk : drunks){
    if(drunk.pos[0] < mouseX && mouseX < drunk.pos[0] + drunk.limits[0] &&
    drunk.pos[1] < mouseY && mouseY < drunk.pos[1] + drunk.limits[1]){
      drunk.drink();
    }
    
    println(idx, drunk.pos[0] , mouseX , drunk.pos[0] + drunk.limits[0]);
    idx += 1;
  }
} 

void runAll(){
  for(DrunkPerson drunk : drunks){
    drunk.run();
  }
  
}
void allDrink(){
  for(DrunkPerson drunk : drunks){
    drunk.drink();
  }
}
void debug(){
  for(DrunkPerson drunk : drunks){
    drunk.debug();
  }
}
