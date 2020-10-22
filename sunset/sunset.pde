/*	README	
 
 Authors: Franklin Montgomery, Anthony Corragio
 
 Summary: This program was designed to simulate the day/night cycle of earth featuring
 the sun and moon following the path of a parabolic arc. sun and moon rise and sets somewhat
 simulated as well.
 
 Interaction: No user interaction is required for this program to run.
 */
int wWidth = 1280, wHeight = 700;
color night = color(10, 16, 28);
color day = color(143, 223, 255);
color sunColor = color(245, 206, 62);
color moonColor = color(237, 234, 195);
int entitySpeed = 10, entityPosX = -64;
float hour = (wWidth/24);
float calcHour;
boolean changeEntity = true;

float EntityArc(int x) {
  return (0.0003*pow((x-(wWidth/2)), 2)+wHeight/4); // this is a parabola of an ideal arc for our entities
}

void bg() { // its not a bug, it's a feature!
  // if changeEntity is true we'll slowly increase the day opacity and decrease the night opacity
  // if its false we'll do the opposite
  if (changeEntity) {
    fill(day, 2.0*calcHour);
    rect(0, 0, wWidth, wHeight);
    fill(night, 100.0/calcHour);
    rect(0, 0, wWidth, wHeight);
  } else {
    fill(day, 100.0/calcHour);
    rect(0, 0, wWidth, wHeight);
    fill(night, 2.0*calcHour);
    rect(0, 0, wWidth, wHeight);
  }
}

void fg() {
  noStroke();                            // removing outline 
  fill(23, 95, 26);                      // dark green
  rect(-10, 500, 1300, 200);             // earth
  ellipse(950, 520, 800, 200);           // hills
  fill(158, 165, 158);                   // gray
  triangle(200, 300, 0, 500, 600, 500);  // main mountain
  fill(213, 222, 213);                   // snow white
  triangle(200, 300, 150, 350, 300, 350);// snow top of mountain
}

void renderEntity() {
  // cheeky way to decide which color our entity is
  color e = changeEntity ? sunColor : moonColor;
  fill(e);
  ellipse(entityPosX, EntityArc(entityPosX), 96, 96);
}

void settings() {
  size(wWidth, wHeight);
}

void setup() {
  noStroke();
}

void draw() {
  calcHour = entityPosX/hour; // we need to constantly update the time of day otherwise time would be frozen
  bg(); // render our background
  if (entityPosX < (wWidth+(96*2))) { // checks if our entity has gone off the screen or not draws and moves it.
    renderEntity();
    entityPosX+=entitySpeed;
    entityPosX = min(entityPosX, (wWidth+(96*2)));
  } else {
    changeEntity = !changeEntity; // if we failse the conditional we invert change entity to draw the appropriate value in renderEntity()
    entityPosX = -96*2; // we restart offscreen because it would be scary if something randomly appeared in the sky
  }
  fg(); // render foreground
}