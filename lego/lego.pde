color offWhite = color(245,242,208);		// bg color

int speed = 2;								// speed for character movement

int charX = 300, charY = 200;				// end pos for all 3 chars (pos is calculated so they don't overlap)
int posStartX = -200, posStartY = 200;		// char 1 starting x,y
int pos2StartX = 450, pos2StartY = 600;		// char 2 starting x,y
int pos3StartX = 900, pos3StartY = -800;	// char 3 starting x,y

void setup() {
	size(900, 600);
	noStroke();
}

void draw() {

	background(offWhite);

	// character one (red)
	pushMatrix();
	translate(charX, charY);
	if (posStartX <= 0) {					// decide how to handle our x movement if initial values are changed
		posStartX = posStartX + speed;
		posStartX = min(posStartX, 0);
	} else {
		posStartX = posStartX - speed;
		posStartX = max(posStartX, 0);
	}
	if (posStartY >= 0) {					// decide how to handle our y movement if initial values are changed
		posStartY = posStartY - speed;
		posStartY = max(posStartY, 0);
	} else {
		posStartY = posStartY + speed;
		posStartY = min(posStartY, 0);
	}
	fill(246, 221, 174);
	rect(0+posStartX, 0+posStartY, 48,48);
	fill(199, 87, 87);
	rect(0+posStartX, 48+posStartY, 48,128);
	fill(0, 0, 0);
	rect(0+posStartX, 128+posStartY, 48,48);
	popMatrix();


	// character two (green)
	pushMatrix();
	translate(charX*1.5, charY);
	if (pos2StartX <= 0) {
		pos2StartX = pos2StartX + speed;
		pos2StartX = min(pos2StartX, 0);
	} else {
		pos2StartX = pos2StartX - speed;
		pos2StartX = max(pos2StartX, 0);
	}
	if (pos2StartY >= 0) {
		pos2StartY = pos2StartY - speed;
		pos2StartY = max(pos2StartY, 0);
	} else {
		pos2StartY = pos2StartY + speed;
		pos2StartY = min(pos2StartY, 0);
	}
	fill(246, 221, 174);
	rect(0+pos2StartX, -48+pos2StartY, 48,48);
	fill(53, 220, 132);
	rect(0+pos2StartX, 0+pos2StartY, 48,176);
	fill(0, 0, 0);
	rect(0+pos2StartX, 128+pos2StartY, 48,48);
	popMatrix();

	// character three (blue)
	pushMatrix();
	translate(charX*2, charY);
	if (pos3StartX <= 0) {
		pos3StartX = pos3StartX + speed;
		pos3StartX = min(pos3StartX, 0);
	} else {
		pos3StartX = pos3StartX - speed;
		pos3StartX = max(pos3StartX, 0);
	}
	if (pos3StartY >= 0) {
		pos3StartY = pos3StartY - speed;
		pos3StartY = max(pos3StartY, 0);
	} else {
		pos3StartY = pos3StartY + speed;
		pos3StartY = min(pos3StartY, 0);
	}
	fill(246, 221, 174);
	rect(0+pos3StartX, 24+pos3StartY, 48,48);
	fill(89, 121, 224);
	rect(0+pos3StartX, 72+pos3StartY, 48,64);
	fill(0, 0, 0);
	rect(0+pos3StartX, 128+pos3StartY, 48,48);
	popMatrix();

}