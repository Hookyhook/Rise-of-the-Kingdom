class Pause {
  Lights l4 = new Lights();
  Button b5 = new Button(800, 550, 700, 150, "Resume");
  Button b6 = new Button(800, 750, 500, 150, "Menu");
  Pause () {
  }
  void update () {
    //Light
    l4.x = width/2;
    l4.y = height/2;
    l4.update();
    //Text
    textAlign(CENTER);
    textSize(130);
    text("You paused the game!!!", 800, 250);
    //Manage buttons
    b5.update();
    if (b5.clicked) {
      paused = false;
      game = true;
      b5.clicked = false;
    }
    b6.update();
    if (b6.clicked) {
      paused = false;
      menu = true;
      b6.clicked = false;
    }
  }
}
