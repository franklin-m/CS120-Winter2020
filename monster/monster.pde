int wWidth        = 640, wHeight = 480; // our w/h dimensions for our window
int ground        = (wHeight/4)*3;
int pSpeed        = 7;
int[] pCords      = { 64, ground-96 };            // x/y values for monstor coordinates
int[] pSize       = { 128, 128 };                 // width/height values for monster's body
int bodyY         = -64;
int[] pupilCords  = { 0, bodyY/2, 64, bodyY/2 };  // positions of our pupils based on the translate
                                                  // call for our monster
boolean isJumping = false, isFalling = false;
int maxJumpHeight = pCords[1] - pSize[1]; // somewhat scale-able jumpheight

void drawMap() {
  background(100, 150, 255);
  fill(26, 162, 100);
  rect(0, ground, wWidth, wHeight/4);
}

void trackMouse() { // our eye tracking function which follows the mouse arround
  if (mouseX < pupilCords[0]+pCords[0]) { // we need to add pCord to adjust for the translate 
                                          // used in our drawMonster func
    pupilCords[0] -= 1;
    pupilCords[0] = max(pupilCords[0], -4);
  } else if (mouseX > pupilCords[0]+pCords[0]) {
    pupilCords[0] += 1;
    pupilCords[0] = min(pupilCords[0], 4);
  } 
  if (mouseX < pupilCords[2]+pCords[0]) {
    pupilCords[2] -= 1;
    pupilCords[2] = max(pupilCords[2], 64-4);
  } else if (mouseX > pupilCords[2]+pCords[0]) {
    pupilCords[2] += 1;
    pupilCords[2] = min(pupilCords[2], 64+4);
  }
  if (mouseY < pupilCords[1]+pCords[1] || mouseY < pupilCords[3]+pCords[1]) {
    pupilCords[1] -= 1;
    pupilCords[1] = max(pupilCords[1], (bodyY/2)-4);
    pupilCords[3] -= 1;
    pupilCords[3] = max(pupilCords[3], (bodyY/2)-4);
  } else if (mouseY > pupilCords[1]+pCords[1] || mouseY > pupilCords[3]+pCords[1]) {
    pupilCords[1] += 1;
    pupilCords[1] = min(pupilCords[1], (bodyY/2)+4);
    pupilCords[3] += 1;
    pupilCords[3] = min(pupilCords[3], (bodyY/2)+4);
  }
}

void drawMonster() { // this is our monster, supposed to look like super meat boy
  color smb = color(172, 11, 18);
  translate(pCords[0], pCords[1]);
  // body
  fill(smb);
  rect(-32, bodyY, pSize[0], pSize[1]);
  // eyes
  fill(0, 0, 0);
  ellipse( 0, bodyY/2, 16, 16);
  ellipse(64, bodyY/2, 16, 16);
  // pupils
  fill(255, 255, 255);
  ellipse(pupilCords[0], pupilCords[1], 4, 4);
  ellipse(pupilCords[2], pupilCords[3], 4, 4);
  // legs
  fill(smb);
  // left leg
  rect(-32, 64, 48, 32);
  //right leg
  rect(48, 64, 48, 32);
}

void checkJump() { // checks for isJumping and isFalling and jumps or falls accordingly
  if (isFalling) {
    Crouch(false);
    if (pCords[1] < ground) {
      pCords[1] += pSpeed;
      pCords[1] = min(pCords[1], ground-96);
    }
  } else if (isJumping) {
    Crouch(true);
    if (pCords[1] > maxJumpHeight) {
      pCords[1] -= pSpeed;
      pCords[1] = max(maxJumpHeight, pCords[1]);
    } else {
      isFalling = true;
    }
  }
}

void Crouch(boolean toggle) { // "crouches" our character before he jumps 
  // or when ctrl is pressed
  int base = -64;
  if (toggle) {
    bodyY += pSpeed;
    bodyY = min(bodyY, -48);
  } else {
    bodyY -= pSpeed;
    bodyY = max(bodyY, base);
  }
}

void keyPressed() {
 // println("keyCode: "+keyCode);
  switch (keyCode) { // using keycodes to trigger jump or left/right movement
  case 0x20: 
    { // space bar
      isJumping = true; 
      isFalling = !isJumping;
      break;
    }
  case 0x25: 
    { // left key
      pCords[0] -= pSpeed;
      break;
    }
  case 0x27: 
    { // right key
      pCords[0] += pSpeed;
      break;
    }
  }
}

void settings() {
  size(wWidth, wHeight);
}

void setup() {
  noStroke();
}

void draw() {
  drawMap();
  trackMouse();
  drawMonster();
  checkJump();
}
