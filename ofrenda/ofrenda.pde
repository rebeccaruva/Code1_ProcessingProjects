Flower flower1, flower2;
int screenSelector, colorSelector, light, lightCount, randX, randY;
float strokeTime;
boolean isBeginning, canDraw, flowerO, flowerT, flowerSaved, calaveraSaved, canSaveCalavera, canSaveOfrenda;
PImage sugarSkull;
int[] lightSize = { 50, 75, 100, 30 }; 
//Image eyeImage = new Image("calavera2.png", new PImage());

void setup(){
  size(2500, 1500);
  background(0);
  screenSelector = 0;
  colorSelector = 0;
  lightCount = 0;
  strokeTime = 0;
  isBeginning = true;
  canDraw = false;
  flowerT = false;
  flowerO = true;
  flowerSaved = false;
  calaveraSaved = false;
  canSaveOfrenda = false;
  flower1 = new Flower(6, mouseX, mouseY); //12 petal flower -- 4 = 8 petals && 5 = 5petals && 7b = 7 petals && 8 = 16 petals
  flower2 = new Flower(2, mouseX, mouseY); //4 petal flower -- 9 = 9 petals && 10 = 20 petals && 11 = 11petals && 13 = 13 petals && 15 = 15 petals4
  sugarSkull = loadImage("calavera2.png");
}
void draw() {
  if (isBeginning == true) {
    if(millis() < 1250) {
      background(0);
      tint(255, 65, 5);
      image(sugarSkull, width/2-162, height/2-299);
    } else if (millis() < 2500) {
      background(0);
      tint(45, 155, 75);
      image(sugarSkull, width/2-162, height/2-299);
    } else if (millis() < 3750) {
      background(0);
      tint(255, 155, 0);
      image(sugarSkull, width/2-162, height/2-299);
    } else {
      background(0);
      noStroke();
      textSize(200);  
      fill(255);
      text("Ofrenda", width/2-320, height/2); 
      ellipse(width/2+100, height/2+200, 150, 150);
      if((dist(width/2+100, height/2+200, mouseX, mouseY) < 150/2) && mousePressed) {
        screenSelector = 1;
        fill(0);
        //fill(255, 248, 216);
        rect(0, 0, width, height);
        isBeginning = false;
      }  
    }
  }
  
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
  //display the flowers on a mouse press
  if((mouseX > 0) && (mouseY > 0) && (mouseX < width - 325) && (mouseY < height) && (mousePressed) && (canDraw == true)) {
    pushMatrix();
    translate(mouseX, mouseY); //mouseX and mouseY are center
    if(flowerO == true){
      flower1.display();
    } else if(flowerT == true){
      flower2.display();
    }
    popMatrix();
  }
  
  if (flowerSaved == false) {
    //right side panel
    fill(255);
    rect(width-250, 0, 250, height);
    
    
    //change flower from 12 pedals to 6 pedals
    fill(0);
    rect(width-100, 100, 70, 150);
    
    if ((mouseX > width-100) && (mouseY > 100) && (mouseX < width) && (mouseY < 250) && (mousePressed)) {
      //change flower petals
      flowerT = !flowerT;
      flowerO = !flowerO;
      fill(255, 60, 60);
      rect(width-100, 100, 70, 150);
    }
    
    //clear background (keep right panel)
    fill(255, 0, 0);
    rect(width-100, 0, 70, 50);
    
    if ((mouseX > width-100) && (mouseY > 0) && (mouseX < width-20) && (mouseY < 50) && (mousePressed)) {
      background(0);
      //background(255, 248, 216);
      fill(0);
      rect(width-100, 0, 70, 50);
      fill(255);
      rect(width-250, 0, 250, height);
      fill(0);
      rect(width-100, 0, 70, 50);
      fill(0);
      rect(width-100, 100, 70, 150);
    }
    
    //save background and go to calaveras screen
    fill(0);
    rect(width-100, height-100, 70, 70);
    
    if ((mouseX > width-100) && (mouseY > height-100) && (mouseX < width-20) && (mouseY < height-20) && (mousePressed)) {
      fill(255, 0, 0);
      rect(width-100, height-100, 70, 70);
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
    
    fill(0);
    rect(width-100, height-100, 70, 70);
      
    if ((mouseX > width-100) && (mouseY > height-100) && (mouseX < width-20) && (mouseY < height-20) && (mousePressed)) {       
      fill(255, 0, 0);
      rect(width-100, height-100, 70, 70);
      calaveraSaved = true;
      screenSelector = 3;
    }
  }
}

void lightScreen() {
  noStroke();
  light = lightSize[int(random(4))];
  randX = int(random(width));
  randY = int(random(height));
  
  //create 25 random sized lights
  if (lightCount < 25) {
    fill(255, 255, (random(60, 125)), (random(45, 200)));
    ellipse(randX, randY, light, light);
    lightCount++;
  }
  
  //make new right tab
  fill(255);
  rect(width-250, 0, 250, height);
  
  //capture your creation! (w/ flowers, calaveras, and lights)
  if ((mousePressed) && (mouseX > width-175) && (mouseY > height-200) && (mouseX < width) && (mouseY < height) && (canSaveOfrenda == true)) {
      PImage ofrenda  = get(0, 0, width-250, height);
      ofrenda.save("testOfrenda.jpg");
      screenSelector = 4;
  }
}

void infoScreen() {
   background(0);
   fill(255, 255, 90);
   text("Your ofrenda has been saved!", 100, height/2-300, width-100, height/2);
}

void mouseReleased() {
  if(screenSelector == 1) {
    canDraw = true;
  } else if (screenSelector == 2) {
    canSaveCalavera = true;
  } else if (screenSelector == 3) {
    canSaveOfrenda = true;
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

//class Image {
//  String path;
//  PImage image;
  
//  public Image (String imagePath, PImage anImage) {
//    this.path = imagePath;
//    this.image = anImage;
//  }
  
//  void imageSetup(String imagePath) {
//      image = loadImage(imagePath);
//  }
  
//  void imageDraw(){
//    if((mouseX > 0) && (mouseY > 0) && (mouseX < width - 325) && (mouseY < height) && (mousePressed)) {
//      pushMatrix();
//      translate(mouseX-162, mouseY-229);
//      image(this.image, 0, 0);
//      popMatrix();
//    }
//  }
//}