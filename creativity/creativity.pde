int wWidth = 1280, wHeight = 720;
int offset = 5;
void settings() {
	size(wWidth, wHeight);
}
void draw() {
	color rainbow = color(random(255), random(255), random(255));
	background(255, 255, 255);
	for (int i = 0; i <= wWidth; i+=offset) {
		stroke(mousePressed ? rainbow : color(0));
		line(i, 0, mouseX, mouseY);
		line(i, wHeight, mouseX, mouseY);
	}
	for (int j = 0; j <= wHeight; j+=offset) {
		stroke(mousePressed ? rainbow : color(0));
		line(0, j, mouseX, mouseY);
		line(wWidth, j, mouseX, mouseY);
	}
}
