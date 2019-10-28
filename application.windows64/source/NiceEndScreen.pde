float colorVariation = 100f;
color colorRandom;
int depth;
float angle = 0;

void niceEndScreen() {
  
  musicNiceEnd.amp(0.1);

  if (Drag) {
    float ca = map(mouseX, 0, width, -1, 1);
    float cb = map(mouseY, 0, height, -1, 1);
    
    angle += 0.01;

    float w = 4.5;
    float h = (w * height) / width;
    float xmin = -w/2;
    float ymin = -h/2;
  
  
    colorRandom = color(250, 250, 250, 200);
  
  
  
    loadPixels();
  
  
    int maxiterations = 100;
  
  
    // x goes from xmin to xmax
    float xmax = xmin + w;
  
  
    // y goes from ymin to ymax
    float ymax = ymin + h;
  
  
    // increment x,y for each pixel
    float dx = (xmax - xmin) / (width);
    float dy = (ymax - ymin) / (height);
  
  
  
    // Start y
    float y = ymin;
    for (int j = 0; j < height; j++) {
      // Start x
      float x = xmin;
      for (int i = 0; i < width; i++) {
        
      depth = 20;
  
  
  
        // z = z^2 + cm
        float a = x;
        float b = y;
        int n = 0;
  
        while (n < maxiterations) {
          float aa = a * a;
          float bb = b * b;
  
          // Infinity
          if (aa + bb > 2.0) {
            break; }
  
          float twoab = 1.75 * a * b;
          a = aa - bb + ca;
          b = twoab + cb;
  
          n++;
          ++depth; }
  
        if (n == maxiterations) {
          pixels[i+j*width] = color(colorRandom);
  
        } else {
  
           pixels[i+j*width] = color(
            depth * red(colorRandom) * colorVariation % 255, 
            depth * red(colorRandom) * colorVariation % 255,
            depth * red(colorRandom) * colorVariation % 255, 200); }
        x += dx; }
      y += dy; }
  
    updatePixels(); }
    
  else {
    float ca = cos(angle*PI);
    float cb = sin(angle/PI); 
    
    angle += 0.01;

    float w = 4.5;
    float h = (w * height) / width;
    float xmin = -w/2;
    float ymin = -h/2;
  
  
    colorRandom = color(250, 250, 250, 200);
  
  
  
    loadPixels();
  
  
    int maxiterations = 100;
  
  
    // x goes from xmin to xmax
    float xmax = xmin + w;
  
  
    // y goes from ymin to ymax
    float ymax = ymin + h;
  
  
    // increment x,y for each pixel
    float dx = (xmax - xmin) / (width);
    float dy = (ymax - ymin) / (height);
  
  
  
    // Start y
    float y = ymin;
    for (int j = 0; j < height; j++) {
      // Start x
      float x = xmin;
      for (int i = 0; i < width; i++) {
        
      depth = 20;
  
  
  
        // z = z^2 + cm
        float a = x;
        float b = y;
        int n = 0;
  
        while (n < maxiterations) {
          float aa = a * a;
          float bb = b * b;
  
          // Infinity
          if (aa + bb > 2.0) {
            break; }
  
          float twoab = 1.75 * a * b;
          a = aa - bb + ca;
          b = twoab + cb;
  
          n++;
          ++depth; }
  
        if (n == maxiterations) {
          pixels[i+j*width] = color(colorRandom);
  
        } else {
  
           pixels[i+j*width] = color(
            depth * red(colorRandom) * colorVariation % 255, 
            depth * red(colorRandom) * colorVariation % 255,
            depth * red(colorRandom) * colorVariation % 255, 200); }
        x += dx; }
      y += dy; }
  
    updatePixels(); }
    
    
/***************                 ***************/


  textFont(titleFont);
  fill(0, 200);
  textAlign(CENTER);
  textSize((width + height) / 10);
  text("Chat heureux!", width /  2, height / 2.5);
  
  textSize((width + height) / 100);
  text("Clicker pour l'ecran titre", width / 2, height / 1.1); }
 
 
