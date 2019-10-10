void niceEndScreen() {
  fill(255, 10);
  rect(0, 0, width, height);
  textFont(titleFont);
  fill(0, 40);
  textAlign(CENTER);
  textSize((width + height) / 10);
  text("Chat heureux!", width /  2, height / 2.5);
  textSize((width + height) / 100);
  text("Clicker pour l'ecran titre", width / 2, height / 1.1);
}
