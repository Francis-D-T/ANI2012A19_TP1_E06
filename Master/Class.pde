class Bouton {
  int x;
  int y;
  int w;
  int h;
  
  Bouton(int xpos, int ypos, int widthB, int heightB) {
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
    }
    
   void draw() {
     fill(218);
     stroke(141);
     rect(x, y, w, h);
    }
    
    boolean MouseOver() {
      if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
        return true;
        }
        return false;
    }
  }
