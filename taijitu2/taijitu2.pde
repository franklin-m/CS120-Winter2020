/*
  This program draws a Taijitu that follows the cursor when it moves over the window.
  
  Author: Franklin Montgomery
  Date: 3 January 2020
*/


void setup() {
   size(640, 480); // setting program window size to 640 width and 480 height
}
void draw() {
   // the rubric doesn't want black so it's not black anymore
   color yin   = color(200,30,30); // setting colors to variables so as to not type out the color over and over 
   color yang  = color(255,255,255); // ^
   //background(yang); // setting our background to white in order to hide the rectangle
   
   translate(mouseX, mouseY); // this will draw our shapes where ever our mouse is on the program window
  
   noStroke(); // we don't want any stroke on our shapes except for the ring
  
   fill(yin); // fill in shapes owned by yin
   ellipse(0, 0, 300,300); // large black circle
   fill(yang); // fill in shapes owned by yang
   ellipse(0, -75, 150,150); // med white circle
   rect(-150, -150, 150,300); // rect for yang shape
   fill(yin); // fill in shapes owned by yin
   ellipse(0, -75, 50,50); // small black circle
   ellipse(0, 75, 150,150); // med black circle
   fill(yang); // fill in shapes owned by yang
   ellipse(0, 75, 50, 50); // small white circle
  
   noFill(); // we want a transparent interior for the ring
   stroke(yin); // re-enabling stroke for ring
   strokeWeight(3); // setting the stroke weight to 3(pixels??)
   ellipse(0, 0, 300,300);// drawing our ring

}

/*
step 5 explanation:
draw is constantly redrawing the taijitu and background, so if background doesn't get called 
via means of being commented out as well it will look like that card effect from solitaire when you win.

*/
