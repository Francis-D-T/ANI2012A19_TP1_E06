int i = 0;
boolean titreAnim, titreAnimF = false;
boolean titreAnimI =  true;
 
void endScreen() {
  
  fill(0, 150);
  triangle(0, 0, 0, height, width / 5, height / 2);
  triangle(width, height, width, 0, width / 1.2, height / 2);
  
  tint(100, 50);
  image(EndMovie, 0, 0);
  
  
  if (titreAnimI) {
    i = i +9;
    textFont(titleFont);
    fill(255, 200);
    textAlign(CENTER);
    textSize((width + height) / 10);
    text("Chat mort...", width / 2, i);
    if (i == (height / 2.5)) { 
      titreAnim = true;
      titreAnimI = false; }
  }
    
  if (titreAnim) {
    i = i - 3;
    textFont(titleFont);
    fill(255, 225);
    textAlign(CENTER);
    textSize((width + height) / 10);
    text("Chat mort...", width / 2, i);
    if (i == (height / 3)) { 
      titreAnim = false;
      titreAnimF = true; }
  }
    
  if (titreAnimF) {
    i = i + 1;
    textFont(titleFont);
    fill(255, 255);
    textAlign(CENTER);
    textSize((width + height) / 10);
    text("Chat mort...", width / 2, i);
    if (i == (height / 2.5)) { 
      titreAnimF = false; }
  }
      
   else if (!titreAnimF && !titreAnimI && !titreAnim) {
     textFont(titleFont);
     fill(255, 255);
     textAlign(CENTER);
     textSize((width + height) / 10);
     text("Chat mort...", width / 2, height / 2.5); }
     
     
  textSize((width + height) / 100);
  text("Clicker pour l'ecran titre", width/ 2, height / 1.1);
}
