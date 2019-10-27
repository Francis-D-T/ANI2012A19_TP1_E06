

class Bouton extends PianoNotes{
  
  String texte;
  
  Bouton(String texteB, float x, float y, float w, float h) {
    super(x, y, w, h);
    texte = texteB; }
    
  void draw() {
     
    if (MouseOver()) {

      stroke(10, 20);
      fill (50, 25, 65);
      rect(x, y, w, h, 20);
      
      
      textFont(texteFont);
      textAlign(CENTER, CENTER);
      textSize(30);
      stroke(10, 20);
      fill(255, 80);
      text(texte, x + (w / 2), y + (h / 2)); }
      
      else {

      stroke(10, 20);
      fill(50, 25, 45, 20);
      rect(x, y, w, h, 20);
      
      textFont(texteFont);
      textAlign(CENTER, CENTER);
      textSize(30);
      stroke(10, 20);
      fill(255, 80);
      text(texte, x + (w / 2), y + (h / 2)); }
  }
}

/*************            **************/
class PianoNotesNoires extends PianoNotes {
  
  float r;
  float r2;
  float r3;
  float r4;
  
  PianoNotesNoires(float x, float y, float w, float h, float round, float round2, float round3, float round4) {
    super(x, y, w, h);
    r = round;
    r2 = round2;
    r3 = round3;
    r4 = round4;}
    
  void draw() {
    
     if (MouseOver()) {
       strokeWeight(5);
       stroke(20);
       fill (10);
       rect(x, y, w, h, r, r2, r3, r4); }

     else {
       strokeWeight(5);
       stroke(10);
       fill(0);
       rect(x, y, w, h, r, r2, r3, r4); }
   }
}

    class PianoNotes {
  
  float x;
  float y;
  float w;
  float h;
  
  PianoNotes(float xpos, float ypos, float widthC, float heightC) {
    x = xpos;
    y = ypos;
    w = widthC;
    h = heightC;
   }
   
  boolean MouseOver() {
    if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
      return true; }
    return false; }
    
   void draw() {
     
     if (MouseOver()) {
       strokeWeight(7);
       stroke(240);
       fill (250);
       rect(x, y, w, h); }
     else {
       strokeWeight(7);
       stroke(230);
       fill(255);
       rect(x, y, w, h); }
  }
}


ArrayList<Particle> particles = new ArrayList<Particle>();
int pixelSteps = 6; // Amount of pixels to skip
boolean drawAsPoints = false;
ArrayList<String> words = new ArrayList<String>();
int wordIndex = 0;


class Particle {
  PVector pos = new PVector(0, 0);
  PVector vel = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  PVector target = new PVector(0, 0);

  float closeEnoughTarget = 50;
  float maxSpeed = 20;
  float maxForce = 1;
  float particleSize = 5;
  boolean isKilled = false;

  color startColor = color(0);
  color targetColor = color(255);
  float colorWeight = 0;
  float colorBlendRate = 0.005;

  void move() {
    // Check if particle is close enough to its target to slow down
    float proximityMult = 1.0;
    float distance = dist(this.pos.x, this.pos.y, this.target.x, this.target.y);
    if (distance < this.closeEnoughTarget) {
      proximityMult = distance/this.closeEnoughTarget;
    }

    // Add force towards target
    PVector towardsTarget = new PVector(this.target.x, this.target.y);
    towardsTarget.sub(this.pos);
    towardsTarget.normalize();
    towardsTarget.mult(this.maxSpeed*proximityMult);

    PVector steer = new PVector(towardsTarget.x, towardsTarget.y);
    steer.sub(this.vel);
    steer.normalize();
    steer.mult(this.maxForce);
    this.acc.add(steer);

    // Move particle
    this.vel.add(this.acc);
    this.pos.add(this.vel);
    this.acc.mult(0);
  }

  void draw() {
    // Draw particle
    color currentColor = lerpColor(this.startColor, this.targetColor, this.colorWeight);
    if (drawAsPoints) {
      stroke(currentColor);
      point(this.pos.x, this.pos.y);
    } else {
      noStroke();
      fill(currentColor);
      ellipse(this.pos.x, this.pos.y, this.particleSize, this.particleSize);
    }

    // Blend towards its target color
    if (this.colorWeight < 1.0) {
      this.colorWeight = min(this.colorWeight+this.colorBlendRate, 1.0);
    }
  }
  
   void kill() {
    if (! this.isKilled) {
      // Set its target outside the scene
      PVector randomPos = generateRandomPos(width/2, height/2, (width+height)/2);
      this.target.x = randomPos.x;
      this.target.y = randomPos.y;

      // Begin blending its color to black
      this.startColor = lerpColor(this.startColor, this.targetColor, this.colorWeight);
      this.targetColor = color(0);
      this.colorWeight = 0;

      this.isKilled = true;
    }
  }
}

PVector generateRandomPos(int x, int y, float mag) {
  PVector randomDir = new PVector(random(0, width), random(0, height));
  
  PVector pos = new PVector(x, y);
  pos.sub(randomDir);
  pos.normalize();
  pos.mult(mag);
  pos.add(x, y);
  
  return pos;
}


void nextWord(String word) {
  // Draw word in memory
  PGraphics pg = createGraphics(width, height);
  pg.beginDraw();
  titleFont = createFont("Youth Power.ttf", 300);
  pg.textFont(titleFont);
  pg.textAlign(CENTER);
  pg.textSize(height/4);
  pg.text(word, width/2, height/2.5);
  pg.endDraw();
  pg.loadPixels();


  int particleCount = particles.size();
  int particleIndex = 0;

  // Collect coordinates as indexes into an array
  // This is so we can randomly pick them to get a more fluid motion
  ArrayList<Integer> coordsIndexes = new ArrayList<Integer>();
  for (int i = 0; i < (width*height)-1; i+= pixelSteps) {
    coordsIndexes.add(i);
  }

  for (int i = 0; i < coordsIndexes.size (); i++) {
    // Pick a random coordinate
    int randomIndex = (int)random(0, coordsIndexes.size());
    int coordIndex = coordsIndexes.get(randomIndex);
    coordsIndexes.remove(randomIndex);
    
    // Only continue if the pixel is not blank
    if (pg.pixels[coordIndex] != 0) {
      // Convert index to its coordinates
      int x = coordIndex % width;
      int y = coordIndex / width;

      Particle newParticle;

      if (particleIndex < particleCount) {
        // Use a particle that's already on the screen 
        newParticle = particles.get(particleIndex);
        newParticle.isKilled = false;
        particleIndex += 1;
      } else {
        // Create a new particle
        newParticle = new Particle();
        
        PVector randomPos = generateRandomPos(width/2, height/2, (width+height)/2);
        newParticle.pos.x = randomPos.x;
        newParticle.pos.y = randomPos.y;
        
        newParticle.maxSpeed = random(2.0, 5.0);
        newParticle.maxForce = newParticle.maxSpeed*0.025;
        newParticle.particleSize = random(3, 6);
        newParticle.colorBlendRate = random(0.0025, 0.03);
        
        particles.add(newParticle);
      }
      
      // Blend it from its current color
      newParticle.startColor = lerpColor(newParticle.startColor, newParticle.targetColor, newParticle.colorWeight);

      newParticle.colorWeight = 0;
      
      // Assign the particle's new target to seek
      newParticle.target.x = x;
      newParticle.target.y = y;
    }
  }
    if (particleIndex < particleCount) {
    for (int i = particleIndex; i < particleCount; i++) {
      Particle particle = particles.get(i);
      particle.kill();
    }
  }
} 
