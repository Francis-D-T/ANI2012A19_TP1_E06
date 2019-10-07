void titleScreen() {

  if(fade){
    fill(0, 40);
    rect(0, 0, width, height);
    fill(255);
    textAlign(CENTER);
    textSize(30);
    text("Hit SPACE to start", height/1.1, width/2);

  }else{
    fill(65, 17, 94);
    rect(0, 0, width, height);
    textSize(130);
    textFont(titleFont);
    fill(255);
    textAlign(CENTER);
    text("Titre", height/1.1, width/3.5);
  } 
}
