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

// http://theremin.music.uiowa.edu/MISpiano.html
// Te3xte Particule :  https://www.openprocessing.org/sketch/377231/
// Sound: soundbible.com
// Sound: https://offers.adobe.com/en/na/audition/offers/audition_dlc.html
// Video: https://www.videvo.net/free-motion-graphics/
// Image Background: https://fr.vecteezy.com/art-vectoriel/93757-vecteur-de-fond-jaune-bokeh
// Image Piano: https://www.merriammusic.com/pianos/






// 0: Title Screen
// 1: Main Screen
// 2: End Screen 
// 3: NiceEnd Screen

int projectScreen = 0;
int gameScreen = 0;
int width = 1280;
int height = 720;
int numFrames = 30;
int currentFrame = 0;
int skipStatus = 0;

Movie EndMovie;

boolean CatWalk = true;
boolean PianoStatus = false;
boolean doOnce = true;
boolean doOnceD = true;
boolean Drag = false;
boolean fadeStatus = false;
boolean CWAnim = false;

PFont titleFont;
PFont texteFont;

PImage imgJeu1, imgJeu2, imgJeu3, imgPro, imgPianoLogo, imaTitre;
PImage[] images = new PImage[numFrames];

SoundFile musicTitre,musicEnd, musicNiceEnd, musicMain, musicMain2, Yhea,
C3, Db3, D3, Eb3, E3, F3, Gb3, G3, Ab3, A3, Bb3, B3, C4, Db4;

float start, runtime;

// Bouton
Bouton j1Choix1, j1Choix2, j1Choix3, j2Choix1; 
Bouton j2Choix2, j2Choix3, j3Choix1, j3Choix2, j3Choix3;

Bouton skip, PianoQ;

// CLoches
PianoNotes pianoC3, pianoD3, pianoE3, pianoF3, pianoG3, pianoA3, pianoB3, pianoC4;
PianoNotesNoires pianoAb3, pianoBb3, pianoDb3, pianoEb3, pianoGb3, pianoDb4;

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
  imgJeu2 = loadImage("Jeu2.png");
  imgJeu3 = loadImage("Jeu3.png");
  imaTitre = loadImage("TitreBackground.png");
  imaTitre.resize(width, height);
  imgPro = loadImage("Protagoniste.png");
  imgPianoLogo = loadImage("pianoLogo.png");
  imgPianoLogo.resize(width / 5, height / 2);
  //catWalk = new Movie(this, "CatWalk.avi");
  //catWalk.play();
  for (int i = 0; i < numFrames; i++) {
    String imageName = "Protagoniste Walk_" + nf(i, 5) + ".png";
    images[i] = loadImage(imageName); }
    
// Music import
  musicMain = new SoundFile(this, "Ambience Storm Light 01.aif");
  musicMain2 = new SoundFile(this, "Ambience Court House Entrance 01.aif");
  musicNiceEnd = new SoundFile(this, "Purring.wav");
  Yhea = new SoundFile(this, "cheering.aif");

  C3 = new SoundFile(this, "Piano.ff.C3.aif");
  Db3 = new SoundFile(this, "Piano.ff.Db3.aif");
  D3 = new SoundFile(this, "Piano.ff.D3.aif");
  Eb3 = new SoundFile(this, "Piano.ff.Eb3.aif");
  E3 = new SoundFile(this, "Piano.ff.E3.aif");
  F3 = new SoundFile(this, "Piano.ff.F3.aif");
  Gb3 = new SoundFile(this, "Piano.ff.Gb3.aif");
  G3 = new SoundFile(this, "Piano.ff.G3.aif");
  Ab3 = new SoundFile(this, "Piano.ff.Ab3.aif");
  A3 = new SoundFile(this, "Piano.ff.A3.aif");
  Bb3 = new SoundFile(this, "Piano.ff.Bb3.aif");
  B3 = new SoundFile(this, "Piano.ff.B3.aif");
  C4 = new SoundFile(this, "Piano.ff.C4.aif");
  Db4 = new SoundFile(this, "Piano.ff.Db4.aif");
    
// Movie
  EndMovie = new Movie(this, "HoneycombMosaic.mov");
  EndMovie.loop();
  
// Jeu1
  j1Choix1 = new Bouton("Jouer au piano", width / 1.5f, height / 1.465f , width / 3, height / 20);
  j1Choix2 = new Bouton("Continuer son chemin", width / 1.5f, height / 1.35f, width / 3, height / 20);
  j1Choix3 = new Bouton("Entre par la porte", width / 1.5f, height / 1.25f, width / 3, height / 20);
  
// Jeu2
  j2Choix1 = new Bouton("faire demi tour", width / 1.5f, height / 1.465f, width / 3, height / 20);
  j2Choix2 = new Bouton("Aller vers la lumiere", width / 1.5f, height / 1.35f, width / 3, height / 20);
  j2Choix3 = new Bouton("Monter a l'etage", width / 1.5f, height / 1.25f, width / 3, height / 20);
    
// Jeu3
  j3Choix1 = new Bouton("Manger le poisson", width / 1.5f, height / 1.465f, width / 3, height / 20);
  j3Choix2 = new Bouton("Manger le poulet", width / 1.5f, height / 1.35f, width / 3, height / 20);
  j3Choix3 = new Bouton("Ne rien toucher", width / 1.5f, height / 1.25f, width / 3, height / 20);
  
// Skip
  skip = new Bouton("Skip", width / 1.265f, height / 1.14f, width / 12, height / 30);
  PianoQ = new Bouton("Continuer", width / 1.2f, height / 35, width / 6.5f, height / 20);
  
// Piano Notes
  pianoC3 = new PianoNotes(0, height / 4, width / 8, height / 1.2f);
  pianoDb3 = new PianoNotesNoires(width / 11, height / 4, width / 20, height / 2, 0, 0, 7, 7);
  pianoD3 = new PianoNotes(width / 8, height / 4, width / 8, height / 1.2f);
  pianoEb3 = new PianoNotesNoires(width / 4.3f, height / 4, width / 20, height / 2, 0, 0, 7, 7);
  pianoE3 = new PianoNotes(width / 4, height / 4, width / 8, height / 1.2f);
  pianoF3 = new PianoNotes(width / 2.666666666666f, height / 4, width / 8, height / 1.2f);
  pianoGb3 = new PianoNotesNoires(width / 2.15f, height / 4, width / 20, height / 2, 0, 0, 7, 7);
  pianoG3 = new PianoNotes(width / 2, height / 4, width / 8, height / 1.2f);
  pianoAb3 = new PianoNotesNoires(width / 1.665f, height / 4, width / 20, height / 2, 0, 0, 7, 7);
  pianoA3 = new PianoNotes(width / 1.6f, height / 4, width / 8, height / 1.2f);
  pianoBb3 = new PianoNotesNoires(width / 1.36f, height / 4, width / 20, height / 2, 0, 0, 7, 7);
  pianoB3 = new PianoNotes(width / 1.33333333333f, height / 4, width / 8, height / 1.2f);
  pianoC4 = new PianoNotes(width / 1.142857f, height / 4, width / 8, height / 1.2f);
  pianoDb4 = new PianoNotesNoires(width / 1.03f, height / 4, width / 20, height / 2, 0, 0, 7, 7);
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
  
  Bouton(String texteB, float x, float y, float w, float h) {
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
    
  public void draw() {
    
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
   
  public boolean MouseOver() {
    if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
      return true; }
    return false; }
    
   public void draw() {
     
     if (MouseOver()) {
       strokeWeight(7);
       stroke(25);
       fill (245);
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
  titleFont = createFont("Youth Power.ttf", 300);
  pg.textFont(titleFont);
  pg.textAlign(CENTER);
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
int i = 0;
boolean titreAnim, titreAnimF = false;
boolean titreAnimI =  true;
 
public void endScreen() {
  
  fill(0, 150);
  triangle(0, 0, 0, height, width / 5, height / 2);
  triangle(width, height, width, 0, width / 1.2f, height / 2);
  
  tint(100, 50);
  image(EndMovie, 0, 0);
  
  
  if (titreAnimI) {
    i = i +9;
    textFont(titleFont);
    fill(255, 200);
    textAlign(CENTER);
    textSize((width + height) / 10);
    text("Chat mort...", width / 2, i);
    if (i == (height / 2.5f)) { 
      titreAnim = true;
      titreAnimI = false; }
  }
    
  if (titreAnim) {
    i = i - 3;
    textFont(titleFont);
    fill(255, 225);
    textAlign(CENTER);
    textSize((width + height) / 10);
    text("Chat mort...", width / 2, i);
    if (i == (height / 3)) { 
      titreAnim = false;
      titreAnimF = true; }
  }
    
  if (titreAnimF) {
    i = i + 1;
    textFont(titleFont);
    fill(255, 255);
    textAlign(CENTER);
    textSize((width + height) / 10);
    text("Chat mort...", width / 2, i);
    if (i == (height / 2.5f)) { 
      titreAnimF = false; }
  }
      
   else if (!titreAnimF && !titreAnimI && !titreAnim) {
     textFont(titleFont);
     fill(255, 255);
     textAlign(CENTER);
     textSize((width + height) / 10);
     text("Chat mort...", width / 2, height / 2.5f); }
     
     
  textSize((width + height) / 100);
  text("Clicker pour l'ecran titre", width/ 2, height / 1.1f);
}
boolean Music, Music2, MusicNEnd = true;

public void keyReleased() {
  
  if (projectScreen == 1) {
    if (gameScreen == 0 || gameScreen == 1) {
      if (key == ' ')
       if (Music) {
         musicMain.pause(); 
         Music = false; }
       else if (!Music) {
         musicMain.loop();
         Music = true; }
    }
    if (gameScreen == 2) {
      if (key == ' ')
       if (Music2) {
         musicMain2.pause(); 
         Music2 = false; }
       else if (!Music2) {
         musicMain2.loop();
         Music2 = true; }
    }
  }
  if (projectScreen == 3) {
    if (key == ' ')
       if (MusicNEnd) {
         musicNiceEnd.pause(); 
         MusicNEnd = false; }
       else if (!MusicNEnd) {
         musicNiceEnd.loop();
         MusicNEnd = true; }
  }
}

public void keyPressed() {
    
  if (key == CODED) {
    if (keyCode == ESC)
    exit(); }
    
    
  if (projectScreen==1) {
    if (gameScreen==3) {
      if (key=='q')
          C3.play();
      if (key=='2')
          Db3.play();
      if (key=='w')
          D3.play();
      if (key=='3')
          Eb3.play();
      if (key=='e')
          E3.play();
      if (key=='r')
          F3.play();
      if (key=='5')
          Gb3.play();
      if (key=='t')
          G3.play(); 
      if (key=='6')
          Ab3.play(); 
      if (key=='y')
          A3.play(); 
      if (key=='7')
          Bb3.play(); 
      if (key=='u')       
          B3.play(); 
      if (key=='i')
          C4.play();   
    }
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
  if (projectScreen==3) {
    if (mouseButton == RIGHT) {
       Drag = true; }
  }
}


public void mouseReleased() {
  doOnce = false; 
  Drag = false; }
  

      
public void mousePressed() {
  

  //Jeu1, Evenements selon le choix
   if (mouseButton == LEFT) { 
    if (projectScreen==0) { 
      if (CatWalk) {
        musicMain.loop();
        musicMain.amp(0);
        
        CWAnim = true;
        currentFrame = 0;
        start = millis(); 
        CatWalk = false; }
    }
          
    else if (projectScreen==1) {
      if (gameScreen==0) {
        if (j1Choix1.MouseOver()) { 
          PianoStatus = true; 
          start = millis(); }
      
        if (j1Choix2.MouseOver()) {
          musicMain.pause();
          theEnd(); }
      
        if (j1Choix3.MouseOver()) {
          fadeStatus = true; 
          start = millis(); }
        
        if (skip.MouseOver()) {
          musicMain.amp(0.15f);
          next(); }
      }
       
  // Jeu2, Evenements selon le choix
  
      else if (gameScreen==1) {
        if (j2Choix1.MouseOver()) {
          musicMain.pause();
          skipStatus = 1;
          theEnd(); }
        
        if (j2Choix2.MouseOver()) {
          musicMain2.loop();
          musicMain2.amp(0);
          fadeStatus = true; 
          start = millis(); }
            
        if (j2Choix3.MouseOver()) {
          musicMain.pause();
          skipStatus = 1;
          theEnd(); }
          
        if (skip.MouseOver()) {
          musicMain.pause();
          next2(); }
        }
       
  // Jeu3, Evenements selon le choix
  
      else if (gameScreen==2) {
        if (j3Choix1.MouseOver()) {
          musicMain2.pause();
          skipStatus = 2;
          theEnd(); }
        
        if (j3Choix2.MouseOver()) {
          musicNiceEnd.loop();
          musicNiceEnd.amp(0);
          fadeStatus = true; 
          start = millis(); }
            
        if (j3Choix3.MouseOver()) {
          musicMain2.pause();
          skipStatus = 2;
          theEnd(); }
      }
      
  // Piano Event
      
     else  if (gameScreen==3) {
       
       if (PianoQ.MouseOver()) {
         musicMain.loop();
         musicMain.amp(0);
         PianoStatus = true; }
         
       if (pianoC3.MouseOver() && !pianoDb3.MouseOver())
         C3.play();
       if (pianoDb3.MouseOver() &&  (pianoC3.MouseOver() || pianoD3.MouseOver()))
         Db3.play();
       if (pianoD3.MouseOver() && !pianoDb3.MouseOver() && !pianoEb3.MouseOver()) 
         D3.play();
       if (pianoEb3.MouseOver() &&  (pianoD3.MouseOver() || pianoE3.MouseOver())) 
         Eb3.play();
       if (pianoE3.MouseOver() && !pianoEb3.MouseOver()) 
         E3.play();
       if (pianoF3.MouseOver() && !pianoGb3.MouseOver()) 
         F3.play();
       if (pianoGb3.MouseOver() &&  (pianoF3.MouseOver() || pianoG3.MouseOver())) 
         Gb3.play();
       if (pianoG3.MouseOver() && !pianoGb3.MouseOver() && !pianoAb3.MouseOver()) 
         G3.play(); 
       if (pianoAb3.MouseOver() &&  (pianoG3.MouseOver() || pianoA3.MouseOver())) 
         Ab3.play(); 
       if (pianoA3.MouseOver() && !pianoAb3.MouseOver() && !pianoBb3.MouseOver()) 
         A3.play(); 
       if (pianoBb3.MouseOver() &&  (pianoA3.MouseOver() || pianoB3.MouseOver())) 
         Bb3.play(); 
       if (pianoB3.MouseOver() && !pianoBb3.MouseOver()) 
         B3.play(); 
       if (pianoC4.MouseOver() && !pianoDb4.MouseOver()) 
         C4.play(); 
       if (pianoDb4.MouseOver() && pianoC4.MouseOver())
         Db4.play();
      }
    }
      
  /*************            **************/
  
    else if (projectScreen==2) {
      EndMovie.pause();
      resetProject(); }
       
    else if (projectScreen==3) {
      musicNiceEnd.pause();
      resetProject(); }
    }
  }

/*************            **************/

// Start the game
public void startGame() {
  projectScreen = 1; } 
  
// Resset to title sceen
public void resetProject() {
  i = 0;
  titreAnimI = true;
  wordIndex += 1;
    if (wordIndex > words.size()-1) { 
      wordIndex = 0;
    }
  nextWord(words.get(wordIndex));
  projectScreen = 0; }

// En cas de mauvaise reponse
public void theEnd() {
  EndMovie.loop();
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

  
//void fade(float decay) {
//  rectMode(CORNER);
//  noStroke();
// fill(0, decay);
// rect(0, 0, width, height); }
  
 
    
public void movieEvent(Movie EndMovie) {
  EndMovie.read(); }

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
    fill(0, 20);
    rect(0, 0, width, height);
    if (runtime > 800) {
      musicMain.pause();
      PianoStatus = false;
      pianoPlay(); }
  }

  if(fadeStatus) {
    fill(0, 20);
    rect(0, 0, width, height);
    if (runtime > 800) {
      musicMain.amp(0.15f);
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
    fill(0, 20);
    rect(0, 0, width, height);
    if (runtime > 800) {
      musicMain.pause();
      musicMain2.amp(0.25f);
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
    image(imgJeu2, 0, 0, width, height);
  
    tint(255, 200);
    image(imgPro, 0, 0, width, height); }
}

// Troisieme choix
public void Jeu3() {
  
  runtime = millis() - start;
  if(fadeStatus) {
    fill(200, 20);
    rect(0, 0, width, height);
    if (runtime > 800) {
      Yhea.play();
      Yhea.amp(0.5f);
      musicMain2.pause();
      fadeStatus = false;
      skipStatus = 0;
      win(); }
  }
  else {

   
    j3Choix1.draw();
    j3Choix2.draw();
    j3Choix3.draw(); 
  
    tint(220, 120);
    image(imgJeu3, 0, 0, width, height);
    filter(POSTERIZE, 40);}
}
    
// Piano
public void Piano() {
  runtime = millis() - start;
  
  pianoC3.draw();
  pianoD3.draw();
  pianoE3.draw();
  pianoF3.draw();
  pianoG3.draw();
  pianoA3.draw();
  pianoB3.draw();
  pianoC4.draw();
    pianoDb3.draw();
    pianoEb3.draw();
    pianoGb3.draw();
    pianoAb3.draw();
    pianoBb3.draw();
    pianoDb4.draw();

  
 
  if(PianoStatus) {
    fill(0, 20);
    rect(0, 0, width, height);
    if (runtime > 800) {
      musicMain.amp(0.15f);
      PianoStatus = false;
      next(); }
    }
    
    
  else {
    noStroke();
    fill(0);
    rect(0, 0, width, height / 4);
    
    final int w = width *2, h = height / 10;
    final int cx = w >> 10, cy = h >> 1;
    final int step = 1;
  
    for (int i = 0; i <= w; i += step) {
      fill( map(i, 0, w, 0, 50) );
      ellipse(cx, cy, w - i, h);
    }
    
    tint(255, 150);
    image(imgPianoLogo, -100, -300);
    
    strokeWeight(20);
    strokeCap(SQUARE);
    stroke(193, 6, 6, 150);
    line(0, 180, 1280, 180);
    
    PianoQ.draw();
  }
}
float colorVariation = 100f;
int colorRandom;
int depth;
float angle = 0;

public void niceEndScreen() {
  
  musicNiceEnd.amp(0.1f);

  if (Drag) {
    float ca = map(mouseX, 0, width, -1, 1);
    float cb = map(mouseY, 0, height, -1, 1);
    
    angle += 0.01f;

    float w = 4.5f;
    float h = (w * height) / width;
    float xmin = -w/2;
    float ymin = -h/2;
  
  
    colorRandom = color(250, 250, 250, 200);
  
  
  
    loadPixels();
  
  
    int maxiterations = 100;
  
  
    // x goes from xmin to xmax
    float xmax = xmin + w;
  
  
    // y goes from ymin to ymax
    float ymax = ymin + h;
  
  
    // increment x,y for each pixel
    float dx = (xmax - xmin) / (width);
    float dy = (ymax - ymin) / (height);
  
  
  
    // Start y
    float y = ymin;
    for (int j = 0; j < height; j++) {
      // Start x
      float x = xmin;
      for (int i = 0; i < width; i++) {
        
      depth = 20;
  
  
  
        // z = z^2 + cm
        float a = x;
        float b = y;
        int n = 0;
  
        while (n < maxiterations) {
          float aa = a * a;
          float bb = b * b;
  
          // Infinity
          if (aa + bb > 2.0f) {
            break; }
  
          float twoab = 1.75f * a * b;
          a = aa - bb + ca;
          b = twoab + cb;
  
          n++;
          ++depth; }
  
        if (n == maxiterations) {
          pixels[i+j*width] = color(colorRandom);
  
        } else {
  
           pixels[i+j*width] = color(
            depth * red(colorRandom) * colorVariation % 255, 
            depth * red(colorRandom) * colorVariation % 255,
            depth * red(colorRandom) * colorVariation % 255, 200); }
        x += dx; }
      y += dy; }
  
    updatePixels(); }
    
  else {
    float ca = cos(angle*PI);
    float cb = sin(angle/PI); 
    
    angle += 0.01f;

    float w = 4.5f;
    float h = (w * height) / width;
    float xmin = -w/2;
    float ymin = -h/2;
  
  
    colorRandom = color(250, 250, 250, 200);
  
  
  
    loadPixels();
  
  
    int maxiterations = 100;
  
  
    // x goes from xmin to xmax
    float xmax = xmin + w;
  
  
    // y goes from ymin to ymax
    float ymax = ymin + h;
  
  
    // increment x,y for each pixel
    float dx = (xmax - xmin) / (width);
    float dy = (ymax - ymin) / (height);
  
  
  
    // Start y
    float y = ymin;
    for (int j = 0; j < height; j++) {
      // Start x
      float x = xmin;
      for (int i = 0; i < width; i++) {
        
      depth = 20;
  
  
  
        // z = z^2 + cm
        float a = x;
        float b = y;
        int n = 0;
  
        while (n < maxiterations) {
          float aa = a * a;
          float bb = b * b;
  
          // Infinity
          if (aa + bb > 2.0f) {
            break; }
  
          float twoab = 1.75f * a * b;
          a = aa - bb + ca;
          b = twoab + cb;
  
          n++;
          ++depth; }
  
        if (n == maxiterations) {
          pixels[i+j*width] = color(colorRandom);
  
        } else {
  
           pixels[i+j*width] = color(
            depth * red(colorRandom) * colorVariation % 255, 
            depth * red(colorRandom) * colorVariation % 255,
            depth * red(colorRandom) * colorVariation % 255, 200); }
        x += dx; }
      y += dy; }
  
    updatePixels(); }
    
    
/***************                 ***************/


  textFont(titleFont);
  fill(0, 200);
  textAlign(CENTER);
  textSize((width + height) / 10);
  text("Chat heureux!", width /  2, height / 2.5f);
  
  textSize((width + height) / 100);
  text("Clicker pour l'ecran titre", width / 2, height / 1.1f); }
 
 



public void titleScreen() {
  
  runtime = (millis() - start);
  if(fadeStatus) {
    fill(0, 20);
    rect(0, 0, width, height);
      if (runtime > 800) {
        startGame();
        fadeStatus = false;
       }
  }
  else {
    
    tint(255, 255);
    image(imaTitre, 0, 0);
    filter(INVERT);
    filter(POSTERIZE, 20);
    filter(ERODE);
    
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
        if (runtime > 2000) {
          musicMain.amp(0.3f);
          fadeStatus = true;
          CWAnim = false;
          CatWalk = true; }
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
