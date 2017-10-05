void setup() {
  size(1000, 1000);
  background(227, 216, 255);
  smooth();
  
  //tail shadow
  noFill();
  stroke(0);
  strokeWeight(20);
  beginShape();
  curveVertex(600, 500); // the first control point
  curveVertex(600, 500); // is also the start point of curve
  curveVertex(700, 550);
  curveVertex(800, 700);
  curveVertex(650, 750);
  curveVertex(625, 800); // the last point of curve
  curveVertex(625, 800); // is also the last control point
  endShape();
  
  //tail
    noFill();
  stroke(255, 145, 145);
  strokeWeight(20);
  beginShape();
  curveVertex(650, 450); // the first control point
  curveVertex(650, 450); // is also the start point of curve
  curveVertex(750, 500);
  curveVertex(850, 650);
  curveVertex(700, 700);
  curveVertex(675, 750); // the last point of curve
  curveVertex(675, 750); // is also the last control point
  endShape();
  
  noStroke();
}

void draw() {
  
 ////snowman body
 // noStroke();
 // fill(255, 255, 255);
 // ellipse(width/2, height/2, 250, 250);
 // noStroke();
 // ellipse(width/2, height/2+200, 300, 300);
 // noStroke();
 // ellipse(width/2, height/2-175, 150, 150);
  
 // //snowman face
 // fill(0);
 // ellipse(width/2, height/2-175, 20, 20);
  
  //shadow
  strokeWeight(1);
  fill(0, 0, 0);
    //head
    triangle(450, 250, 200, 600, 700, 500);
    triangle(500, 350, 150, 350, 550, 750);
    //eyes
    ellipse(width/2-200, height/2-150, 100, 50);
    //teeth
    ellipse(207, 582, 8, 30);
    ellipse(215, 575, 5, 15);
    ellipse(222, 572, 5, 15);
    ellipse(158, 371, 8, 30);
    ellipse(167, 374, 5, 15);
    ellipse(175, 375, 5, 15);
    //tongue
    ellipse(265, 510, 150, 60);
  
  //creature teeth
  noStroke();
  fill(247, 247, 247);
  ellipse(257, 532, 8, 30);
  ellipse(265, 525, 5, 15);
  ellipse(272, 522, 5, 15);
  ellipse(208, 321, 8, 30);
  ellipse(217, 324, 5, 15);
  ellipse(225, 325, 5, 15);

  //creature tongue
  stroke(255, 60, 60);
  fill(255, 90, 90);
  //rotate(PI);
  ellipse(315, 460, 150, 60);
  //arc(210, 460, 150, 60, 0, PI+QUARTER_PI, CHORD);

  //creature head
  noStroke();
  fill(209, 254, 259);
  triangle(500, 200, 250, 550, 750, 450);
  noStroke();
  triangle(550, 300, 200, 300, 600, 700);
  
  //creature eyes
  noStroke();
  fill(255, 145, 145);
  ellipse(width/2-150, height/2-200, 100, 50);
  fill(0, 0, 0);
  ellipse(width/2-150, height/2-200, 20, 20);
  noStroke();
  stroke(255, 255, 255);
  line(width/2-130, height/2-180, width/2-140, height/2-190);
  line(width/2-135, height/2-180, width/2-145, height/2-190);
  line(width/2-140, height/2-180, width/2-150, height/2-190);
  noStroke();
}