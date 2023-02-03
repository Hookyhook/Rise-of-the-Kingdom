class Ground {
  float x;
  float y;
  Ground () {
  }
  void update () {
    fill(45, 70, 0);
    rectMode(CORNERS);
    noStroke();
    rect(0, 1000, 1600, 950);
  }
}
