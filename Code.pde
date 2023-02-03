void setup () { //<>//
  size(1600, 1000);
  frameRate(60);
  //Loading Images
  playerimgright = loadImage("Player_right.png");
  playerimgleft = loadImage("Player_left.png");
  playerimgrightjump = loadImage("Player_right_jump.png");
  playerimgleftjump = loadImage("Player_left_jump.png");
  playerimgrightblock = loadImage("Player_right_block.png");
  playerimgleftblock = loadImage("Player_left_block.png");
  playerimgrightslide = loadImage("Player_right_slide.png");
  playerimgleftslide = loadImage("Player_left_slide.png");

  enemyright = loadImage("Enemy_right.png");
  enemyleft = loadImage("Enemy_left.png");

  swordright = loadImage("Enemy_sword_right.png");
  swordrightthrow = loadImage("Enemy_sword_rightthrow.png");
  swordrighthit = loadImage("Enemy_sword_righthit.png");
  swordleft = loadImage("Enemy_sword_left.png");
  swordleftthrow = loadImage("Enemy_sword_leftthrow.png");
  swordlefthit = loadImage("Enemy_sword_lefthit.png");

  FullHeart = loadImage("FullHeart.png");
  HalfHeart = loadImage("HalfHeart.png");
  LostHeart = loadImage("LostHeart.png");

  lightimage = loadImage("Player_light.png");
  background = loadImage("background.png");
  //Loading Fonts
  ScoreFont = createFont("ARCADECLASSIC.TTF", 128);
  //Highscore
  data = loadStrings("Data.txt");
  highscore = parseInt(data[0]);
}
//Saving data
String data [];
//Managing gamestate
boolean game;
boolean gameover;
boolean paused;
boolean menu = true;
boolean newgame;
boolean info;
//Create Movement Variables
float dirx;
boolean jump;
boolean injump;
boolean block;
boolean blockeffective = true;
boolean slide;
boolean stopinjump;
boolean damage = false;
String dir = "right";

//Create Game

Main m1 = new Main();
Menu me1 = new Menu();
Gameover g1 = new Gameover();
Pause p1 = new Pause();
//Enemy Images
PImage enemyright;
PImage enemyleft;
//Sword Images
PImage swordright;
PImage swordrightthrow;
PImage swordrighthit;
PImage swordleft;
PImage swordleftthrow;
PImage swordlefthit;
//Giving the Player his images
PImage playerimgright;
PImage playerimgrightjump;
PImage playerimgrightblock;
PImage playerimgrightslide;
PImage playerimgleft;
PImage playerimgleftjump;
PImage playerimgleftblock;
PImage playerimgleftslide;
//The Hearts
PImage FullHeart;
PImage HalfHeart;
PImage LostHeart;
//All other Images
PImage lightimage;
PImage background;
//Cooldowns and counters
int blocktimer;
int blockcooldown = 120;
int slidetimer;
int slidecooldown = 120;
int attackssurvived;
int highscore = 0;
boolean newhighscore;
boolean slidecooldownon;
boolean blockcooldownon;
//Fonts
PFont ScoreFont;
void draw () {

  //Save Highscore
  data[0] = String.valueOf(highscore);
  saveStrings("Data.txt", data);
  //Display Game or Menu
  background(0, 40, 0);
  imageMode(CORNERS);
  image(background, 0, 0, width, height);
  //Managing menus and Main Game
  if (newgame) {
    restart();
  }
  if (game) {
    m1.update();
  } else if (gameover) {
    g1.update();
  } else if (menu) {
    me1.update();
  }
  if (paused) {
    p1.update();
  }

  //Counting
  if (block) {
    blocktimer ++;
  } else {
    blockcooldown ++;
  }
  if (slide) {
    slidetimer ++;
  } else {
    slidecooldown ++;
  }
  //managing time sensitive movement
  if (slidetimer > 15) {
    slide = false;
    slidetimer = 0;
    slidecooldown = 0;
  }
  if (blocktimer > 30) {
    block = false;
    blocktimer = 0;
    blockcooldown = 0;
  }
  //Look out for coolouts
  if (blockcooldown <= 15) {
    blockcooldownon = true;
  } else {
    blockcooldownon = false;
  }
  if (slidecooldown <= 15) {
    slidecooldownon = true;
  } else {
    slidecooldownon = false;
  }
}

//Getting Inputs

void keyPressed() {
  if ( keyCode == 27 && game) {
    //Protect instant quit
    key = 0;
    paused = true;
    game = false;
  }
  //WALK KEYS
  if (!injump) {
    if (key == 'a' || key == 'A'|| keyCode ==  37) {
      dirx = -1;
      dir = "left";
    }
    if (key == 'd' || key == 'D' || keyCode == 39) {
      dirx = 1;
      dir = "right";
    }
  }
  //JUMP KEYS
  if (key == 'w' || key == 'W' || keyCode == 32) {
    jump = true;
  }
}
void mousePressed() {
  //ATTACK/SLIDE
  if (mouseButton == LEFT && !injump && !block) {
    if (slidecooldown > 15) {
      slide = true;
    }
  }
  //BLOCK
  if (mouseButton == RIGHT && !injump && !slide) {
    if (blockcooldown > 15) {
      block = true;
    }
  }
}



void keyReleased() {
  if (key == 'w' || key == 'W' || keyCode == 32) {
    jump = false;
  }
  if (key == 'd' || key == 'D' ||key == 'a' || key == 'A' || keyCode == 37 || keyCode == 39) {
    if (!injump) {
      dirx = 0;
    } else {
      stopinjump= true;
    }
  }
}

void mouseReleased () {
  if (mouseButton == LEFT) {
    slide = false;
  }
  if (mouseButton == RIGHT) {
    block = false;
  }
}
//Start a new game
void restart () {
  newgame = false;
  gameover = false;
  menu = false;
  game = true;
  m1 = new Main();
}
