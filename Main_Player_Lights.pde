class Lights {
  float x;
  float y;

  Lights () {
  }

  void update () {
    tint(255, 200);
    imageMode(CENTER);
    image(lightimage, x, y, width*2.3, height*2);
  }
}
