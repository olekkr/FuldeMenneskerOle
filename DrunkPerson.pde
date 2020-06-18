class DrunkPerson {
  int drunkness = 2;
  int[] pos = {0, 0};
  float s = 3;
  float[] limits = {s*118, s*237}; // = to maximum protrusion in x and y 
  
  int millisSinceLastDrink = 151;

  DrunkPerson(int x, int y) {
    this.pos[0] = x;
    this.pos[1] = y;
  }
  void drink () {
    
    slurpF.play();
    println("drunklvl : ", drunkness);
  }

  void render () {
    stroke(0);
    noFill();
    fill(bgColor);
    strokeWeight(1*s);
    switch (drunkness) {
    case 0 :
      line(60*s + pos[0], 75*s + pos[1], 60*s + pos[0], 197*s + pos[1]); //torso      
      circle(60*s + pos[0], 43*s + pos[1], 60*s); //head
      circle(48*s + pos[0], 37*s + pos[1], 1*s); // left eye
      circle(69*s + pos[0], 37*s + pos[1], 1*s); // right eye  
      line(60*s + pos[0], 197*s + pos[1], 22*s + pos[0], 237*s + pos[1]);  // left leg
      line(60*s + pos[0], 197*s + pos[1], 103*s + pos[0], 237*s + pos[1]); // right leg
      line(60*s + pos[0], 106*s + pos[1], 0*s + pos[0], 87*s + pos[1]);    // left hand 
      line(60*s + pos[0], 106*s + pos[1], 117*s + pos[0], 87*s + pos[1]);  // right hand
      line(49*s + pos[0], 60*s + pos[1], 70*s + pos[0], 60*s + pos[1]);  // mouth 

      break;
    case 1 :
      
      line(60*s + pos[0], 75*s + pos[1], 60*s + pos[0], 197*s + pos[1]); //torso      
      circle(60*s + pos[0], 43*s + pos[1], 60*s); //head
      circle(48*s + pos[0], 37*s + pos[1], 1*s); // left eye
      circle(69*s + pos[0], 37*s + pos[1], 1*s); // right eye  
      line(60*s + pos[0], 197*s + pos[1], 22*s + pos[0], 237*s + pos[1]);  // left leg
      line(60*s + pos[0], 197*s + pos[1], 103*s + pos[0], 237*s + pos[1]); // right leg
      line(60*s + pos[0], 106*s + pos[1], 0*s + pos[0], 87*s + pos[1]);    // left hand 
      line(60*s + pos[0], 106*s + pos[1], 117*s + pos[0], 87*s + pos[1]);  // right hand

      circle(60*s + pos[0], 55*s + pos[1], 25*s); // mouth
      fill(bgColor);
      noStroke();
      rect(45*s + pos[0], 40*s + pos[1], 13*s + pos[0], 5*s + pos[1]); // mouth
      break;
    case 2 :
      line(60*s + pos[0], 75*s + pos[1], 60*s + pos[0], 197*s + pos[1]); //torso      
      circle(60*s + pos[0], 43*s + pos[1], 60*s); //head
      circle(48*s + pos[0], 37*s + pos[1], 1*s); // left eye
      circle(69*s + pos[0], 37*s + pos[1], 1*s); // right eye  
      line(60*s + pos[0], 197*s + pos[1], 22*s + pos[0], 237*s + pos[1]);  // left leg
      line(60*s + pos[0], 197*s + pos[1], 103*s + pos[0], 237*s + pos[1]); // right leg
      line(60*s + pos[0], 106*s + pos[1], 0*s + pos[0], 87*s + pos[1]);    // left hand 
      line(60*s + pos[0], 106*s + pos[1], 117*s + pos[0], 87*s + pos[1]);  // right hand
      line(49*s + pos[0], 60*s + pos[1], 70*s + pos[0], 60*s + pos[1]);  // mouth 
      break;
    case 3 :
      break;
    }
  }
  boolean isDrinking (){
    return 150-millis() < 0;
  }
}
