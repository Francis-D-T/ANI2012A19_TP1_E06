void endScreen() {
  fill(0, 70);
  rect(0, 0, width, height);
  textFont(titleFont);
  fill(255, 150);
  textAlign(CENTER);
  textSize((width + height) / 10);
  text("End", width / 2, height / 2.5);
  textSize((width + height) / 100);
  text("Click for TitleScreen", width/ 2, height / 1.1);
}
