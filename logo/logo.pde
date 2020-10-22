color orange  = color(244,128,36);  // FOR STACK
color gray    = color(200,200,200); // FOR LITTLE BUCKET
color white   = color(255,255,255); // FOR BACKGROUND

void setup() {
  size(640,480);
}

void draw() {
  background(white);
  noStroke();
  
  // stack
  fill(orange);
  rect(232, 316, 150, 28);
  
  pushMatrix();
  translate(238,248);
  rotate(radians(10));
  rect(0, 0, 150, 28);
  popMatrix();
  
  pushMatrix();
  translate(258,180);
  rotate(radians(20));
  rect(0, 0, 150, 28);
  popMatrix();
  
  pushMatrix();
  translate(288,112);
  rotate(radians(30));
  rect(0, 0, 150, 28);
  popMatrix();
  
  pushMatrix();
  translate(328, 52);
  rotate(radians(40));
  rect(0, 0, 150, 28);
  popMatrix();
  // end stack
  
  // little bucket
  fill(gray);
  rect(200,300,16,72);
  rect(400,300,16,72);
  rect(208,356,200,16);
  // end little bucket
}
