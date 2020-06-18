import processing.sound.*;

SoundFile slurpF;
color bgColor = #f0f0f9;
ArrayList<DrunkPerson> drunks = new ArrayList<DrunkPerson>();  


void setup (){
  
  size(800,800);
  drunks.add(new DrunkPerson(50,50));  
  background(bgColor);
  update();
  slurpF = new SoundFile(this, "slurp.wav");
 
}

void draw(){}


void mouseClicked(){
  update();
} 

void update(){
  for(DrunkPerson drunk : drunks){
    drunk.render();
  }
}
