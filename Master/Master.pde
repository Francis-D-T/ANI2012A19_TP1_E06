import processing.video.*;

// 0: Title Screen
// 1: Main Screen
// 2: End Screen 
// 3: NiceEnd Screen

int projectScreen = 0;
int gameScreen = 0;
PFont titleFont;
boolean fade = false;
float start, runtime;
PImage imgJeu1, imgPro;

//Movie catWalk;
int numFrames = 24;
int currentFrame = 0;
PImage[] images = new PImage[numFrames];

// Bouton
Bouton choix1;
Bouton choix2;
Bouton choix3;

/********* SETUP *********/

void setup() {
  fullScreen();
  smooth();
  frameRate(12);
  start = millis();
  titleFont = createFont("Youth Power.ttf", 300); 
  imgJeu1 = loadImage("Jeu1.PNG");
  imgPro = loadImage("Protagoniste.png");
  //catWalk = new Movie(this, "CatWalk.avi");
  //catWalk.play();
  for (int i = 0; i < numFrames; i++) {
    String imageName = "Protagoniste Walk_" + nf(i, 5) + ".png";
    images[i] = loadImage(imageName); }
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
