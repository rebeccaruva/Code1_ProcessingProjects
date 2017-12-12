////////////////////////////////////////////////////////////////
// DIGITAL OFRENDA MAKER
// 
// Make a digital altar, ofrenda in Spanish, for your ancestors.
// Then learn about what Day of the Dead represents for people of
// Mexican descent and how you can celebrate.
//
// Code 1 - Fall 2017
// Rebecca Ruvalcaba (Bex)
// github.com/rebeccaruva
//
// Precedents:
// cos/sin to create flowers: https://www.funprogramming.org/122-Programming-roses-and-other-flowers.html
////////////////////////////////////////////////////////////////

import ddf.minim.*;

Minim minim;
AudioPlayer player;
Flower flower1, flower2, flower3;
int screenSelector, colorSelector, light, lightCount, pushLights, randX, randY, number, xPosi, yPosi, fillAmount, showText;
float strokeTime;
boolean isBeginning, canDraw, flowerO, flowerT, flowerH, flowerSaved, calaveraSaved, canSaveCalavera, canSaveOfrenda, canPlaceLights, start;
PImage sugarSkull, title, FPetal, TPetal, WPetal, eraser, candle, save, restart;
int[] lightSize = { 75, 100, 140, 30 }; 

void setup(){
  frameRate(60);
  size(2500, 1500);
  background(0);
  
  newStart();
}

void draw() {
  if (isBeginning == true) {
    //create a loading screen / splash screen
    if (millis() < 2000) {
      background(0);
      tint(45, 155, 75); //tint calaveras different colors
      image(sugarSkull, width/2-162, height/2-299);
    } else if (millis() < 3000) {
      background(0);
      tint(255, 155, 0);
      image(sugarSkull, width/2-162, height/2-299);
    } else if (millis() < 4000){
      background(0);
      tint(255, 65, 5);
      image(sugarSkull, width/2-162, height/2-299);
    } else if (millis() < 5000) {
      background(0);
      tint(45, 155, 75);
      image(sugarSkull, width/2-162, height/2-299);
    } else if (millis() < 6000) {
      background(0);
      tint(255, 155, 0);
      image(sugarSkull, width/2-162, height/2-299);
    } else {  //title screen
      background(0);
      image(title, width/2-939, height/2-750, 1878, 1502);
      fill(255);
      ellipse(width/2, height/2+400, 100, 100);
      if(dist(width/2, height/2+400, mouseX, mouseY) < 50) { //circle button to go to flower screen
        fill(0);
        ellipse(width/2, height/2+400, 100, 100);
        if(mousePressed){ //mousePressed changes screen within the circle button
          isBeginning = false;
          screenSelector = 1;
          fill(0);
          rect(0, 0, width, height);
        }
      }  
    }
  }
  
  //change screens!
  if (screenSelector == 1) {
    ofrendaScreen();
  } else if (screenSelector == 2) {
    calaveraScreen();
  } else if (screenSelector == 3) {
    lightScreen();
  } else if (screenSelector == 4) {
    infoScreen();
  }
}

void ofrendaScreen() {
  tint(255);
  
  //display the flowers on a mouse press
  if((mouseX > 0) && (mouseY > 0) && (mouseX < width - 325) && (mouseY < height) && (mousePressed) && (canDraw == true)) {
   pushMatrix();
   translate(xPosi, yPosi); //mouseX and mouseY are center of flower
    if(flowerO == true){
      flower1.display(); //4 petals
    } else if(flowerT == true){
      flower2.display(); //12 petals
    } else if(flowerH == true) {
      flower3.display();
    }
   popMatrix();
  }
  
  if (flowerSaved == false) {
    //right side panel
    fill(255);
    rect(width-250, 0, 250, height);
    
    //change flower petals buttons
    fill(0);
    rect(width-200, 300, 150, 150, 25);
    image(FPetal, width-200, 300, 146, 146);
    fill(0);
    rect(width-200, 500, 150, 150, 25);
    image(TPetal, width-200, 500, 146, 146);
    fill(0);
    rect(width-200, 700, 150, 150, 25);
    image(WPetal, width-200, 700, 150, 150);
    
    //tint flower buttons
    if(flowerO == true){
      tint(255, 155, 0);
      image(FPetal, width-200, 300, 146, 146);
    } else if (flowerT == true){
      tint(255, 155, 0);
      image(TPetal, width-200, 500, 146, 146);
    } else if (flowerH == true) {
      tint(255, 155, 0);
      image(WPetal, width-200, 700, 150, 150);
    }
    
    if ((mouseX > width-200) && (mouseY > 300) && (mouseX < width-50) && (mouseY < 450) && (mousePressed)) {
      //change to 4 flower petals
      flowerO = true;
      flowerT = false;
      flowerH = false;
      tint(255, 155, 0);
      image(FPetal, width-200, 300, 146, 146);
    }
    if ((mouseX > width-200) && (mouseY > 500) && (mouseX < width-50) && (mouseY < 650) && (mousePressed)) {
      //change to 12 flower petals
      flowerO = false;
      flowerT = true;
      flowerH = false;
      tint(255, 155, 0);
      image(TPetal, width-200, 500, 146, 146);
    }
    if ((mouseX > width-200) && (mouseY > 700) && (mouseX < width-50) && (mouseY < 850) && (mousePressed)) {
      //change to 20flower petals
      flowerO = false;
      flowerT = false;
      flowerH = true;
      tint(255);
      image(WPetal, width-200, 700, 150, 150);
    }
    
    //clear background button
    fill(255, 0, 0);
    rect(width-200, 50, 150, 100, 25);
    image(eraser, width-175, 50, 100, 100);
    
    if ((mouseX > width-200) && (mouseY > 50) && (mouseX < width-50) && (mouseY < 150) && (mousePressed)) {
      fill(0);
      rect(0, 0, width-250, height);
    }
    
    //save background and go to calaveras screen
    fill(45, 155, 75);
    rect(width-200, height-150, 150, 100, 25);
      
    if ((mouseX > width-200) && (mouseY > height-150) && (mouseX < width-50) && (mouseY < height-50) && (mousePressed)) {   
      flowerSaved = true;
      screenSelector = 2;
    }
  }
}

void calaveraScreen() {
  //make new right tab
  fill(255);
  rect(width-250, 0, 250, height);
  if (canSaveCalavera == true) {
    //calavera
    tint(255, 65, 5);
    image(sugarSkull, width-200, 25, 175, 225);
    tint(45, 155, 75);
    image(sugarSkull, width-200, 275, 175, 225);
    tint(255, 155, 0);
    image(sugarSkull, width-200, 525, 175, 225);
    //tint(255, 0, 0);
    //image(sugarSkull, width-200, 775, 175, 225);
    
    //pick a color for the calavera (a button)
    if(mouseX > width-200 && mouseX < width - 25 && mouseY > 25 && mouseY < 250 && mousePressed) {
      colorSelector = 0;
    } else if(mouseX > width-200 && mouseX < width - 25 && mouseY > 275 && mouseY < 500 && mousePressed) {
      colorSelector = 1;
    } else if(mouseX > width-200 && mouseX < width - 25 && mouseY > 525 && mouseY < 725 && mousePressed) {
      colorSelector = 2;
    }
    
    //save calavera andd go to light screen
    fill(45, 155, 75);
    rect(width-200, height-150, 150, 100, 25);
      
    if ((mouseX > width-200) && (mouseY > height-150) && (mouseX < width-50) && (mouseY < height-50) && (mousePressed)) {     
      calaveraSaved = true;
      screenSelector = 3;
    }
  }
}

void lightScreen() {
  noStroke();
  //make new right tab
  fill(255);
  rect(width-250, 0, 250, height);
  fill(255, 255, 100);
  rect(width-200, 50, 150, 100, 25);
  image(candle, width-175, 50, 100, 100);
  
  //have 5 lights appear at random (with the press of button)
  if ((mouseX > width-200) && (mouseY > 50) && (mouseX < width-50) && (mouseY < 150) && (mousePressed)) {
    light = lightSize[int(random(4))];
    randX = int(random(width-250));
    randY = int(random(height));
    
    //create (max. 50) random sized lights
    if ((lightCount < 5) && (canPlaceLights == true)) {
      fill(255, 255, (random(60, 125)), (random(45, 200)));
      ellipse(randX, randY, light, light);
      lightCount++;
      pushLights++;
      if(lightCount == 4) {
        canPlaceLights = false;
      }
    } else if ((pushLights < 50) && (canPlaceLights == true)) {
      lightCount = 0;
    }
  }
  
  //save your picture button
  fill(255, 155, 0);
  rect(width-200, height-200, 150, 175, 25);
  image(save, width-175, height-165, 100, 100);
  
  //capture your creation! (only portion of screen w/ ofrenda)
  if ((mousePressed) && (mouseX > width-200) && (mouseY > height-200) && (mouseX < width-50) && (mouseY < height-25) && (canSaveOfrenda == true)) {
      PImage ofrenda  = get(0, 0, width-250, height);
      String nombre = "/Data/DigitalOfrenda" + number + ".jpg"; 
      ofrenda.save(nombre);
      number++;
      start = true;
      screenSelector = 4;
      player.rewind();
      player.play();
  }
}

void infoScreen() {
  noStroke();
   background(0);
  
  if (start == true) {
    fill(255, 255, 255, fillAmount);
    rect(0, 0, width, height);
    println(fillAmount);
    fillAmount -= 5;
  }
  if (fillAmount < 0) {
    start = false;
  }
   fill(255, 255, 90);
   textSize(180);
   text("Your ofrenda has been saved!", 100, height/2-300, width-100, height/2);
   if((start == false) && (showText<150)) {
    showText++;
  } else if ((start == false) && (showText>=150)){
    fill(0);rect(0, 0, width, height);
    fill(255, 255, 90);
    textSize(80);
    text("Day of the Dead, also known as Día de los Muertos, is a holiday celebrated throughout Mexico. It is a day to celebrate ancestors, family members, and friends who have passed away. The celebration includes creating altars, also known as ofrendas, with pan dulce, flowers, calaveras (sugar skulls), and candles. Print out your digital ofrenda and place it on your in real life ofrenda!", 20, 300, width-40, height-80);
    fill(255, 155, 0);
    rect(width-200, height-150, 150, 100, 25);
    image(restart, width-175, height-150, 100, 100);
      
    if ((mouseX > width-200) && (mouseY > height-150) && (mouseX < width-50) && (mouseY < height-50) && (mousePressed)) {     
      screenSelector = 1;
      newStart();
    }  
}
}

void newStart() {
  //start values at 0
  screenSelector = 0;
  colorSelector = 0;
  lightCount = 0;
  pushLights = 0;
  strokeTime = 0;
  number = 0;
  fillAmount = 255;
  showText = 0;
  
  //set bools to true/false
  isBeginning = true;
  canDraw = false;
  flowerO = true;
  flowerT = false;
  flowerH = false;
  flowerSaved = false;
  calaveraSaved = false;
  canSaveCalavera = false;
  canSaveOfrenda = false;
  canPlaceLights = true;
  start = false;
  
  //load up the flowers from class Flower
  flower1 = new Flower(2, 0, 0); //4 petal flower
  flower2 = new Flower(6, 0, 0); //12 petal flower
  flower3 = new Flower(10, 0, 0); //20 petal flower
  
  //load images
  sugarSkull = loadImage("calavera2.png");
  title = loadImage("ofrendaTitle.png");
  FPetal = loadImage("4Petal.png");
  TPetal = loadImage("12Petal.png");
  WPetal = loadImage("20Petal.png");
  eraser = loadImage("erase.png");
  candle = loadImage("candle.png");
  save = loadImage("save.png");
  restart = loadImage("restart.png");
  
  //load audio
  minim = new Minim(this);
  player = minim.loadFile("click.wav");
  
  noStroke();
}

void mouseReleased() {
  if(screenSelector == 1) {
    canDraw = true;
  } else if ((screenSelector == 2)) {
    canSaveCalavera = true;
  } else if (screenSelector == 3) {
    canSaveOfrenda = true;
  }
  if((screenSelector == 3) && (mouseX > width-200) && (mouseY > 25) && (mouseX < width-50) && (mouseY < 175)) {
    canPlaceLights = true;
  }
}

void mousePressed() {
  //change tint for calaveras
  if(screenSelector == 2) {
    if (mouseX < width - 300) {
      if (colorSelector == 0) {
        tint(255, 65, 5);
      } else if (colorSelector == 1) {
        tint(45, 155, 75);
      } else if (colorSelector == 2) {
        tint(255, 155, 0);
      }
      image(sugarSkull, mouseX-162, mouseY-229);
    }
  }
  if(screenSelector == 1) {
    xPosi = pmouseX;
    yPosi = pmouseY;
  }
}

class Flower {
  //first up: instantiate fields  
  float k;
  float x1;
  float y1;
  float strokeTime = 0; //used to change color
  
  //next up: constructor will assign initial values
  Flower(float numpetals, float xPos, float yPos) {
    k = numpetals;
    x1 = xPos;
    y1 = yPos;
  }
  
  //final up: methods
  void display() {
    strokeWeight(0.01);
    scale(200, 200);
    float t = frameCount/20.0;
  
    //main flower
    float x = cos(k*t) * sin(t);
    float y = cos(k*t) * cos(t);
    stroke(244, 255-(map(sin(strokeTime), -1, 1, 0, 255)), 66);
    line(x1, y1, x, y);
    
    
    if (strokeTime >= 255) {
      strokeTime=0;
    } else {
      strokeTime+=.1;
    }
  }
}