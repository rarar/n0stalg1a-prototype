void setup ()
{
  fullScreen();
  background(0);
  noStroke();
  colorMode(HSB);
  smooth();
}

void draw ()
{ 
  fill(0, 25);
  rect(0, 0, width, height);
  
  //noLoop();
  //background(0); // clear background with white
  int start = 65;
  for (int r=32; r < 840; r+=32 ) // rows
  {
    for ( int c = 32; c < height/4.5; c+=32 ) // columns per row
    {
      ellipseMode(CENTER);
      int rand = (int)random(8, 78);
      int alphaRand = (int)map(rand, 8, 80, 50, 255);
      fill(#EE47B9, alphaRand);
      ellipse( r*3, c*3, rand, rand); // draw it!
    }
  }
}