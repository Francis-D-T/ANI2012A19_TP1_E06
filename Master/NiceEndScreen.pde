void niceEndScreen() {
  background(255);
  textFont(titleFont);
  fill(0);
  textAlign(CENTER);
  textSize((width + height) / 10);
  text("End", width /  2, height / 2.5);
  textSize((width + height) / 100);
  text("Click for TitleScreen", width / 2, height / 1.1);
}
