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
  choix1 = new Bouton("Mort", 850, 350, 300, 75);
  choix1.draw();
  choix2 = new Bouton("Mort", 850, 450, 300, 75);
  choix2.draw();
  choix3 = new Bouton("Ici", 850, 550, 300, 75);
  choix3.draw();
  
  
}

// Deuxieme choix
void Jeu2() {
   background(50);
  choix1 = new Bouton("Mort", 850, 350, 300, 75);
  choix1.draw();
  choix2 = new Bouton("Ici", 850, 450, 300, 75);
  choix2.draw();
  choix3 = new Bouton("Mort", 850, 550, 300, 75);
  choix3.draw();
  
}

// Troisieme choix
void Jeu3() {
   background(100);
  choix1 = new Bouton("Mort", 850, 350, 300, 75);
  choix1.draw();
  choix2 = new Bouton("Ici", 850, 450, 300, 75);
  choix2.draw();
  choix3 = new Bouton("Mort", 850, 550, 300, 75);
  choix3.draw();
  
}
