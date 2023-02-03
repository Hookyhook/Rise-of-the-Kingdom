class Main {
  //Objects
  Player p1 = new Player(950, 890, 150);
  Enemy e1 = new Enemy(600, 890, 150);
  Ground g1 = new Ground();

  Main () {
    attackssurvived = 0;
  }

  void update () {

    
    control();

    g1.update();
    p1.update();
    e1.update();
    communicator();
    //Display score

    textFont(ScoreFont);
    textSize(55);
    textMode(CENTER);
    textAlign(LEFT);
    text("Survived Attacks "+Math.round(attackssurvived), 50, 175);
    text("FPS "+ Math.round(frameRate), 50, 225);
    textSize(25);
    if (slidecooldownon) {
      text("You slided too much Calm down", 1200, 50);
    }
    if (blockcooldownon) {
      text("You blocked too much Calm down", 1200, 75);
    }
  }
  //Share values
  void communicator () {
    e1.px = p1.x;
    e1.py = p1.y;
  }
  void control () {
    //If the player blocks in the wrong direction the block will not work
    if (dir == e1.s1.edir && block) {
      blockeffective = false;
    } else {
      blockeffective = true;
    }
  }
}
