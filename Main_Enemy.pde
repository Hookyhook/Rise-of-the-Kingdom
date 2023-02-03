class Enemy {
  int x;
  int y;
  int b;
  int vx;
  int vy;
  int px;
  int py;
  int mvx = 30;
  int distancepe;

  String dir;

  Sword s1 = new Sword();

  Enemy(int z1, int z2, int z3) {
    x= z1;
    y= z2;
    b= z3;
  }

  void update () {
    fill(255);
    rectMode(RADIUS);
    if (dir == "right") {
      image(enemyright, x, y-184, b*4.5, b*4.5);
    } else if (dir == "left") {
      image(enemyleft, x, y-184, b*4.5, b*4.5);
    }
    com();
    s1.update();
    movement();
  }
  void movement () {
    x += vx;
    y += vy;
    //Distance Player Enemy
    distancepe = Math.round(dist(px, 0, x, 0));
    //Make the enemy track the player

    if (dist(px, 0, x, 0) > 200) {
      if (px > x) {
        vx = mvx;
        dir = "right";
        s1.xoffset = 30;
      }
      if (px < x) {
        dir = "left";
        vx = -mvx;
        s1.xoffset = -30;
      }
    } else {
      vx = 0;
    }
  }
  //Give values to sword
  void com () {
    s1.ex = x;
    s1.ey = y;
    s1.distance = distancepe;
    s1.px = px;
    s1.py = py;
    s1.edir = dir;
  }
}
