String inputValue = "Share your story…";

PFont prompt;
PFont promptPink;
PFont inputFont;
PImage nostalgia;
PImage ibmresearchlogo;
PImage latestcontributions;

int caretFade = 255;
int bgFade = 255;

color inputFontColor = #A6A5A6;

Boolean sharedStory = false;
int startTime;

Plot plot;
Bubble[] bubbles = new Bubble[20];

int leftMargin = 150;
int rightMargin = 550;
int topMargin = 690;
int bottomMargin = 150;

int minRadius = 10;
int maxRadius = 30;

void setup() {
  background(0);
  fullScreen();
  smooth(3);
  noStroke();
  colorMode(HSB);


  prompt = createFont("helvetica-neue-light.ttf", 48, true);
  promptPink = createFont("helvetica-neue-bold.ttf", 48, true);
  inputFont = createFont("helvetica-neue-roman.ttf", 48, true);

  plot = new Plot(leftMargin, topMargin, width-rightMargin, height-bottomMargin, color(#3D3D3D), 6, 5);

  renderDisplay();
  generateValues();
  drawTextInput();
  drawScatterPlot();
}

void draw() {
  if (sharedStory) {
    displayNewStoryVal();
  } else {
    renderDisplay();
    drawTextInput();
    drawScatterPlot();
  }
}

void displayNewStoryVal() {
  noStroke();
  fill(0, 50);
  rect(0, 0, width, height);
  stroke(#FF509E);
  strokeWeight(50);
  fill(0);
  ellipseMode(CENTER);
  ellipse(width/2, height/2, width/2.15, width/2.15);
  textFont(prompt, 36);
  fill(#ffffff, 200);
  textAlign(CENTER);
  text("Your Story's Nostalgia Index:", width/2, 520);
  textFont(promptPink, 426);
  fill(#FF509E);
  text("98.6", width/2, 900);
  fill(#ffffff);
  textFont(prompt, 48);
  text("63.4% More Nostalgic than Users", width/2, 1000);

  if (millis() > startTime + 2500) {
    sharedStory = false;
  }
}

void drawTextInput() {
  noStroke();
  rectMode(CORNER);
  fill(#272727, bgFade);
  rect(100, 344, 2360, 140);
  fill(inputFontColor);
  rect(150, 442, 1653, 2);
  textFont(inputFont);
  text(inputValue, 152, 382);

  fill(#ffffff, caretFade);
  caretFade = caretFade-=4;
  if (caretFade < 0) caretFade = 255;
  if (inputValue.contains("Share your story…")) rect(150, 376, 2, 60);
  else rect(150 + textWidth(inputValue), 376, 2, 60);
}

void renderDisplay() {
  noStroke();
  rectMode(CORNER);
  fill(0, bgFade);
  rect(0, 0, width, height);
  fill(#272727);
  rect(0, 0, displayWidth, 100);

  nostalgia = loadImage("nostalgia.png");
  image(nostalgia, 50, 40);

  ibmresearchlogo = loadImage("IBMResearchLogo.png");
  image(ibmresearchlogo, 2292, 41);

  latestcontributions = loadImage("latestcontributions.png");
  image(latestcontributions, 50, 594);

  fill(#FF509E);
  rect(50, 176, 10, 80);

  fill(255);
  textFont(prompt, 48);
  textAlign(LEFT, TOP);
  text("Describe a time when computing made you", 80, 188);

  fill(#FF509E);
  textFont(promptPink, 48);
  text("feel inpsired…", 994, 189);
}

void sendStoryToServer() {
  println("sending story");
  sharedStory = true;
  startTime = millis();
  generateValues();
  bgFade = 50;
}

void keyPressed() {
  if (inputValue == "Share your story…") {
    fill(#ffffff);
    inputValue = "";
    inputFontColor = #ffffff;
  }

  if (key == BACKSPACE || key == DELETE || int(keyCode)==8) {
    if (inputValue.length() > 0) {
      inputValue = inputValue.substring(0, inputValue.length()-1);
    }
  } else if (keyCode == ENTER) {
    sendStoryToServer();
    inputValue = "Share your story…";
    inputFontColor = #A6A5A6;
  } else {
    inputValue = inputValue + key;
  }
}

void drawScatterPlot() {

  plot.display();

  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i].display();
  }
}

void generateValues() {
  for (int i = 0; i < bubbles.length; i++) {
    // randomize x y coords
    float x = random(maxRadius, plot.w() - maxRadius);
    float y = random(maxRadius, plot.h() - maxRadius);
    color c = color(#FF509E, 215);
    float r = random(minRadius, maxRadius);

    bubbles[i] = new Bubble(x + plot.topLeft.x, y + plot.topLeft.y, r, c);
  }
}