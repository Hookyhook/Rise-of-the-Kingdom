class Gameover {
  Lights l2 = new Lights();
  Button b1 = new Button(800, 550, 700, 150, "Play Again");
  Button b2 = new Button(800, 750, 500, 150, "Menu");
  Gameover () {
  }
  void update () {
    //Light
    l2.x = width/2;
    l2.y = height/2;
    l2.update();
    //Text
    textAlign(CENTER);
    textSize(150);
    text("You died!!!", 800, 250);
    textSize(100);
    if (highscore<attackssurvived||newhighscore) {
      b1.y = 550;
      b2.y = 750;
      highscore = attackssurvived;
      newhighscore = true;
      text("New Highscore  "+Math.round(highscore), 800, 400);
    } else {
      b1.y = 600;
      b2.y = 800;
      text("Your score was  "+Math.round(attackssurvived), 800, 400);
      text("Your highscore is"+Math.round(highscore), 800, 500);
    }
    //Manage buttoms
    b1.update();
    if (b1.clicked) {
      newgame = true;
      b1.clicked = false;
    }
    b2.update();
    if (b2.clicked) {
      gameover = false;
      menu = true;
      b2.clicked = false;
    }
  }
}
