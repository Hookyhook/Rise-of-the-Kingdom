class Info {
  Button b10 = new Button(200, 900, 500, 150, "Back");
  Info () {
  }
  void display () {
    //info text
    textSize(80);
    textAlign(CENTER);
    textLeading(100);

    text("Welcome to RISE OF KINGDOMS!!!", 800, 150);
    textSize(40);
    text("In this game you control an adventurer", 800, 250);
    text("who must protect himself from a vicious knight", 800, 300);
    text("The direction is controlled with the", 800, 350);
    text("keys A for left and D for right Alternatively arrow keys also work", 800, 400);
    text("Jump with the key W and SPACE You can move faster and slide ", 800, 450);
    text("with the left mouse button With the right mouse button you can block", 800, 500);
    text("The opponent has two attacks Your shield will not help with the Short Range Attack", 800, 550);
    text("If you block or slide too long you will be given a short cooldown", 800, 600);
textAlign(LEFT);
    text("Code  Justus von Voss", 800, 850);
    text("Graphical  Design Tanina  L von Loewenthal",800,900);
    text("Font  Jakob Fischer",800,950);




    
      


    //back Button
    b10.update();
    if (b10.clicked) {
      info = false;
      b10.clicked = false;
    }
  }
}
