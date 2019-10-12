void titleScreen() {
  
  runtime = (millis() - start);
  if(fadeStatus) {
    fade(120);
      if (runtime > 2800) {
        startGame();
        fadeStatus = false; }
  }
  else {
    fill(65, 17, 94);
    rect(0, 0, width, height);
    textFont(titleFont);
    fill(255);
    textAlign(CENTER);
    textSize((width + height) / 10);
    text("Le Chat errant", width / 2, height / 2.5);
    
    fill(255);
    textAlign(CENTER);
    textSize((width + height) / 100);
    text("Clicker pour jouer",  width / 2, height / 1.1); }
    
    if (CWAnim) {
      currentFrame = (currentFrame+1) % numFrames;
      int offset = 0;
      for (int x = 0; x < width; x += images[0].width) { 
      image(images[(currentFrame+offset) % numFrames], x, 0, width, height);
      offset+=2; 
        if (runtime > 2400) {
        fadeStatus = true;
        CWAnim = false; }
      }
    }
}
