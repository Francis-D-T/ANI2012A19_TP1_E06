

void titleScreen() {
  
  runtime = (millis() - start);
  if(fadeStatus) {
    fill(0, 20);
    rect(0, 0, width, height);
      if (runtime > 800) {
        startGame();
        fadeStatus = false;
       }
  }
  else {
    
    tint(255, 255);
    image(imaTitre, 0, 0);
    filter(INVERT);
    filter(POSTERIZE, 20);
    filter(ERODE);
    
  for (int X = particles.size ()-1; X > -1; X--) {
    // Simulate and draw pixels
    Particle particle = particles.get(X);
    particle.move();
    particle.draw(); 
  
    if (particle.isKilled) {
          if (particle.pos.x < 0 || particle.pos.x > width || particle.pos.y < 0 || particle.pos.y > height) {
            particles.remove(particle); }
    }
  }
        

    fill(255);
    textAlign(CENTER);
    textFont(titleFont);
    textSize((width + height) / 100);
    text("Clicker pour jouer",  width / 2, height / 1.1); 
    
    if (CWAnim) {
      currentFrame = (currentFrame+1) % numFrames;      
      int offset = 0;
      for (int x = 0; x < width; x += images[0].width) { 
      image(images[(currentFrame+offset) % numFrames], x, 0, width, height);
      offset+=2; 
        if (runtime > 2000) {
          musicMain.amp(0.3);
          fadeStatus = true;
          CWAnim = false;
          CatWalk = true; }
       }
    }
  }  
}
