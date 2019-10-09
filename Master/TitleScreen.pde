void titleScreen() {

  if(fade) {
    fill(0, 70);
    rect(0, 0, width, height);
    runtime = millis() - start;
    if (runtime > 900) {
      startGame();
      fade = false; }
  }
  else {
    fill(65, 17, 94);
    rect(0, 0, width, height);
    textFont(titleFont);
    fill(255);
    textAlign(CENTER);
    textSize((width + height) / 10);
    text("Titre", width / 2, height / 2.5);
    
    fill(255);
    textAlign(CENTER);
    textSize((width + height) / 100);
    text("Click to start",  width / 2, height / 1.1); } 
}
