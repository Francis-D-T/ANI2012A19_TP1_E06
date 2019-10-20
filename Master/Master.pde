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
int numFrames = 36;
int currentFrame = 0;
int skipStatus = 0;
int titleClickStatus = 0;
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
PianoNotes pianoFa, pianoSol, pianoLa, pianoSi, pianoDO;

/********* SETUP *********/

void setup() {
  size(1280, 720);
  //fullScreen();
  smooth();
  frameRate(12);
  start = millis();
  
  //musicTitre = new SoundFile();
  //musicEnd = new SoundFile();
  //musicNiceEnd = new SoundFile();
  //musicMain = new SoundFile();
 
// Font
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
  Do = new SoundFile(this, "do-stretched.wav");
  Re = new SoundFile(this, "do-stretched.wav");
  Mi = new SoundFile(this, "do-stretched.wav");
  Fa = new SoundFile(this, "do-stretched.wav");
  Sol = new SoundFile(this, "do-stretched.wav");
  La = new SoundFile(this, "do-stretched.wav");
  Si = new SoundFile(this, "do-stretched.wav");
  Do2 = new SoundFile(this, "do-stretched.wav");
    
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
