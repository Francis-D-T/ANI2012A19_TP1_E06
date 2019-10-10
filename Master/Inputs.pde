void keyPressed() {
    
  if (key == CODED) {
    if (keyCode == ESC){
    exit(); }
  }
}
/********* In Game *********/


void mouseReleased() {
  
//Jeu1, Evenements selon le choix
  
  if (projectScreen==0) { 
    if (titleClickStatut == 0) {
      titleClickStatut = 1;
      CWAnim = true;
      start = millis(); }
  }
        
  else if (projectScreen==1) {
    if (gameScreen==0) {
      if (j1Choix1.MouseOver()) {
        theEnd(); }
    
      if (j1Choix2.MouseOver()) {
        theEnd(); }
    
      if (j1Choix3.MouseOver()) {
        fade = true; 
        start = millis(); }
      
      if (skip.MouseOver()) {
        skip1(); }
    }
     
// Jeu2, Evenements selon le choix

    else if (gameScreen==1) {
      if (j2Choix1.MouseOver()) {
        skipStatut = 1;
        theEnd(); }
      
      if (j2Choix2.MouseOver()) {
        fade = true; 
        start = millis(); }
          
      if (j2Choix3.MouseOver()) {
        skipStatut = 1;
        theEnd(); }
        
      if (skip.MouseOver()) {
        skip2(); }
      }
     
// Jeu3, Evenements selon le choix

    else if (gameScreen==2) {
      if (j3Choix1.MouseOver()) {
        skipStatut = 2;
        theEnd(); }
      
      if (j3Choix2.MouseOver()) {
        fade = true; 
        start = millis(); }
          
      if (j3Choix3.MouseOver()) {
        skipStatut = 2;
        theEnd(); }
      }
  }
  else if (projectScreen==2) {
    titleClickStatut = 0;
    resetProject(); }
     
  else if (projectScreen==3) {
    titleClickStatut = 0;
    resetProject(); }
}

// Start the game
void startGame() {
  projectScreen = 1; }
  
// Resset to title sceen
void resetProject() {
  projectScreen = 0; }

// En cas de mauvaise reponse
void theEnd() {
  gameScreen = 0;
  projectScreen = 2; }

// Passer au niveau 2
void next() {
  gameScreen = 1; }

// Passer au niveau 3
void next2() {
  gameScreen = 2; }

// En cas de Victoire
void win() {
  gameScreen = 0;
  projectScreen = 3; }
  
void skip1() {
  gameScreen = 1; }
  
void skip2() {
  gameScreen = 2; }
  
  
//void movieEvent(Movie m) {
//m.read(); }
//image(catWalk, 0, 0, width, height);
