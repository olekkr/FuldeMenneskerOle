class ParticleSystem {
  float[] origo = new float[2];
  ArrayList<Particle> particles = new ArrayList<Particle>();
  color pColor = #4EFF1F;


  ParticleSystem(float x, float y) {
    origo[0] = x;
    origo[1] = y;
  }
  void update (float x, float y) {
    origo = new float[]{x,y};
  }
  void newPart () {
    float vx = random(-2, 2);
    float vy = random(-2, 2);
    particles.add(new Particle(origo[0], origo[1],vx, vy, pColor));
    println(random(width), random(height) );
  }
  void trimParts () {
    for (int i = 0; i<particles.size(); i++) {
      if (particles.get(i).lifeTime<0) {
        particles.remove(i);
      }
    }
  }
  void run() {
    newPart();
    trimParts();
    for (Particle part : particles) {
      part.run();
    }
  }
}
