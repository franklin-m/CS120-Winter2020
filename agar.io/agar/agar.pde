// an attempt to make an agar.io clone in processing

int wWidth = 1280, wHeight = 720;

// Player Variables
int pScore = 0;
float pSize = 30;
float pRadius;
int pSpeed = 10;
float[] pCords = {0, 0};
color pColor = color(random(256), random(256), random(256));

// Enemy Variables

// Node Variables
int nodeSize = 10; 
int maxNodeCount = 512;
int curNodeCount = 0;
int bounds = 3000;

class Node {
  color nodeColor;
  int nodeX;
  int nodeY;
  boolean isEaten;
  int index;

  Node(color c, int x, int y, boolean e, int i) {
    nodeColor = c;
    nodeX = x;
    nodeY = y;
    isEaten = e;
    index = i;
  }

  void render() {
    if (!isEaten) {
      fill(nodeColor);
      ellipse(nodeX, nodeY, nodeSize, nodeSize);
    }
  }
}

Node[] nn = new Node[maxNodeCount];

void spawnNode(int i) {
  nn[i] = new Node(color(random(256), random(256), random(256)), int(random(-bounds, bounds)), int(random(-bounds, bounds)), false, i);
}

void prepNodes() {
  for (int i = 0; i < maxNodeCount; i++) {
    spawnNode(i);
  }
}

void renderPlayer() {
  if (mouseX != wWidth/2) {
    pCords[0] +=  (mouseX-wWidth/2)/(pSize/4+wWidth/8);
    pCords[0] = min(bounds-pRadius, max(-bounds+pRadius, pCords[0]));
  }
  if (mouseY != wHeight/2) {
    pCords[1] +=  (mouseY-wHeight/2)/(pSize/4+wHeight/8);
    pCords[1] = min(bounds-pRadius, max(-bounds+pRadius, pCords[1]));
  }
  pushMatrix();
  translate(wWidth/2-pCords[0], wHeight/2-pCords[1]);
  noStroke();
  for (Node n : nn) { // for each nn as n
    // if a node is eaten let's respawn it
    if (n.isEaten == true) {
      spawnNode(n.index);
    } else {
      // if our node falls between our players bounds it's eaten and our size and score increases
      // equation of a circle = +/-((x+k)^2+(y+h)^2 = r^2
      if (n.nodeX <= pCords[0]+pRadius && n.nodeX >= pCords[0]-pRadius && n.nodeY <= pCords[1]+pRadius && n.nodeY >= pCords[1]-pRadius) {
        n.isEaten = true;
        pScore++; 
        pSize+=.75;
      }
    }
    n.render();
  }
  fill(pColor, 150);
  strokeWeight(2.5);
  stroke(pColor, 255);
  ellipse(pCords[0], pCords[1], pSize, pSize);
  popMatrix();
}

void renderScore() {
  fill(0);
  textSize(16);
  text("Score: "+ pScore, 25, 25);
}

void settings() {
  size(wWidth, wHeight);
}

void setup() {
  prepNodes();
}

void draw() {
  pRadius = pSize/2;
  background(255, 255, 255);
  renderPlayer();
  renderScore();
}
