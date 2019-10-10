class Bouton {
  float x;
  float y;
  int w;
  int h;
  String texte;
  
  Bouton(String texteB, float xpos, float ypos, int widthB, int heightB) {
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
    texte = texteB; }
    
  void draw() {
     
    if (MouseOver()) {
      stroke(10, 20);
      fill (50, 25, 65);
      rect(x, y, w, h, 20);
      
      textFont(texteFont);
      textAlign(CENTER, CENTER);
      textSize(30);
      stroke(10, 20);
      fill(255, 80);
      text(texte, x + (w / 2), y + (h / 2)); }
      
      else {
      stroke(10, 20);
      fill(50, 25, 45, 20);
      rect(x, y, w, h, 20); }
      
      textFont(texteFont);
      textAlign(CENTER, CENTER);
      textSize(30);
      stroke(10, 20);
      fill(255, 80);
      text(texte, x + (w / 2), y + (h / 2)); }
   
  boolean MouseOver() {
    if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
      return true; }
    return false; }
}
