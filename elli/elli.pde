int wWidth = 1280, wHeight = 720;
int[] elliX = new int[7];
int[] elliY = new int[elliX.length];
color[] elliColor = new color[elliX.length];
boolean moveElli = false;
int elliVelocity = 20;
boolean elliDirection = false; // false = horizontal | true = vertical
int[] appleCords = new int[2];
boolean isEaten = false;
int score = 0;

void randomApple() {
  if (!isEaten) {
    fill(255,0,0);
    ellipse(appleCords[0], appleCords[1], 25,25);
    fill(0,255,0);
    ellipse(appleCords[0], appleCords[1]-12,5,10);
  } else {
    score++;
    for (int i = 0; i<appleCords.length; i++) {
      appleCords[i] = int(random(100, i == 0 ? wWidth-100 : wHeight-100));
    }
    isEaten = !isEaten;
  }
}

void renderElli() {
  for (int i = 0; i < elliX.length; i++) {
    fill(elliColor[i]);
    ellipse(elliX[i], elliY[i], 30, 30);
  }
  fill(255, 0, 0);
  ellipse(elliX[elliX.length-1]-5, elliY[elliY.length-1]-5, 7, 7);
  ellipse(elliX[elliX.length-1]+5, elliY[elliY.length-1]-5, 7, 7);
}

void keyPressed() {
  if (keyCode == 0x20) {
    moveElli = !moveElli;
  }
  // movement 
  switch (keyCode) {
  case UP:
    if (elliVelocity > 0) {
      elliVelocity *= -1;
    }
    elliDirection = true;
    break;
  case DOWN:
    if (elliVelocity < 0) {
      elliVelocity *= -1;
    }
    elliDirection = true;
    break;
  case LEFT:
    if (elliVelocity > 0) {
      elliVelocity *= -1;
    }
    elliDirection = false;
    break;
  case RIGHT:
    if (elliVelocity < 0) {
      elliVelocity *= -1;
    }
    elliDirection = false;
    break;
  }
}

void settings() {
  size(wWidth, wHeight);
}

void setup() {
  frameRate(8);
  for (int i = 0; i < elliX.length; i++) {
    elliX[i] = (i+1)*20;
    elliY[i] = 100;
    elliColor[i] = color(0, (i+1) * 36, 200);
  }
  for (int i = 0; i<appleCords.length; i++) {
    appleCords[i] = int(random(100, i == 0 ? wWidth-100 : wHeight-100));
  }
}

void draw() {
  background(0, 0, 0);

  fill(255);
  textSize(14);
  text("Score: " + score, 20, 20);

  if (moveElli) { // press space to start or stop elli's movement
    for (int i = 0; i < elliX.length; i++) {
      if ( i == elliX.length-1) {
        if (elliDirection) {
          elliY[elliY.length-1] += elliVelocity;
        } else {
          elliX[elliX.length-1] += elliVelocity;
        }
      } else {
        elliX[i] = elliX[i+1];
        elliY[i] = elliY[i+1];
      }
    }
  }
  renderElli();
  if(elliX[elliX.length-1] > appleCords[0]-25 && elliX[elliX.length-1] < appleCords[0]+25
      && elliY[elliY.length-1] > appleCords[1]-25 && elliY[elliY.length-1] < appleCords[1]+25) {
        isEaten = !isEaten;
      }
  randomApple();
}
