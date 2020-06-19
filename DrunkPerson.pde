class DrunkPerson {

  int id; 
  int drunkness = 0; 
  float[] pos = {0, 0};
  float s = 1; // universal scalar
  float[] limits = {s*132, s*237}; // = to maximum protrusion in x and y direction
  int tLastDrink = -1501;
  float[] vel; // xy vector
  boolean wasDrinking; //flag that specefies if person was drinking last frame
  ParticleSystem partSys;

  DrunkPerson(float x, float y, float vx, float vy) {
    this.pos = new float[]{x, y};
    this.vel = new float[]{vx, vy};
    id = idSeed;
    idSeed += 1;
  }

  boolean within(float x, float y) {
    return (pos[0] < x && x < pos[0] + limits[0] &&
      pos[1] < y && y < pos[1] + limits[1]);
  }

  void run() {
    render();
    //debug();
    drinkFinEvent();
    moveAndCollide();
  }

  void moveAndCollide() {
    if (pos[0] + limits[0] > width) {
      vel[0] *= -1;
    }
    if (pos[0] < 0) {
      vel[0] *= -1;
    }
    if (pos[1] + limits[1] > width) {
      vel[1] *= -1;
    }
    if (pos[1] < 1) {
      vel[1] *= -1;
    }
    
    this.pos[0] += vel[0];
    this.pos[1] += vel[1];
    if (drunkness == 3){
      partSys.update(pos[0] +60*s, 59.5*s + pos[1]);
    }
  }
  void drink () {
    if (!isDrinking() && drunkness < 4) {
      slurpF.play();
      tLastDrink = millis();
    }
    
  }

  void drinkFinEvent() {
    if (wasDrinking && !isDrinking()) {
      drunkness += 1;
      if (drunkness == 3) {
        partSys = new ParticleSystem(pos[0] +60*s, 59.5*s + pos[1]);
      }
    }
    wasDrinking = isDrinking();
  }

  void drawArm() {
    //print("[arm]");
    stroke(0);
    pushMatrix();
    translate(90*s+pos[0], 94*s+pos[1]);
    if (isDrinking()) {
      rotate(-1.7);
    } else {
      rotate(0.0);
    }
    line(0, 0, 35*s, 0); ///100*s+pos[0], 90*s+pos[1]
    fill(#0d7a05);
    noStroke();
    rect(30*s, -10*s, 13*s, 19*s);
    rect(35*s, -25*s, 3*s, 10*s);
    circle(36.5*s, -10, 13*s);
    popMatrix();
  }

  void drawBody() {
    //print("[body]");
    line(60*s + pos[0], 75*s + pos[1], 60*s + pos[0], 197*s + pos[1]); //torso      
    circle(60*s + pos[0], 43*s + pos[1], 60*s); //head
    circle(48*s + pos[0], 37*s + pos[1], 1*s); // left eye
    circle(69*s + pos[0], 37*s + pos[1], 1*s); // right eye  
    line(60*s + pos[0], 197*s + pos[1], 22*s + pos[0], 237*s + pos[1]);  // left leg
    line(60*s + pos[0], 197*s + pos[1], 103*s + pos[0], 237*s + pos[1]); // right leg
    line(60*s + pos[0], 106*s + pos[1], 0*s + pos[0], 87*s + pos[1]);    // left hand 
    line(60*s + pos[0], 106*s + pos[1], 90*s+pos[0], 94*s+pos[1]);  // right hand
  }

  void render () {
    noFill();
    stroke(200);
    rect(pos[0], pos[1], limits[0], limits[1]);
    stroke(44);
    fill(333);
    strokeWeight(s);

    switch (drunkness) {
    case 0 : //eh face
      drawBody();
      line(49*s + pos[0], 60*s + pos[1], 70*s + pos[0], 60*s + pos[1]);  // mouth 
      drawArm();
      break;

    case 1 :// happy face
      drawBody();
      fill(bgColor);
      circle(60*s + pos[0], 52*s + pos[1], 25*s); // mouth 
      noStroke();
      rect(45*s + pos[0], 39*s + pos[1], 29*s, 20*s); // mouth cover

      drawArm();
      break;

    case 2 ://green face
      fill(#02964c);
      drawBody();
      stroke(0);
      line(49*s + pos[0], 60*s + pos[1], 70*s + pos[0], 60*s + pos[1]);  // mouth

      drawArm();
      break;

    case 3 : //throwing up
      drawBody();
      line(49*s + pos[0], 60*s + pos[1], 70*s + pos[0], 60*s + pos[1]);  // mouth 
      drawArm();
      partSys.run();
      break;

    default:
      limits[0] = 190*s;
      limits[1] = 74*s;
      vel = new float[]{0,0};

      line(pos[0], pos[1], 43*s + pos[0], 31*s + pos[1]); //upper leg 
      line(43*s + pos[0], 31*s + pos[1], 155*s + pos[0], 31*s + pos[1]); //torso
      line(43*s + pos[0], 31*s + pos[1], 0*s + pos[0], 70*s + pos[1]); //lower leg
      circle(170*s + pos[0], 31*s + pos[1], 35*s); //head
      line(155*s + pos[0], 31*s + pos[1], 101*s + pos[0], 70*s + pos[1]);
      line(155*s + pos[0], 31*s + pos[1], 100*s + pos[0], 5*s + pos[1]);
      line(155*s + pos[0], 31*s + pos[1], 100*s + pos[0], 5*s + pos[1]);
      line(163*s + pos[0], 26*s + pos[1], 163*s + pos[0], 38*s + pos[1]);
      circle(175*s + pos[0], 23*s + pos[1], 1*s);      
      line(173*s + pos[0], 36*s + pos[1], 177*s + pos[0], 40*s + pos[1]);
      line(177*s + pos[0], 36*s + pos[1], 173*s + pos[0], 40*s + pos[1]);

      line(177*s + pos[0], 25*s + pos[1], 173*s + pos[0], 21*s + pos[1]);
      line(173*s + pos[0], 25*s + pos[1], 177*s + pos[0], 21*s + pos[1]);
      
    }
  }

  boolean isDrinking() {
    return (millis() - tLastDrink) < 1500;
  }

  void debug() {
    println("drunklvl : ", drunkness, "\ndrinking : ", isDrinking(), "\ntLastDrink, time", millis() - tLastDrink, "\n");
  }
}
