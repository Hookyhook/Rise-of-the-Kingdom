class Healthbar {
  //VARIABLES
  float x;
  float y;
  float health;
  float maxhealth = 3;

  Heart h1 = new Heart(100, 75, "Full");
  Heart h2 = new Heart(200, 75, "Full");
  Heart h3 = new Heart(300, 75, "Full");


  Healthbar () {
    health = maxhealth;
  }
  void update () {
    Health();
    h1.display();
    h2.display();
    h3.display();
  }


  void Health() {
    //Calculate Health
    if (damage) {
      health -= 1;
      damage = false;
    }
    //Manage GameOver
    if (health == 0) {
      gameover = true;
      newhighscore = false;
      game = false;
    }
    //Modify Hearts
    if (health == 2) {
      h1.state = "Lost";
    } else if (health == 1) {
      h2.state = "Lost";
    } else if (health == 0) {
      h3.state = "Lost";
    }
  }
}
