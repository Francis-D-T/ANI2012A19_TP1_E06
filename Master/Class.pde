class Bouton extends PianoNotes{
  
  String texte;
  
  Bouton(String texteB, float x, float y, int w, int h) {
    super(x, y, w, h);
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
      rect(x, y, w, h, 20);
      
      textFont(texteFont);
      textAlign(CENTER, CENTER);
      textSize(30);
      stroke(10, 20);
      fill(255, 80);
      text(texte, x + (w / 2), y + (h / 2)); }
  }
}

/*************            **************/

class PianoNotes {
  
  float x;
  float y;
  int w;
  int h;
  
  PianoNotes(float xpos, float ypos, int widthC, int heightC) {
    x = xpos;
    y = ypos;
    w = widthC;
    h = heightC;
   }
   
  boolean MouseOver() {
    if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
      return true; }
    return false; }
    
   void draw() {
     
     if (MouseOver()) {
       stroke(10, 20);
       fill (255);
       rect(x, y, w, h); }

 
   }
}
