
color red = #f95c81;
color green = #78f95c;
color redInvert = #06a37e;
color greenInvert = #8706a3;
float smallCircle, bigCircle;
int radius = 55;
int x, y;

void setup() {
  fullScreen();
  background(255);
  
  smallCircle = 25;
  bigCircle = 50;
  x = width/2-10;
  y = height/2-10;
  
  smooth();
  noStroke();
}

void draw() {
  
  float d = dist(mouseX, mouseY, x, y);
  println(d);
  
  //circle pattern
  //if starts with inverted colors when mouse is pressed
  if ((d < radius) && (mousePressed == true)) {
    background(0);
    
    for (int i = 20; i < width; i+=120) {
      for (int j = 20; j < width; j+=120) {
        fill(redInvert);
        ellipse(i, j, smallCircle, smallCircle);
      }
    }
    
    for (int i = 20; i < width; i+=60) {
      for (int j = 20; j < width; j+=60) {
        fill(redInvert);
        ellipse(i, j, smallCircle, smallCircle);
      }
    }
    
    for (int k = 50; k < width; k+=120) {
      for (int m = 50; m < width; m+=120) {
        fill(greenInvert);
        ellipse(k, m, bigCircle, bigCircle);
      }
    }
    
  fill(255);
  ellipse(x, y, radius*2, radius*2);
  }
  //else will display regular colors when mouse is not pressed.
  else {
    background(255);
    
    for (int i = 20; i < width; i+=120) {
      for (int j = 20; j < width; j+=120) {
        fill(red);
        ellipse(i, j, smallCircle, smallCircle);
      }
    }
    
    for (int i = 20; i < width; i+=60) {
      for (int j = 20; j < width; j+=60) {
        fill(red);
        ellipse(i, j, smallCircle, smallCircle);
      }
    }
    
    for (int k = 50; k < width; k+=120) {
      for (int m = 50; m < width; m+=120) {
        fill(green);
        ellipse(k, m, bigCircle, bigCircle);
      }
    }
    
  fill(0);
  ellipse(x, y, radius*2, radius*2);
  }
}