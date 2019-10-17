// 0: Jeu 1
// 1: Jeu 2
// 2: Jeu 3
// 3: Cloches

void mainScreen() {
 
   if (gameScreen == 0) {
    Jeu1(); } 
    else if (gameScreen == 1) {
    Jeu2(); } 
    else if (gameScreen == 2) {
    Jeu3(); }
    else if (gameScreen == 3) {
      Piano(); }
}

// Premier choix
void Jeu1() {
  
  runtime = millis() - start;
  if(fadeStatus) {
    fade(120);
    if (runtime > 900) {
      fadeStatus = false;
      next(); }
  }
  else {

    
    if (skipStatus == 1 || skipStatus == 2) {
      skip.draw(); }
    j1Choix1.draw();
    j1Choix2.draw();
    j1Choix3.draw(); } 
    
    tint(255, 120);
    image(imgJeu1, 0, 0, width, height);
    tint(255, 255);
    image(imgPro, 0, 0, width, height);
}

// Deuxieme choix
void Jeu2() {
  
  runtime = millis() - start;
  if(fadeStatus) {
    fade(120);
    if (runtime > 900) {
      fadeStatus = false;
      next2(); }
  }
  else {
    
    if (skipStatus == 2) {
      skip.draw(); }
    j2Choix1.draw();
    j2Choix2.draw();
    j2Choix3.draw(); 
  
    tint(255, 120);
    image(imgJeu1, 0, 0, width, height); }
}

// Troisieme choix
void Jeu3() {
  
  runtime = millis() - start;
  if(fadeStatus) {
    fade(120);
    if (runtime > 900) {
      fadeStatus = false;
      win(); }
  }
  else {

   
    j3Choix1.draw();
    j3Choix2.draw();
    j3Choix3.draw(); 
  
    tint(255, 120);
    image(imgJeu1, 0, 0, width, height); }
}
    
// Cloches
void Piano() {
  
  runtime = millis() - start;
  if(PianoStatus) {
    theEnd(); }
    
  else {
    
    tint(255, 255);
    image(imgPro, 0, 0, width, height); }
}
