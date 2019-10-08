// 0: Jeu 1
// 1: Jeu 2
// 2: Jeu 3

void mainScreen() {
 
   if (gameScreen == 0) {
    Jeu1(); } 
    else if (gameScreen == 1) {
    Jeu2(); } 
    else if (gameScreen == 2) {
    Jeu3(); }
}

// Premier choix
void Jeu1() {
  
  if(fade) {
    fill(60, 70);
    rect(0, 0, width, height);
    runtime = millis() - start;
    if (runtime > 600) {
      fade = false;
      next(); }
  }
  else {
    fill(40, 10);
    rect(0, 0, width, height);
    choix1 = new Bouton("Mort", width / 1.3, height / 1.365 , width / 6, height / 20);
    choix1.draw();
    choix2 = new Bouton("Mort", width / 1.3, height / 1.25, width / 6, height / 20);
    choix2.draw();
    choix3 = new Bouton("Ici", width / 1.3, height / 1.15, width / 6, height / 20);
    choix3.draw(); } 
}

// Deuxieme choix
void Jeu2() {
  
  if(fade) {
    fill(100, 70);
    rect(0, 0, width, height);
    runtime = millis() - start;
    if (runtime > 600) {
      fade = false;
      next2(); }
  }
  else {
    fill(60);
    rect(0, 0, width, height);
    choix1 = new Bouton("Mort", width / 1.3, height / 1.365, width / 6, height / 20);
    choix1.draw();
    choix2 = new Bouton("Ici", width / 1.3, height / 1.25, width / 6, height / 20);
    choix2.draw();
    choix3 = new Bouton("Mort", width / 1.3, height / 1.15, width / 6, height / 20);
    choix3.draw(); }
}

// Troisieme choix
void Jeu3() {
  
  if(fade) {
    fill(220, 80);
    rect(0, 0, width, height);
    runtime = millis() - start;
    if (runtime > 600) {
      fade = false;
      win(); }
  }
  else {
    fill(100);
    rect(0, 0, width, height);
    choix1 = new Bouton("Mort", width / 1.3, height / 1.365, width / 6, height / 20);
    choix1.draw();
    choix2 = new Bouton("Ici", width / 1.3, height / 1.25, width / 6, height / 20);
    choix2.draw();
    choix3 = new Bouton("Mort", width / 1.3, height / 1.15, width / 6, height / 20);
    choix3.draw(); }
}
