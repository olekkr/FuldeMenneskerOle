import processing.sound.*;

SoundFile slurpF;
color bgColor = #f0f0f9;
ArrayList<DrunkPerson> drunks = new ArrayList<DrunkPerson>();  


void setup (){
  
  size(800,800);
  drunks.add(new DrunkPerson(50,50,0,0));  
  background(bgColor);
  
  slurpF = new SoundFile(this, "slurp.wav");
 
}

void draw(){
  background(bgColor);
  update();
  debug();
  
}


void mouseClicked(){
  allDrink();
  save("save.png");
} 

void update(){
  for(DrunkPerson drunk : drunks){
    drunk.render();
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
