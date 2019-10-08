// 0: Title Screen
// 1: Main Screen
// 2: End Screen 
// 3: NiceEnd Screen

int projectScreen = 0;
int gameScreen = 0;
PFont titleFont;
boolean fade = false;
float start, runtime;

// Bouton
Bouton choix1;
Bouton choix2;
Bouton choix3;

/********* SETUP *********/

void setup() {
  fullScreen(2);
  smooth();
  frameRate(24);
  start = millis();
  titleFont = createFont("Youth Power.ttf", 300); 
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
