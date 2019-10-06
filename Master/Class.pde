class Bouton {
  int x;
  int y;
  int w;
  int h;
  String texte;
  
  Bouton(String texteB, int xpos, int ypos, int widthB, int heightB) {
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
    texte = texteB;
    }
    
   void draw() {
     
     if (MouseOver()) {
       stroke(10);
       fill (204);
       rect(x, y, w, h, 20);}
       else {
       fill(100);
       stroke(10);
       rect(x, y, w, h, 20);}
       
       textAlign(CENTER, CENTER);
       textSize(30);
       fill(255);
       text(texte, x + (w / 2), y + (h / 2));
    }
    
    boolean MouseOver() {
      if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
        return true;
        }
        return false;
    }
  }
