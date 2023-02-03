class Menu {
  Lights l2 = new Lights();
  Button b3 = new Button(800, 450, 500, 150, "Play");
  Button b4 = new Button(200, 900, 500, 150, "Quit");
  Button b9 = new Button(800, 650, 500, 150, "Info");
  Info i1 = new Info();
  Menu () {
  }
  void update () {
    l2.x = width/2;
    l2.y = height/2;
    l2.update();
    if (!info) {
      textAlign(CENTER);
      textSize(150);
      text("Rise of the Kingdom", 800, 200);
      b3.update();
      if (b3.clicked) {
        newgame = true;
        b3.clicked = false;
      }
      b4.update();
      if (b4.clicked) {
        exit();
      }
      b9.update();
      if (b9.clicked){
      info = true;
      b9.clicked = false;
      }
    } else if (info){
    i1.display();
    }
  }
}
