class Button {
  int x;
  int y;
  int l = 600;
  int h = 150;
  String buttontext;
  boolean clicked = false;
  boolean hover;

  Button(int z1, int z2, int z3, int z4, String z5) {
    l = z3;
    h = z4;
    x = z1-l/2;
    y = z2-h/2;
    buttontext = z5;
  }
  void update() {
    onClick();
    noFill();
    stroke(0);
    rectMode(CORNER);
    //rect(x, y, l, h);
    textAlign(CENTER);
    textSize(150);
    textFont(ScoreFont);
    if (hover) {
      fill(0);
    } else {
      fill(255);
    }
    text(buttontext, x + l / 2, y + h/1.3);
    fill(255);
  }
  void onClick() {
    //Is The Button Clicked or is the mouse over it
    if (mouseX > x && mouseX < x + l) {
      if (mouseY > y && mouseY < y + h) {
        if (mousePressed && mouseButton==37) {

          clicked = true;
        } else {
          hover = true;
        }
      } else {
        hover=false;
      }
    } else {
      hover = false;
    }
  }
}
