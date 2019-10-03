// 0: Title Screen
// 1: Main Screen
// 2: End Screen

int projectScreen = 0;
PFont titleFont;

/********* SETUP *********/

void setup() {
  size(1280, 720);
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
  }
}


/********* SCREEN CONTENTS *********/

void titleScreen() {
  background(65, 17, 94);
  textSize(130);
  textFont(titleFont);
  textAlign(CENTER);
  text("Titre", height/1.1, width/3.5);
}
void mainScreen() {
  background(0);
}
void endScreen() {
  background(0);
  textSize(130);
  textFont(titleFont);
  textAlign(CENTER);
  text("End", height/1.4, width/3.5);
}


/********* INPUTS *********/

void mousePressed() {
  // Start the game
  if (projectScreen==0) {
    startGame(); }
    else if (projectScreen==2) {
      resetProject(); }
}


/********* OTHER *********/

// Start the game
void startGame() {
  projectScreen=1;
}
  
// Resset to title sceen
void resetProject() {
  projectScreen=0;
}
