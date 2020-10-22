/*
  Author: Franklin Montgomery
  Summary: This program reads 3 csv files and creates a graph of how many people have birthdays on that specific day
*/
int blockWidth = 30;
int blockHeight = 15;
int wWidth = (12*blockWidth)+150, wHeight = (31*blockHeight)+250;
String[] day, d;
String[] months, m;
String[] rank, r;
String[] moStr = { "null", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };

class bdViz {
  String month;      // derived from moStr and month.csv
  int numMonth;      // 1-12
  int numDay;        // 1-31
  int dayRank;       // rank from rank.csv
  color rIntensity;
  int blockX;
  int blockY;

  bdViz(String m, int nm, int nd, int dr) {
    month = m;
    numMonth = nm;
    numDay = nd;
    dayRank = dr;
    rIntensity = bdShade(dr);
  }

  void render() {
    blockX = (numMonth*blockWidth)+wWidth/12;
    blockY = (numDay*blockHeight)+wHeight/10;
    fill(0);
    textSize(15);
    if (numMonth == 1) {
      text(month, blockX+4, 70);
      text(numDay, 50, blockY+12);
    } else {
      text(month, blockX+4, 70);
    }
    fill(rIntensity);
    stroke(0);
    rect(blockX, blockY, blockWidth, blockHeight);
  }

  color bdShade(int rn) {
    float d = rn/4;
    return color(0, d+100, 175);
  }
}

bdViz[] bday = new bdViz[366]; // initalize object array

void settings() {
  size(wWidth, wHeight);
}

void setup() {
  
  // read our files
  day = loadStrings("day.csv"); 
  months = loadStrings("month.csv"); 
  rank = loadStrings("rank.csv"); 
  // parse our files
  d = split(day[0], ",");
  m = split(months[0], ",");
  r = split(rank[0], ",");
  // digest parsed files into bdViz array

  for (int i = 0; i < bday.length; i++) {
    if (int(d[i]) == 1) { // we only want the first of each month to contain our month string
      bday[i] = new bdViz(moStr[int(m[i])], int(m[i]), int(d[i]), int(r[i]));
    } else {
      bday[i] = new bdViz("", int(m[i]), int(d[i]), int(r[i]));
    }
  }
}

void draw() {
  background(150);
  for (bdViz bd : bday) {
    bd.render(); // have to render everything before drawing the number of people above it
    // otherwise weird overlap happens
  }
  for (bdViz bd : bday) { // render text of people when hovering over a day
    color hover = bd.dayRank/2 >= 150 ? color(0) : color(255);
    if (mouseX < bd.blockX+blockWidth && mouseX > bd.blockX && 
      mouseY < bd.blockY+blockHeight && mouseY > bd.blockY) {
      fill(hover);
      textSize(10);
      text(bd.dayRank, mouseX, mouseY);
    }
  }
  fill(0);
  textSize(12);
  text("More Common", (wWidth/6)*4, wHeight-70);
  text("Less Common", (wWidth/6), wHeight-70);
  for (int i = 0; i < 157; i++) { // draw our least common to most common gradient visual aid
    stroke(0, 256-i, 175);
    line((wWidth/3)+i, wHeight-100, (wWidth/3)+i, wHeight-50);
  }
}
