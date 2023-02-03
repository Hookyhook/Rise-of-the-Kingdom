class Player {
  int x;
  int y;
  int b;
  int vx;
  int vy;
  int startspeed = 50;
  int speed = startspeed;
  int jumpheight = 40;
  int jumpspeed = 10;
  //Objects
  Lights l1 = new Lights();
  Healthbar h1 = new Healthbar();


  Player(int z1, int z2, int z3) {
    x= z1;
    y= z2;
    b= z3;
  }

  void update () {
    //Displaying lights
    lightscom();

    l1.update();
    //Displaying health
    h1.update();
    //Displaying Player Image
    imageMode(CENTER);
    if (dir == "right") {
      if (injump) {
        image(playerimgrightjump, x-7, y-140, b*5, b*5);
      } else if (block) {
        image(playerimgrightblock, x+30, y-120, b*5, b*5);
      } else if (slide) {
        image(playerimgrightslide, x+30, y-190, b*5, b*5);
      } else {
        image(playerimgright, x-7, y-36, b*5, b*5);
      }
    } else if (dir == "left") {
      if (injump) {
        image(playerimgleftjump, x-7, y-140, b*5, b*5);
      } else if (block) {
        image(playerimgleftblock, x-40, y-120, b*5, b*5);
      } else if (slide) {
        image(playerimgleftslide, x+30, y-190, b*5, b*5);
      } else {
        image(playerimgleft, x-7, y-36, b*5, b*5);
      }
    }

    movement();
  }
  //Giving class Lights the values
  void lightscom () {
    l1.x = x;
    l1.y = y;
  }

  void movement() {
    //Move Player on x axis
    vx = Math.round(dirx * speed);
    if (x<40) {
      x = 1560;
    } else if (x> 1560) {
      x = 40;
    }
    x += vx;
    y += vy;
    //Stops movement after player reaches the ground
    if (stopinjump&&!injump) {
      stopinjump = false;
      dirx = 0;
    }
    //Block and slide
    if (block) {
      speed = startspeed/3;
    } else if (slide) {
      speed = startspeed * 2;
    } else {
      speed = startspeed;
    }
    //Jump
    if (!block&&!slide) {
      if (jump && !injump) {
        vy = -(jumpheight);
        jump = false;
        injump = true;
      } else if (vy<=jumpheight && injump) {
        vy += jumpspeed;
      }
      if (vy >jumpheight) {
        injump = false;

        vy = 0;
      }
    }
  }
}
