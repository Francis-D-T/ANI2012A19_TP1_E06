// 0: Title Screen
// 1: Main Screen
// 2: End Screen 
// 3: NiceEnd Screen

int projectScreen = 0;
int gameScreen = 0;
PFont titleFont;
boolean fade = false;

// Bouton
Bouton choix1;
Bouton choix2;
Bouton choix3;

/********* SETUP *********/

void setup() {
  size(1280, 720);
  smooth();
  frameRate(24);
  titleFont = createFont("Youth Power.ttf", 300);
}


/********* DRAW *********/

void draw() {

  if (projectScreen == 0) {
    titleScreen();
  } else if (projectScreen == 1) {
    mainScreen();
  } else if (projectScreen == 2) {
    endScreen();
  } else if (projectScreen == 3) {
    niceEndScreen();
  }
}
