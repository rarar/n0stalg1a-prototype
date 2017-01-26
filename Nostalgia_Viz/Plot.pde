class Plot {
  PVector topLeft, bottomRight;
  int h, v;
  color c;
  String[] yLabels; 
  String[] xLabels;
  PFont label;
  PFont labelLarge;

  Plot(int x1_, int y1_, int x2_, int y2_, color c_, int h_, int v_) {
    topLeft = new PVector(x1_, y1_);
    bottomRight = new PVector(x2_, y2_);
    h = h_+1;
    v = v_+1;
    c = c_;
    yLabels = new String[h];
    xLabels = new String[v];
    label = createFont("helvetica-neue-roman.ttf", 18, true);
    labelLarge = createFont("helvetica-neue-roman.ttf", 24, true);

    // ASSUME 30 is THE RANGE   
    float xLabelInterval = ceil(30/(h-1));
    for (int i = 0; i < h; i++) {
      yLabels[i] = str(int(30 - (i * xLabelInterval)));
    }

    float xLabelStart = 12;
    for (int i = 0; i < v; i++) {
      xLabels[i] = str(int(12) + i);
    }
  }

  void display() {
    rectMode(CORNERS);
    //fill(0, 40);
    //rect(topLeft.x-10, topLeft.y-10, bottomRight.x+10, bottomRight.y+10);
    stroke(c);
    strokeWeight(1);
    noFill();

    rect(topLeft.x, topLeft.y, bottomRight.x, bottomRight.y);

    float xRange = abs(topLeft.x - bottomRight.x);
    float yRange = abs(topLeft.y - bottomRight.y);
    float distanceBetweenHorizontalLines = (float)yRange/(h-1);
    float distanceBetweenVerticalLines = (float)xRange/(v-1);



    textFont(label);
    fill(#ffffff);

    for (int i = 0; i < h; i++)
    {
      line(topLeft.x, topLeft.y + (i*distanceBetweenHorizontalLines), topLeft.x + xRange, topLeft.y+ (i*distanceBetweenHorizontalLines));

      textAlign(RIGHT);
      text(yLabels[i], topLeft.x-textWidth(yLabels[0]), topLeft.y + (i*distanceBetweenHorizontalLines));
    }

    for (int i = 0; i < v; i++)
    {
      line(topLeft.x + (i*distanceBetweenVerticalLines), topLeft.y, topLeft.x + (i*distanceBetweenVerticalLines), topLeft.y + yRange);

      textAlign(LEFT, TOP);
      text(xLabels[i], topLeft.x + (i*distanceBetweenVerticalLines), topLeft.y + yRange+20 );
    }

    drawLegend();

    textFont(labelLarge);
    textAlign(CENTER);
    pushMatrix();
    translate(topLeft.x - 65, topLeft.y + (yRange/2));
    rotate(-HALF_PI);
    text("Occupancy", 0, 0);
    popMatrix();

    text("Time (24 Hour Clock)", topLeft.x + (xRange/2), bottomRight.y + 80);
  }

  void drawLegend() {
    noFill();
    stroke(#FFFFFF);
    strokeWeight(3);
    textAlign(CENTER, BOTTOM);
    text("100", bottomRight.x + 250, topLeft.y + 95);
    ellipse(bottomRight.x + 250, topLeft.y+250, 300, 300);
    text("75", bottomRight.x + 250, topLeft.y + 170);
    ellipse(bottomRight.x + 250, topLeft.y+287.5, 225, 225);
    text("50", bottomRight.x + 250, topLeft.y + 245);
    ellipse(bottomRight.x + 250, topLeft.y+325, 150, 150);
    text("25", bottomRight.x + 250, topLeft.y + 320);
    ellipse(bottomRight.x + 250, topLeft.y+362.5, 75, 75);
  }

  PVector topLeft() {
    return topLeft;
  }

  PVector bottomRight() {
    return bottomRight;
  }

  float w() {
    return bottomRight.x - topLeft.x;
  }

  float h() {
    return bottomRight.y - topLeft.y;
  }
}