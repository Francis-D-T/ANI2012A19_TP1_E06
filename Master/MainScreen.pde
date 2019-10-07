// 0: Jeu 1
// 1: Jeu 2
// 2: Jeu 3

void mainScreen() {
 
   if (gameScreen == 0) {
    Jeu1();
  } else if (gameScreen == 1) {
    Jeu2();
  } else if (gameScreen == 2) {
    Jeu3();
  }
}

// Premier choix
void Jeu1() {
  background(0);
  choix1 = new Bouton("Mort", width / 1.3, height / 1.365 , width / 6, height / 20);
  choix1.draw();
  choix2 = new Bouton("Mort", width / 1.3, height / 1.25, width / 6, height / 20);
  choix2.draw();
  choix3 = new Bouton("Ici", width / 1.3, height / 1.15, width / 6, height / 20);
  choix3.draw();
  
  
}

// Deuxieme choix
void Jeu2() {
   background(50);
  choix1 = new Bouton("Mort", width / 1.3, height / 1.365, width / 6, height / 20);
  choix1.draw();
  choix2 = new Bouton("Ici", width / 1.3, height / 1.25, width / 6, height / 20);
  choix2.draw();
  choix3 = new Bouton("Mort", width / 1.3, height / 1.15, width / 6, height / 20);
  choix3.draw();
  
}

// Troisieme choix
void Jeu3() {
   background(100);
  choix1 = new Bouton("Mort", width / 1.3, height / 1.365, width / 6, height / 20);
  choix1.draw();
  choix2 = new Bouton("Ici", width / 1.3, height / 1.25, width / 6, height / 20);
  choix2.draw();
  choix3 = new Bouton("Mort", width / 1.3, height / 1.15, width / 6, height / 20);
  choix3.draw();
  
}
