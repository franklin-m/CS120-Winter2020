import processing.serial.*; // need this for delay

int colHilite = 1; // highlights column if cycle from animal() is false
int rowHilite = 1;

// scale of window based on these numbers
int numAnimal = 10; // choose number of animals per row
int numRow    = 10; // choose number of rows

color bg    = color(156, 223, 254);

void drawAnimal(int offsetX, int offsetY, boolean rainbow) {
  color gray  = color(154, 154, 154);
  color black = color(0, 0, 0);
  color rand  = color(random(255), random(255), random(255));
  color pink  = color(251, 156, 192);
  // single line conditional to decide what color the cat should be
  color cat   = rainbow ? rand : gray;
  pushMatrix();
  noStroke();
  translate(72*offsetX, 72*offsetY);
  // outer ear
  fill(cat);
  triangle( 3, -28, 25+5, -32-5, 25, -16);
  triangle(-3, -28, -25-5, -32-5, -25, -16);
  // inner ear
  fill(pink);
  triangle( 3-2, -28+2, 25, -32, 25-2, -16+2);
  triangle(-3+2, -28+2, -25, -32, -25+2, -16+2);
  // head
  fill(cat);
  ellipse(0, 0, 64, 64);
  // eyes
  fill(black);
  ellipse(-8, -8, 8, 8);
  ellipse( 8, -8, 8, 8);
  // nose
  triangle(0, 4, 4, -4, -4, -4);
  // mouth/whiskers
  stroke(black);
  noFill();
  ellipse( 4, 4, 8, 8);
  ellipse(-4, 4, 8, 8);
  // this hides part of the mouth so it looks more like a cat face
  noStroke();
  fill(cat);
  ellipse( 6, 2, 8, 8);
  ellipse(-6, 2, 8, 8);
  popMatrix();
}

void gridAnimal(int numberOfAnimals, int numberOfRows, boolean cycle) {
  /*
		we dont wanna manually deal with drawing the cats so both of
   		the for loops will iterate through the number of animals we want
   		per row and the number of rows we want.
   	*/
  for (int i = 1; i <= numberOfAnimals; i++) { 

    for (int j = 1; j <= numberOfRows; j++) {

      if (i == colHilite) { // this will tell our function which column of cats we want to highlight
        drawAnimal(i, j, true);
      } else {
        drawAnimal(i, j, false);
      }
      if (j == rowHilite) {
        drawAnimal(i, j, true);
      }
    }
  }

  // increments colHilite to change the highlighted column if cycle is true
  if (cycle) {
    if (colHilite == numberOfAnimals) {
      colHilite = 1;
    } else {
      colHilite++;
    }
    if (rowHilite == numberOfRows) {// same thing but for row
      rowHilite = 1;
    } else {
      rowHilite++;
    }
    delay(250);
  }
}

void settings() {
  int width   = (numAnimal*72)+72;
  int height  = (numRow*72)+72;
  size(width, height);
}
void setup() {
  noStroke();
  background(bg);
}
void draw() {
  gridAnimal(numAnimal, numRow, true);
}
