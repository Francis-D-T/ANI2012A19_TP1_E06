import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.video.*; 
import processing.sound.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Master extends PApplet {





// 0: Title Screen
// 1: Main Screen
// 2: End Screen 
// 3: NiceEnd Screen

int projectScreen = 0;
int gameScreen = 0;
int width = 1280;
int height = 720;
int numFrames = 40;
int currentFrame = 0;
int skipStatus = 0;
boolean CatWalk = true;
boolean PianoStatus = false;

PFont titleFont;
PFont texteFont;

PImage imgJeu1, imgPro;
PImage[] images = new PImage[numFrames];

SoundFile musicTitre,musicEnd, musicNiceEnd, musicMain,
Do, Re, Mi, Fa, Sol, La, Si, Do2;

boolean fadeStatus = false;
boolean CWAnim = false;

float start, runtime;

// Bouton
Bouton j1Choix1, j1Choix2, j1Choix3, j2Choix1; 
Bouton j2Choix2, j2Choix3, j3Choix1, j3Choix2, j3Choix3;

Bouton skip;

// CLoches
PianoNotes pianoDo, pianoRe, pianoMi;
PianoNotes pianoFa, pianoSol, pianoLa, pianoSi, pianoDo2;

/********* SETUP *********/

public void setup() {
  
  //fullScreen();
  
  start = millis();
  
// Font & textes
  words.add("Chat Errant");
  nextWord(words.get(wordIndex));
  titleFont = createFont("Youth Power.ttf", 300);
  texteFont = createFont("darkages.ttf", 300); 
  
// Image et Sequences
  imgJeu1 = loadImage("Jeu1.PNG");
  imgPro = loadImage("Protagoniste.png");
  //catWalk = new Movie(this, "CatWalk.avi");
  //catWalk.play();
  for (int i = 0; i < numFrames; i++) {
    String imageName = "Protagoniste Walk_" + nf(i, 5) + ".png";
    images[i] = loadImage(imageName); }
    
// Music import
  //musicMain = new SoundFile(this, "");

  Do = new SoundFile(this, "do-stretched.wav");
  Re = new SoundFile(this, "do-stretched.wav");
  Mi = new SoundFile(this, "do-stretched.wav");
  Fa = new SoundFile(this, "do-stretched.wav");
  Sol = new SoundFile(this, "do-stretched.wav");
  La = new SoundFile(this, "do-stretched.wav");
  Si = new SoundFile(this, "do-stretched.wav");
  Do2 = new SoundFile(this, "do-stretched.wav");
    
// Jeu1
  j1Choix1 = new Bouton("Jouer avec la cloche", width / 1.5f, height / 1.465f , width / 3, height / 20);
  j1Choix2 = new Bouton("Continuer son chemin", width / 1.5f, height / 1.35f, width / 3, height / 20);
  j1Choix3 = new Bouton("Entre par la porte", width / 1.5f, height / 1.25f, width / 3, height / 20);
  
// Jeu2
  j2Choix1 = new Bouton("faire demi tour", width / 1.5f, height / 1.465f, width / 3, height / 20);
  j2Choix2 = new Bouton("Vers la lumiere", width / 1.5f, height / 1.35f, width / 3, height / 20);
  j2Choix3 = new Bouton("Monter a l'etage", width / 1.5f, height / 1.25f, width / 3, height / 20);
    
// Jeu3
  j3Choix1 = new Bouton("Manger le poisson", width / 1.5f, height / 1.465f, width / 3, height / 20);
  j3Choix2 = new Bouton("Manger le poulet", width / 1.5f, height / 1.35f, width / 3, height / 20);
  j3Choix3 = new Bouton("Faire demi tour", width / 1.5f, height / 1.25f, width / 3, height / 20);
  
// Skip
  skip = new Bouton("Skip", width / 1.265f, height / 1.14f, width / 12, height / 30);
  
// Piano Notes
  pianoDo = new PianoNotes(width / 1.5f, height / 1.465f, width / 3, height / 20);
}

/********* DRAW *********/

public void draw() {

  if (projectScreen == 0) {
    titleScreen(); } 
    else if (projectScreen == 1) {
    mainScreen(); } 
    else if (projectScreen == 2) {
    endScreen(); } 
    else if (projectScreen == 3) {
    niceEndScreen(); }
}


class Bouton extends PianoNotes{
  
  String texte;
  
  Bouton(String texteB, float x, float y, int w, int h) {
    super(x, y, w, h);
    texte = texteB; }
    
  public void draw() {
     
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

class PianoNotes {
  
  float x;
  float y;
  int w;
  int h;
  
  PianoNotes(float xpos, float ypos, int widthC, int heightC) {
    x = xpos;
    y = ypos;
    w = widthC;
    h = heightC;
   }
   
  public boolean MouseOver() {
    if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
      return true; }
    return false; }
    
   public void draw() {
     
     if (MouseOver()) {
       stroke(10, 20);
       fill (255);
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

  int startColor = color(0);
  int targetColor = color(255);
  float colorWeight = 0;
  float colorBlendRate = 0.005f;

  public void move() {
    // Check if particle is close enough to its target to slow down
    float proximityMult = 1.0f;
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

  public void draw() {
    // Draw particle
    int currentColor = lerpColor(this.startColor, this.targetColor, this.colorWeight);
    if (drawAsPoints) {
      stroke(currentColor);
      point(this.pos.x, this.pos.y);
    } else {
      noStroke();
      fill(currentColor);
      ellipse(this.pos.x, this.pos.y, this.particleSize, this.particleSize);
    }

    // Blend towards its target color
    if (this.colorWeight < 1.0f) {
      this.colorWeight = min(this.colorWeight+this.colorBlendRate, 1.0f);
    }
  }
  
   public void kill() {
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

public PVector generateRandomPos(int x, int y, float mag) {
  PVector randomDir = new PVector(random(0, width), random(0, height));
  
  PVector pos = new PVector(x, y);
  pos.sub(randomDir);
  pos.normalize();
  pos.mult(mag);
  pos.add(x, y);
  
  return pos;
}


public void nextWord(String word) {
  // Draw word in memory
  PGraphics pg = createGraphics(width, height);
  pg.beginDraw();
  pg.fill(0);
  pg.textAlign(CENTER);
  titleFont = createFont("Youth Power.ttf", 300);
  pg.textFont(titleFont);
  pg.textSize(height/4);
  pg.text(word, width/2, height/2.5f);
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
        
        newParticle.maxSpeed = random(2.0f, 5.0f);
        newParticle.maxForce = newParticle.maxSpeed*0.025f;
        newParticle.particleSize = random(3, 6);
        newParticle.colorBlendRate = random(0.0025f, 0.03f);
        
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



    
    
public void endScreen() {
  fill(0, 60);
  rect(0, 0, width, height);
  textFont(titleFont);
  fill(255, 140);
  textAlign(CENTER);
  textSize((width + height) / 10);
  text("Chat mort...", width / 2, height / 2.5f);
  textSize((width + height) / 100);
  text("Clicker pour l'ecran titre", width/ 2, height / 1.1f);
}
public void keyPressed() {
    
  if (key == CODED) {
    if (keyCode == ESC){
    exit(); }
  }
}
/********* In Game *********/
public void mouseDragged() {
  if (projectScreen==0) {
    if (mouseButton == RIGHT) {
      for (Particle particle : particles) {
        if (dist(particle.pos.x, particle.pos.y, mouseX, mouseY) < 50) {
          particle.kill();
        }
      }
    }
  }
}

public void mouseReleased() {
  
//Jeu1, Evenements selon le choix
 if (mouseButton == LEFT) { 
  if (projectScreen==0) { 
    if (CatWalk) {
      CWAnim = true;
      currentFrame = 0;
      start = millis(); }
  }
        
  else if (projectScreen==1) {
    if (gameScreen==0) {
      if (j1Choix1.MouseOver()) { 
        PianoStatus = true; }
    
      if (j1Choix2.MouseOver()) {
        theEnd(); }
    
      if (j1Choix3.MouseOver()) {
        fadeStatus = true; 
        start = millis(); }
      
      if (skip.MouseOver()) {
        next(); }
    }
     
// Jeu2, Evenements selon le choix

    else if (gameScreen==1) {
      if (j2Choix1.MouseOver()) {
        skipStatus = 1;
        theEnd(); }
      
      if (j2Choix2.MouseOver()) {
        fadeStatus = true; 
        start = millis(); }
          
      if (j2Choix3.MouseOver()) {
        skipStatus = 1;
        theEnd(); }
        
      if (skip.MouseOver()) {
        next2(); }
      }
     
// Jeu3, Evenements selon le choix

    else if (gameScreen==2) {
      if (j3Choix1.MouseOver()) {
        skipStatus = 2;
        theEnd(); }
      
      if (j3Choix2.MouseOver()) {
        fadeStatus = true; 
        start = millis(); }
          
      if (j3Choix3.MouseOver()) {
        skipStatus = 2;
        theEnd(); }
      }
      
// Cloches, Evennements

    else if (gameScreen==3) {
      
      if (pianoDo.MouseOver()) 
        Do.play();
      //if (pianoRe.MouseOver()) 
       // Re.play();
      //if (pianoMi.MouseOver()) 
       // Mi.play();
      //if (pianoFa.MouseOver()) 
       // Fa.play();
     // if (pianoSol.MouseOver()) 
    //    Sol.play();
     // if (pianoLa.MouseOver()) 
     //   La.play();
     // if (pianoSi.MouseOver()) 
     //   Si.play();
     // if (pianoDo2.MouseOver()) 
     //   Do2.play(); 
   }
}
    
/*************            **************/

  else if (projectScreen==2) {
    resetProject(); }
     
  else if (projectScreen==3) {
    resetProject(); }
  }
}
/*************            **************/

// Start the game
public void startGame() {
  projectScreen = 1; } 
  
// Resset to title sceen
public void resetProject() {
  wordIndex += 1;
    if (wordIndex > words.size()-1) { 
      wordIndex = 0;
    }
  nextWord(words.get(wordIndex));
  projectScreen = 0; }

// En cas de mauvaise reponse
public void theEnd() {
  gameScreen = 0;
  projectScreen = 2; }

// Passer au niveau 2
public void next() {
  gameScreen = 1; }

// Passer au niveau 3
public void next2() {
  gameScreen = 2; }
  
// Piano
public void pianoPlay() {
  gameScreen = 3;  }

// En cas de Victoire
public void win() {
  gameScreen = 0;
  projectScreen = 3; }

  
public void fade(float decay) {
  rectMode(CORNER);
  noStroke();
  fill(0, decay);
  rect(0, 0, width, height); }
 
    
//void movieEvent(Movie m) {
//m.read(); }
//image(catWalk, 0, 0, width, height);
// 0: Jeu 1
// 1: Jeu 2
// 2: Jeu 3
// 3: Cloches

public void mainScreen() {
 
   if (gameScreen == 0) {
     Jeu1(); } 
   else if (gameScreen == 1) {
     Jeu2(); } 
   else if (gameScreen == 2) {
     Jeu3(); }
   else if (gameScreen == 3) {
     Piano(); }
}

// Premier choix
public void Jeu1() {
  

  runtime = millis() - start;
  if(PianoStatus) {
    fade(120);
    if (runtime > 900) {
      PianoStatus = false;
      pianoPlay(); }
  }

  if(fadeStatus) {
    fade(120);
    if (runtime > 900) {
      fadeStatus = false;
      next(); }
  }
  else {

    
    if (skipStatus == 1 || skipStatus == 2) {
      skip.draw(); }
    j1Choix1.draw();
    j1Choix2.draw();
    j1Choix3.draw(); } 
    
    tint(255, 120);
    image(imgJeu1, 0, 0, width, height);
    tint(255, 255);
    image(imgPro, 0, 0, width, height); }


// Deuxieme choix
public void Jeu2() {
  
  runtime = millis() - start;
  if(fadeStatus) {
    fade(120);
    if (runtime > 900) {
      fadeStatus = false;
      next2(); }
  }
  else {
    
    if (skipStatus == 2) {
      skip.draw(); }
    j2Choix1.draw();
    j2Choix2.draw();
    j2Choix3.draw(); 
  
    tint(255, 120);
    image(imgJeu1, 0, 0, width, height); }
}

// Troisieme choix
public void Jeu3() {
  
  runtime = millis() - start;
  if(fadeStatus) {
    fade(120);
    if (runtime > 900) {
      fadeStatus = false;
      skipStatus = 0;
      win(); }
  }
  else {

   
    j3Choix1.draw();
    j3Choix2.draw();
    j3Choix3.draw(); 
  
    tint(255, 120);
    image(imgJeu1, 0, 0, width, height); }
}
    
// Cloches
public void Piano() {
  runtime = millis() - start;
  pianoDo.draw();
  
  if(PianoStatus) {
    theEnd(); }
    
  else {
    
    fill(200, 110);
    rect(0, 0, width, height);
    
    tint(255, 255);
    image(imgPro, 0, 0, width, height); }
    
}
public void niceEndScreen() {
  fill(255, 10);
  rect(0, 0, width, height);
  textFont(titleFont);
  fill(0, 40);
  textAlign(CENTER);
  textSize((width + height) / 10);
  text("Chat heureux!", width /  2, height / 2.5f);
  textSize((width + height) / 100);
  text("Clicker pour l'ecran titre", width / 2, height / 1.1f);
}
public void titleScreen() {
  
  runtime = (millis() - start);
  if(fadeStatus) {
    fade(40);
      if (runtime > 2800) {
        startGame();
        fadeStatus = false;
       }
  }
  else {
    fill(65, 17, 94);
    noStroke();
    rect(0, 0, width, height);
    
  for (int X = particles.size ()-1; X > -1; X--) {
    // Simulate and draw pixels
    Particle particle = particles.get(X);
    particle.move();
    particle.draw(); 
  
    if (particle.isKilled) {
          if (particle.pos.x < 0 || particle.pos.x > width || particle.pos.y < 0 || particle.pos.y > height) {
            particles.remove(particle); }
    }
  }
        

    fill(255);
    textAlign(CENTER);
    textFont(titleFont);
    textSize((width + height) / 100);
    text("Clicker pour jouer",  width / 2, height / 1.1f); 
    
    if (CWAnim) {
      currentFrame = (currentFrame+1) % numFrames;      
      int offset = 0;
      for (int x = 0; x < width; x += images[0].width) { 
      image(images[(currentFrame+offset) % numFrames], x, 0, width, height);
      offset+=2; 
        if (runtime > 1600) {
          fadeStatus = true;
          CWAnim = false; }
       }
    }
  }  
}
  public void settings() {  size(1280, 720);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Master" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
