// http://theremin.music.uiowa.edu/MISpiano.html
// Te3xte Particule :  https://www.openprocessing.org/sketch/377231/



import processing.video.*;
import processing.sound.*;

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
boolean doOnce = true;
boolean doOnceD = true;


PFont titleFont;
PFont texteFont;

PImage imgJeu1, imgPro, imgPianoLogo;
PImage[] images = new PImage[numFrames];

SoundFile musicTitre,musicEnd, musicNiceEnd, musicMain,
C3, Db3, D3, Eb3, E3, F3, Gb3, G3, Ab3, A3, Bb3, B3, C4, Db4;

boolean fadeStatus = false;
boolean CWAnim = false;

float start, runtime;

// Bouton
Bouton j1Choix1, j1Choix2, j1Choix3, j2Choix1; 
Bouton j2Choix2, j2Choix3, j3Choix1, j3Choix2, j3Choix3;

Bouton skip;

// CLoches
PianoNotes pianoC3, pianoD3, pianoE3, pianoF3, pianoG3, pianoA3, pianoB3, pianoC4;
PianoNotesNoires pianoAb3, pianoBb3, pianoDb3, pianoEb3, pianoGb3, pianoDb4;

/********* SETUP *********/

void setup() {
  size(1280, 720);
  //fullScreen();
  smooth();
  start = millis();
  
// Font & textes
  words.add("Chat Errant");
  nextWord(words.get(wordIndex));
  titleFont = createFont("Youth Power.ttf", 300);
  texteFont = createFont("darkages.ttf", 300); 
  
// Image et Sequences
  imgJeu1 = loadImage("Jeu1.PNG");
  imgPro = loadImage("Protagoniste.png");
  imgPianoLogo = loadImage("pianoLogo.png");
  imgPianoLogo.resize(200, 400);
  //catWalk = new Movie(this, "CatWalk.avi");
  //catWalk.play();
  for (int i = 0; i < numFrames; i++) {
    String imageName = "Protagoniste Walk_" + nf(i, 5) + ".png";
    images[i] = loadImage(imageName); }
    
// Music import
  //musicMain = new SoundFile(this, "");

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
    
// Jeu1
  j1Choix1 = new Bouton("Jouer avec la cloche", width / 1.5, height / 1.465 , width / 3, height / 20);
  j1Choix2 = new Bouton("Continuer son chemin", width / 1.5, height / 1.35, width / 3, height / 20);
  j1Choix3 = new Bouton("Entre par la porte", width / 1.5, height / 1.25, width / 3, height / 20);
  
// Jeu2
  j2Choix1 = new Bouton("faire demi tour", width / 1.5, height / 1.465, width / 3, height / 20);
  j2Choix2 = new Bouton("Vers la lumiere", width / 1.5, height / 1.35, width / 3, height / 20);
  j2Choix3 = new Bouton("Monter a l'etage", width / 1.5, height / 1.25, width / 3, height / 20);
    
// Jeu3
  j3Choix1 = new Bouton("Manger le poisson", width / 1.5, height / 1.465, width / 3, height / 20);
  j3Choix2 = new Bouton("Manger le poulet", width / 1.5, height / 1.35, width / 3, height / 20);
  j3Choix3 = new Bouton("Faire demi tour", width / 1.5, height / 1.25, width / 3, height / 20);
  
// Skip
  skip = new Bouton("Skip", width / 1.265, height / 1.14, width / 12, height / 30);
  
// Piano Notes
  pianoC3 = new PianoNotes(0, height / 4, width / 8, height / 1.2);
  pianoDb3 = new PianoNotesNoires(width / 11, height / 4, width / 20, height / 2, 0, 0, 7, 7);
  pianoD3 = new PianoNotes(width / 8, height / 4, width / 8, height / 1.2);
  pianoEb3 = new PianoNotesNoires(width / 4.3, height / 4, width / 20, height / 2, 0, 0, 7, 7);
  pianoE3 = new PianoNotes(width / 4, height / 4, width / 8, height / 1.2);
  pianoF3 = new PianoNotes(width / 2.666666666666, height / 4, width / 8, height / 1.2);
  pianoGb3 = new PianoNotesNoires(width / 2.15, height / 4, width / 20, height / 2, 0, 0, 7, 7);
  pianoG3 = new PianoNotes(width / 2, height / 4, width / 8, height / 1.2);
  pianoAb3 = new PianoNotesNoires(width / 1.665, height / 4, width / 20, height / 2, 0, 0, 7, 7);
  pianoA3 = new PianoNotes(width / 1.6, height / 4, width / 8, height / 1.2);
  pianoBb3 = new PianoNotesNoires(width / 1.36, height / 4, width / 20, height / 2, 0, 0, 7, 7);
  pianoB3 = new PianoNotes(width / 1.33333333333, height / 4, width / 8, height / 1.2);
  pianoC4 = new PianoNotes(width / 1.142857, height / 4, width / 8, height / 1.2);
  pianoDb4 = new PianoNotesNoires(width / 1.03, height / 4, width / 20, height / 2, 0, 0, 7, 7);
}

/********* DRAW *********/

void draw() {

  if (projectScreen == 0) {
    titleScreen(); } 
    else if (projectScreen == 1) {
    mainScreen(); } 
    else if (projectScreen == 2) {
    endScreen(); } 
    else if (projectScreen == 3) {
    niceEndScreen(); }
}
