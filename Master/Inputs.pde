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
      currentFrame = 0;
      CWAnim = true;
      start = millis(); }
        
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

/*************            **************/

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
  
// Piano
void pianoPlay() {
  gameScreen = 3;  }

// En cas de Victoire
void win() {
  gameScreen = 0;
  projectScreen = 3; }

  
void fade(float decay) {
  rectMode(CORNER);
  noStroke();
  fill(0, decay);
  rect(0, 0, width, height); }
 
    
//void movieEvent(Movie m) {
//m.read(); }
//image(catWalk, 0, 0, width, height);
