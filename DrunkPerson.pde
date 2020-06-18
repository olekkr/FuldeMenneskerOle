class DrunkPerson {

  int drunkness = 0; 
  int[] pos = {0, 0};
  float s = 1; // universal scalar
  float[] limits = {s*139, s*237}; // = to maximum protrusion in x and y direction
  int tLastDrink = -1501;
  float[] vel; // xy vector
  boolean wasDrinking; //flag that specefies if person was drinking last frame

  DrunkPerson(int x, int y, int vx, int vy) {
    this.pos = new int[]{x, y};
    this.vel = new float[]{vx, vy};
  }
  void drink () {
    if (!isDrinking() && drunkness < 4) {
      slurpF.play();
      print("[DRINKING]");
      tLastDrink = millis();
      
    }
    if (wasDrinking && !isDrinking()) {
      drunkness += 1;
    }

    wasDrinking = isDrinking();
  }
  

  void drawArm() {
    print("[arm]");
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
    print("[body]");
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

    case 3 :
      drawBody();
      line(49*s + pos[0], 60*s + pos[1], 70*s + pos[0], 60*s + pos[1]);  // mouth 
      drawArm();
      break;
    default:
      println("[ERROR]\"reached default case\"");
    }
  }

  boolean isDrinking() {
    return (millis() - tLastDrink) < 1500;
  }

  void debug() {
    println("drunklvl : ", drunkness, "\ndrinking : ", isDrinking(), "\ntLastDrink, time", millis() - tLastDrink, "\n");
  }
}
