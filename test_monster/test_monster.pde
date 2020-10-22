int wWidth = 640, wHeight = 480;

int ground = (wHeight/4)*3;

int[] pCords = { 64, ground-96 }; // x/y values for monstor coordinates

int[] pSize = { 128, 128 };     // width/height values for monster

int[] pupilCords = { 0, -32, 64, -32 };

void trackMouse() {
  /*
  
  
  */
}

void drawMonster() {
  color smb = color(172, 11, 18);
  translate(pCords[0], pCords[1]);
  // body
  fill(smb);
  rect(-32, -64, pSize[0], pSize[1]);
  // eyes
  fill(0,0,0);
  ellipse( 0, -32, 16, 16);
  ellipse(64, -32, 16, 16);
  // pupils
  fill(255,255,255);
  ellipse( 0, -32, 4, 4);
  ellipse(64, -32, 4, 4);

  pushMatrix();


  popMatrix();
  pushMatrix();


  popMatrix();
  

  // legs
  fill(smb);
  // left leg
  rect(-32, 64, 48, 32);
  //right leg
  rect(48, 64, 48, 32);
}

void settings() {
  size(wWidth, wHeight);
}

void setup() {
  noStroke();
}

void draw() {
  drawMonster();
}
