class Bubble {
  float x, y, r;
  color c;
  
  Bubble(float x_, float y_, float r_, color c_) {
    x = x_;
    y = y_;
    r = r_;
    c = c_;
  }
  
  void display() {
    noStroke();
    fill(c);
    ellipse(x, y, r*2, r*2);
  }
}