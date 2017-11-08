import gab.opencv.*;

import kinect4WinSDK.Kinect;
import kinect4WinSDK.SkeletonData;

Kinect kinect;
PImage land, nuevo;
PFont font1, font2, font3, font4, font5;
float transparency;
OpenCV opencv;
int[] pulse = new int[4];
PFont[] fonts = new PFont[4];
int randNum1, randNum2;


void setup()
{
  size(1920, 1280, P3D);
  background(0);
  kinect = new Kinect(this);
  smooth();
  noStroke();
  transparency = 0;
  
  font1 = createFont("Nervous.ttf", 14);
  font2 = createFont("Nervous.ttf", 30);
  font3 = createFont("Nervous.ttf", 50);
  font4 = createFont("Nervous.ttf", 67);
  font5 = createFont("Nervous.ttf", 85);
  
  fonts[0] = font1;
  fonts[1] = font2;
  fonts[2] = font3;
  fonts[3] = font4;
  
  pulse[0] = 1920;
  pulse[1] = 1280;
  pulse[2] = 640; 
  pulse[3] = 320; 
  
}

void draw()
{
  randNum1 = int(random(4));
  randNum2 = int(random(4));
  opencv = new OpenCV(this, kinect.GetDepth());
  opencv.findCannyEdges(20,75);
  opencv.brightness((int)map(mouseY, 0, height, 255,-255));
  image(opencv.getOutput(), 0, 0);
  nuevo = opencv.getSnapshot();
  //background(255);
  image(nuevo, 0, 0, pulse[randNum1], pulse[randNum2]);
  fill(255);
  textFont(font5);
  text("produced by", pulse[randNum2], pulse[randNum1]);
  textFont(fonts[int(random(4))]);
  text("Lillian, Bex, Jo, and Ian", random(width), random(width));
  
  
  if (mouseX < 240 && mouseX > 0)
  {
    tint(255, 0, 0);
  }
  else if (mouseX < 480 && mouseX > 240)
  {
    tint(240, 120, 30);
  }
  else if (mouseX < 720 && mouseX > 480)
  {
    tint(240, 230, 30);
  }
  else if (mouseX < 960 && mouseX > 720)
  {
    tint(100, 200, 30);
  }
  else if (mouseX < 1200 && mouseX > 960)
  {
    tint(100, 190, 230);
  }
  else if (mouseX < 1440 && mouseX > 1200)
  {
    tint(70, 130, 230);
  }
  else if (mouseX < 1680 && mouseX > 1440)
  {
    tint(180, 100, 230);
  }
  else if (mouseX < 1920 && mouseX > 1680)
  {
    tint(220, 100, 230);
  }
}

//if (transparency < 255) {
  //  transparency += 0.1;
  //  if (transparency >= 127.5) {
  //    transparency -= 0.1;
  //  }
  //}
  //fill(0, transparency);
  //rect(0, 0, width, height);
  //image(kinect.GetDepth(), 0, 0, 1920, 1280);
  //image(land, 0, 0, 1920, 1280);
  //fill(random(255), random(255), random(255));
  //ellipse(random(1920), random(1280), 3, 3);
  //image(kinect.GetDepth(), 0, 0, 1920, 1280);
  //tint(random(256), random(256), random(256));
  //noTint();