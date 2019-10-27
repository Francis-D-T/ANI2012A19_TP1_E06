void keyPressed() {
    
  if (key == CODED) {
    if (keyCode == ESC)
    exit(); }
    
  if (projectScreen==1) {
    if (gameScreen==3) {
      if (key=='q')
          C3.play();
      if (key=='2')
          Db3.play();
      if (key=='w')
          D3.play();
      if (key=='3')
          Eb3.play();
      if (key=='e')
          E3.play();
      if (key=='r')
          F3.play();
      if (key=='5')
          Gb3.play();
      if (key=='t')
          G3.play(); 
      if (key=='6')
          Ab3.play(); 
      if (key=='y')
          A3.play(); 
      if (key=='7')
          Bb3.play(); 
      if (key=='u')       
          B3.play(); 
      if (key=='i')
          C4.play();   
    }
  }
}

/********* In Game *********/
void mouseDragged() {
  if (projectScreen==0) {
    if (mouseButton == RIGHT) {
      for (Particle particle : particles) {
        if (dist(particle.pos.x, particle.pos.y, mouseX, mouseY) < 50) {
          particle.kill();
        }
      }
    }
  }
}


void mouseReleased() {
  doOnce = false; }
  

      
void mousePressed() {
  

  //Jeu1, Evenements selon le choix
   if (mouseButton == LEFT) { 
    if (projectScreen==0) { 
      if (CatWalk) {
        CWAnim = true;
        currentFrame = 0;
        start = millis(); 
        CatWalk = false; }
    }
          
    else if (projectScreen==1) {
      if (gameScreen==0) {
        if (j1Choix1.MouseOver()) { 
          PianoStatus = true; 
          start = millis(); }
      
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
      
  // Piano Event
      
     else  if (gameScreen==3) {
         if (pianoC3.MouseOver() && !pianoDb3.MouseOver())
           C3.play();
         if (pianoDb3.MouseOver() &&  (pianoC3.MouseOver() || pianoD3.MouseOver()))
           Db3.play();
         if (pianoD3.MouseOver() && !pianoDb3.MouseOver() && !pianoEb3.MouseOver()) 
           D3.play();
         if (pianoEb3.MouseOver() &&  (pianoD3.MouseOver() || pianoE3.MouseOver())) 
           Eb3.play();
         if (pianoE3.MouseOver() && !pianoEb3.MouseOver()) 
           E3.play();
         if (pianoF3.MouseOver() && !pianoGb3.MouseOver()) 
           F3.play();
         if (pianoGb3.MouseOver() &&  (pianoF3.MouseOver() || pianoG3.MouseOver())) 
           Gb3.play();
         if (pianoG3.MouseOver() && !pianoGb3.MouseOver() && !pianoAb3.MouseOver()) 
           G3.play(); 
         if (pianoAb3.MouseOver() &&  (pianoG3.MouseOver() || pianoA3.MouseOver())) 
           Ab3.play(); 
         if (pianoA3.MouseOver() && !pianoAb3.MouseOver() && !pianoBb3.MouseOver()) 
           A3.play(); 
         if (pianoBb3.MouseOver() &&  (pianoA3.MouseOver() || pianoB3.MouseOver())) 
           Bb3.play(); 
         if (pianoB3.MouseOver() && !pianoBb3.MouseOver()) 
           B3.play(); 
         if (pianoC4.MouseOver() && !pianoDb4.MouseOver()) 
           C4.play(); 
         if (pianoDb4.MouseOver() && pianoC4.MouseOver())
           Db4.play();
      }
    }
      
  /*************            **************/
  
    else if (projectScreen==2) {
      resetProject(); }
       
    else if (projectScreen==3) {
      resetProject(); }
    }
  }

/*************            **************/

// Start the game
void startGame() {
  projectScreen = 1; } 
  
// Resset to title sceen
void resetProject() {
  wordIndex += 1;
    if (wordIndex > words.size()-1) { 
      wordIndex = 0;
    }
  nextWord(words.get(wordIndex));
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
