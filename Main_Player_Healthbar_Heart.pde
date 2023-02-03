class Heart {
  float x;
  float y;
  String state;

  Heart (float z1, float z2, String z3) {
    x = z1;
    y = z2;
    state = z3;
  }

  void display () {
    switch(state) {
    case "Full":
      imageMode(CENTER);
      image(FullHeart, x, y, 175, 175);
    case "Half":
      imageMode(CENTER);
      image(HalfHeart, x, y, 175, 175);
    case "Lost":
      imageMode(CENTER);
      image(LostHeart, x, y, 175, 175);
    }
  }
}
