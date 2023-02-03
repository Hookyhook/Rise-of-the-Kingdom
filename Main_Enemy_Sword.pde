class Sword {
  float ex;
  float ey;
  float px;
  float py;
  float x;
  float y;
  float xoffset = 30;
  float yoffset = 20;
  float distance;
  boolean attack;
  boolean abfuck;
  boolean ranged;
  float ticks;
  float ax;
  float ay;
  String edir;
  String oldedir;
  float abfuckticks;

  Sword () {
  }

  void update () {
    ticks++;
    if (ranged) {
      edir = oldedir;
    }
    if (abfuck) {
      abfuckticks++;
    }
    if (abfuckticks >3) {
      abfuck = false;
    }
    attackswitch();
    //Sword Hit Animation
    if (!attack) {
      x = ex + xoffset;
      y = ey + yoffset;
    } else {
      x += ax;
      y = ey + yoffset;
      //Detect Sword hit
      if (dist(x, 0, px, 0)<300 && block && blockeffective ) {
        ax = 0;
        attack = false;
        ranged = false;
      }
      if (dist(x, 0, px, 0)<100) {
        ax = 0;
        attack = false;
        ranged = false;
        damage = true;
      } else if (x > 1600 || x < 0) {
        ax = 0;
        attack = false;
        ranged = false;
      }
    }
    if (edir == "right") {
      if (ranged) {
        image(swordrightthrow, x-40, y-140, 400, 300);
      } else if (abfuck) {
        image(swordrighthit, x+30, y-200, 700, 700);
      } else {
        image(swordright, x-70, y-140, 1400, 1000);
      }
    } else if (edir == "left") {
      if (ranged) {
        image(swordleftthrow, x-40, y-140, 400, 300);
      } else if (abfuck) {
        image(swordlefthit, x-30, y-200, 700, 700);
      } else

      {
        image(swordleft, x+70, y-140, 1400, 1000);
      }
    }
  }

  void attackswitch () {
    //Decide which attack is used


    if (ticks == 15) {
      attack = true;
      ticks = 0;
      attackssurvived ++;
      if (distance > 300) {
        range ();
      } else {
        abfuck();
      }
    }
  }
  void range () {
    //Preserve direction of the sword no matter where the enemy goes
    oldedir = edir;
    if (px > x) {
      ax = 150;
    } else {
      ax = -150;
    }
    ranged = true;
  }
  //(-;
  void abfuck () {
    damage = true;
    attack = false;
    abfuck = true;
  }
}
