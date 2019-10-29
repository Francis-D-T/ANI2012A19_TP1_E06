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
  
  if(PianoStatus) {
    fill(0, 20);
    rect(0, 0, width, height);
    if (runtime > 800) {
      musicMain.pause();
      PianoStatus = false;
      pianoPlay(); }
  }

  if(fadeStatus) {
    fill(0, 20);
    rect(0, 0, width, height);
    if (runtime > 800) {
      musicMain.amp(0.15);
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
    image(imgPro, 0, 0, width, height); }
    

// Deuxieme choix
void Jeu2() {
  
  runtime = millis() - start;
  if(fadeStatus) {
    fill(0, 20);
    rect(0, 0, width, height);
    if (runtime > 800) {
      musicMain.pause();
      musicMain2.amp(0.25);
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
    image(imgJeu2, 0, 0, width, height);
  
    tint(255, 200);
    image(imgPro, 0, 0, width, height); }
}

// Troisieme choix
void Jeu3() {
  
  runtime = millis() - start;
  if(fadeStatus) {
    fill(200, 20);
    rect(0, 0, width, height);
    if (runtime > 800) {
      Yhea.play();
      Yhea.amp(0.5);
      musicMain2.pause();
      fadeStatus = false;
      skipStatus = 0;
      win(); }
  }
  else {

   
    j3Choix1.draw();
    j3Choix2.draw();
    j3Choix3.draw(); 
  
    tint(220, 120);
    image(imgJeu3, 0, 0, width, height);
    filter(POSTERIZE, 40);}
}
    
// Piano
void Piano() {
  runtime = millis() - start;
  
  pianoC3.draw();
  pianoD3.draw();
  pianoE3.draw();
  pianoF3.draw();
  pianoG3.draw();
  pianoA3.draw();
  pianoB3.draw();
  pianoC4.draw();
    pianoDb3.draw();
    pianoEb3.draw();
    pianoGb3.draw();
    pianoAb3.draw();
    pianoBb3.draw();
    pianoDb4.draw();

  
 
  if(PianoStatus) {
    fill(0, 20);
    rect(0, 0, width, height);
    if (runtime > 800) {
      musicMain.amp(0.15);
      PianoStatus = false;
      gameScreen = 0; }
    }
    
    
  else {
    noStroke();
    fill(0);
    rect(0, 0, width, height / 4);
    
    final int w = width *2, h = height / 10;
    final int cx = w >> 10, cy = h >> 1;
    final int step = 1;
  
    for (int i = 0; i <= w; i += step) {
      fill( map(i, 0, w, 0, 50) );
      ellipse(cx, cy, w - i, h);
    }
    
    tint(255, 150);
    image(imgPianoLogo, -100, -300);
    
    strokeWeight(20);
    strokeCap(SQUARE);
    stroke(193, 6, 6, 150);
    line(0, 180, 1280, 180);
    
    PianoQ.draw();
  }
}
