void keyPressed() {
  
  // Start the game
  if (key == ' ')
    if (projectScreen==0) {
      startGame(); }
      else if (projectScreen==2) {
        resetProject(); }
      else if (projectScreen==3) {
        resetProject(); }
}


/********* In Game *********/


void mouseClicked() {
  
//Jeu1, Evenements selon le choix

  if (projectScreen==1) {
    if (gameScreen==0) {
      if (choix1.MouseOver()) {
        theEnd();
        }
    
      if (choix2.MouseOver()) {
        theEnd();
        }
    
      if (choix3.MouseOver()) {
        next();
        }
     }
     
// Jeu2, Evenements selon le choix

     else if (gameScreen==1) {
      if (choix1.MouseOver()) {
        theEnd();
        }
    
      if (choix2.MouseOver()) {
        next2();
        }
        
      if (choix3.MouseOver()) {
        theEnd();
        }
     }
     
// Jeu3, Evenements selon le choix

     else if (gameScreen==2) {
      if (choix1.MouseOver()) {
        theEnd();
        }
    
      if (choix2.MouseOver()) {
        win();
        }
        
      if (choix3.MouseOver()) {
        theEnd();
        }
     }
   }
}

// Start the game
void startGame() {
  projectScreen = 1;
}
  
// Resset to title sceen
void resetProject() {
  projectScreen = 0;
}

// En cas de mauvaise reponse
void theEnd() {
  gameScreen = 0;
  projectScreen = 2;
}

// Passer au niveau 2
void next() {
  gameScreen = 1;
}

// Passer au niveau 3
void next2() {
  gameScreen = 2;
}

// En cas de Victoire
void win() {
  gameScreen = 0;
  projectScreen = 3;
}
