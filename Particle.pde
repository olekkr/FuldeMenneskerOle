class Particle {
  float[] pos = new float[2];
  float[] vel = new float[2];
  float g = 0.3;
  color pColor; 
  int lifeTime = 50;
  
  Particle(float x, float y, float vx, float vy, color pColor){
    pos = new float[] {x,y};
    vel = new float[] {vx,vy};
    this.pColor = pColor;
  }
  void render(){
    fill(pColor, lifeTime*5);
    noStroke();
    circle(pos[0], pos[1], 10);
  }
  void accelerate(){
    vel[1] += g;
    vel[0] -=vel[0] * 0.03;
    vel[1] -=vel[1] * 0.03;
  }
  void move() {
    pos[0] = pos[0] + vel[0];
    pos[1] = pos[1] + vel[1];
    println("x",pos[0], vel[0], pos[0] + vel[0]);
    println("y",pos[1], vel[1], pos[1] + vel[1], "\n");
  }
  void reduceLife(){
    lifeTime -= 1;
  }
  void run(){
    
    accelerate();
    reduceLife();
    render();
    move();
  }
  
}
