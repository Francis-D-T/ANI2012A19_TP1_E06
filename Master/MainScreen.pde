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
    fill(0, 40);
    rect(0, 0, width, height);
    runtime = millis() - start;
    if (runtime > 900) {
      fade = false;
      next(); }
  }
  else {

    
    if (skipStatut == 1 || skipStatut == 2) {
      skip.draw(); }
    j1Choix1.draw();
    j1Choix2.draw();
    j1Choix3.draw(); } 
    
    tint(255, 150);
    image(imgJeu1, 0, 0, width, height);
    tint(255, 255);
    image(imgPro, 0, 0, width, height);
}

// Deuxieme choix
void Jeu2() {
  
  if(fade) {
    fill(0, 40);
    rect(0, 0, width, height);
    runtime = millis() - start;
    if (runtime > 900) {
      fade = false;
      next2(); }
  }
  else {
    
    if (skipStatut == 2) {
      skip.draw(); }
    j2Choix1.draw();
    j2Choix2.draw();
    j2Choix3.draw(); 
  
    tint(255, 120);
    image(imgJeu1, 0, 0, width, height); }
}

// Troisieme choix
void Jeu3() {
  
  if(fade) {
    fill(220, 80);
    rect(0, 0, width, height);
    runtime = millis() - start;
    if (runtime > 900) {
      fade = false;
      win(); }
  }
  else {

   
    j3Choix1.draw();
    j3Choix2.draw();
    j3Choix3.draw(); 
  
    tint(255, 120);
    image(imgJeu1, 0, 0, width, height);}
}
