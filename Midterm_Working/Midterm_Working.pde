import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer player;
AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;
PImage cat;
PImage rat;
PImage fence;
PFont font1;
PFont font2;
PFont font3;
int screenSelector;
float spacePressed;
float food;
StopWatchTimer sw;

void setup() {
  fullScreen();
  noStroke();
  screenSelector = 0; //start at beginning screen
  food = 0; //food starts at nothing
  spacePressed = 0; //space starts at zero
  
  //load images, fonts, and sounds
  cat = loadImage("catWait.png");
  rat = loadImage("rat.png");
  fence = loadImage("fenceBroken.png");
  font1 = createFont("UrbanCalligraphy.ttf", 150);
  font2 = createFont("UrbanCalligraphy.ttf", 370);
  font3 = createFont("GoboldExtra2Italic.otf", 100);
  minim = new Minim(this);
  player = minim.loadFile("meow.wav");
  player1 = minim.loadFile("CatChirp.wav");
  player2 = minim.loadFile("catNoNo.wav");
  player3 = minim.loadFile("mouse.wav");
  
  //stopwatch
  println (millis());
  sw = new StopWatchTimer();
  sw.start();
}

void draw() {  
  if (screenSelector == 0) {
    background(0);

    textFont(font2);
    fill(100, 255, 255);
    textAlign(CENTER);
    text("Cat CrossIng", width/2, height/2-50); 
    
    textFont(font3);
    fill(255);
    textAlign(CENTER);
    text("Press enter to start", width/2, height/2+275);
    
    //play meow when you change screen
    if (keyPressed && key == ENTER) {
      player.rewind();
      player.play();
    }  
  } else if (screenSelector == 1) {
    screenInstructions();
  } else if (screenSelector == 2) {
    screenPlay();
  } else if (screenSelector == 3) {
    screenRat();
  } else if (screenSelector == 4) {
    screenSpace();
  } else if (screenSelector == 5) {
    screenLost();
  }
  
  //find which screen to go to 
  if (keyPressed) {
    if(key == ENTER || key == RETURN) { //go to instructions
      screenSelector = 1;
    } else if(key == 'w') { //cat jumped over wall
      screenSelector = 4;
    }
  }
}

void screenInstructions() {
  background(0);
  
  textFont(font2);
  fill(100, 255, 255);
  textAlign(CENTER);
  text("Cat CrossIng", width/2, 500); 
    
  textFont(font3);
  fill(255);
  textAlign(CENTER);
  text("Quick! You are a cat that needs to get over this fence! Make sure you are well fed with the F key and try to jump over with SPACEBAR. Make sure to hurry! You need to get over as soon as possible.", 100, 800, width-300, height-300);
  
  fill(100, 255, 255);
  rect(width/2-205, height-550, 400, 200, 55);
  textFont(font1);
  fill(255);
  textAlign(CENTER);
  text("meow", width/2, height-400);
  
  //change button color
  if ((mouseX > width/2-205) && (mouseY > height-550) && (mouseX < width/2+195) && (mouseY < height-350)) {
    fill(255);
    rect(width/2-205, height-550, 400, 200, 55);
    textFont(font1);
    fill(100, 255, 255);
    textAlign(CENTER);
    text("meow", width/2, height-400);
    
    //play meow when you push button to change screen
    if (mousePressed) {
      screenSelector = 2;
      player.rewind();
      player.play();
    }
  }
}

void screenPlay() {
  background(175, 200, 255);
  
  //ground
  noStroke();
  fill(175, 135, 85);
  rect(0, height-height*.20, width, height*.20);
  
  //food bar
  if (food >= 0 && food <= 25) {
    fill(255, 0, 0);
  } else if (food > 25 && food <= 50) {
    fill(255, 255, 0);
  } else {
    fill (0, 255, 0);
  }
  //food bar stroke
  strokeWeight(4);
  stroke(255);
  rect(0, 0, (width*(food/100)), 75);
  
  //lose food health over time
  if((food >= 75) && (food <= 100) && (millis() >= 60000)) {
    food -= 5;
  }
  
  //stopwatch in corner
  time();
  
  //cat
  image(cat, width/2-250, height-950, 2079/3, 2571/3);
  
  //make a hole in the wall that shows a rat when you click
  if ((mouseX > width-410) && (mouseX < width-160) && (mouseY > height-435) && (mouseY < height)) {
    noStroke();
    fill(0);
    rect(width-410, height-435, 250, 435);
  }
  
  //wall
  image(fence, 0, 500, width+20, height-500);
  noStroke();
  fill(255, 255, 0, 0);
  rect(width-400, height-500, 250, 500);
  
  if (millis() > 120000) {
    screenSelector = 5;
  }
}

void screenRat() {
   background(175, 135, 85);
  
   //image and text
   image(rat, width/2-500, height/2-100);
   textFont(font3);
   textAlign(CENTER);
   fill(255);
   text("You lil rat, how dare you get through this fence. I've been waiting FOREVER!", width/2, height/2-500);
   
   fill(175, 200, 255);
   rect(width/2-225, height-400, 450, 200, 55);
   textFont(font1);
   fill(255);
   textAlign(CENTER);
   text("hah", width/2, height-250);
  
   if ((mouseX > width/2-225) && (mouseY > height-400) && (mouseX < width/2+225) && (mouseY < height-200)) {
     fill(255);
     rect(width/2-225, height-400, 450, 200, 55);
     textFont(font1);
     fill(175, 200, 255);
     textAlign(CENTER);
     text("sucks huh", width/2, height-250);
     if (mousePressed) {
       screenSelector = 2;
       player3.rewind();
       player3.play();
     }
   }
}

void screenSpace() {
  background(175, 135, 85);
  textFont(font3);
  textAlign(CENTER);
  fill(255);
  text("I've told you NO 10 times. I can't jump.", width/2, height/2);
  
  //go back to playing
  fill(175, 200, 255);
  rect(width/2-205, height-550, 400, 200, 55);
  textFont(font1);
  fill(255);
  textAlign(CENTER);
  text("Oh no", width/2, height-400);
  
  if ((mouseX > width/2-205) && (mouseY > height-550) && (mouseX < width/2+195) && (mouseY < height-350)) {
    fill(255);
    rect(width/2-205, height-550, 400, 200, 55);
    textFont(font1);
    fill(175, 200, 255);
    textAlign(CENTER);
    text("Oh no", width/2, height-400);
    if (mousePressed) {
      screenSelector = 2;
      player.rewind();
      player.play();
    }
  }
}

void screenLost() {
  background(0);

  textFont(font2);
  fill(100, 255, 255);
  textAlign(CENTER);
  text("Cat CrossIng", width/2, height/2-300); 
    
  textFont(font3);
  fill(255);
  text("You couldn't cross the fence. Well, guess life on the other side of the fence isn't too bad. Try again when you have the resources to get over the fence. Which may be never. I dunno. Press Esc to leave. Bye.", 150, height/2+100, width-300, height-500);
}

void keyPressed() {
  if ((keyCode == 'F' && food <= 100 && screenSelector == 2) || (keyCode == 'f' && food <= 100 && screenSelector == 2)) {
    food += 5;
    player1.rewind();
    player1.play();
  }
  
  if (keyCode == ' ' && screenSelector == 2) {
    player2.rewind();
    player2.play(); //no no cat
  }
}

void keyReleased() {
  if (keyCode == ' ') {
    spacePressed++;
    println(spacePressed);
    if (spacePressed > 10) {
      screenSelector = 4;
    }
  }
}

void mouseReleased() {
  if (screenSelector == 2) {
    if ((mouseX > width-410) && (mouseX < width-160) && (mouseY > height-435) && (mouseY < height)) {
      screenSelector = 3;
    }
  }
}

void time() {
  textFont(font3);
  fill(255);
  textAlign(RIGHT);
  text(nf(sw.minute(), 2)+":"+nf(sw.second(), 2), width-25, 200);
}

class StopWatchTimer {
  int startTime = 0, stopTime = 0;
  boolean running = false; 
  void start() {
    startTime = millis();
    running = true;
  }
  void stop() {
    stopTime = millis();
    running = false;
  }
  int getElapsedTime() {
    int elapsed;
    if (running) {
      elapsed = (millis() - startTime);
    }
    else {
      elapsed = (stopTime - startTime);
    }
    return elapsed;
  }
  int second() {
    return (getElapsedTime() / 1000) % 60;
  }
  int minute() {
    return (getElapsedTime() / (1000*60)) % 60;
  }
}