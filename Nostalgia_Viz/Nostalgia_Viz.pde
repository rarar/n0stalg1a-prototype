PFont prompt;
PFont promptPink;
PFont inputFont;
PImage nostalgia;
PImage ibmresearchlogo;

void setup() {
  background(0);
  fullScreen();
  smooth(3);
  noStroke();
  colorMode(HSB);
  prompt = createFont("helvetica-neue-light.ttf", 48, true);
  promptPink = createFont("helvetica-neue-bold.ttf", 48, true);
  inputFont = createFont("helvetica-neue-roman.ttf", 48, true);
  renderDisplay();
}

void draw() {
}


void renderDisplay() {
  fill(#272727);
  rect(0, 0, displayWidth, 100);
  
  nostalgia = loadImage("nostalgia.png");
  image(nostalgia, 50, 40);
  
  ibmresearchlogo = loadImage("IBMResearchLogo.png");
  image(ibmresearchlogo, 2292, 41);
  
  fill(#FF509E);
  rect(50, 176, 10, 80);
  
  fill(255);
  textFont(prompt, 48);
  textAlign(LEFT, TOP);
  text("Describe a time when computing made you", 80, 188);
  
  fill(#FF509E);
  textFont(promptPink, 48);
  text("feel inpsired…", 994, 189);
  
  fill(#272727);
  rect(100, 344, 2360, 140);
}

void keyPressed() {
  
}