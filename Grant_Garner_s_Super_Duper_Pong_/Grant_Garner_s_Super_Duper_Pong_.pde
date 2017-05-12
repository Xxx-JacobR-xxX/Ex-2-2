//Grant Garner's Super Duper Pong, By Jacob Risch
//
PFont Title;
String quote = "MR.GARNERS SUPER DUPER PONG";
boolean game = false;
boolean info = false;
PImage Gooner;
float LeftPaddleY;
float RightPaddleY;
float ballX = 360;
float ballY = 240;
float Flip = 7;
float Ycoordinate = mouseY;
boolean RESET = false;
int SPEED;
float VERTICALSPEED = 0;
int LeftScore = 0;
int RightScore = 0;



void setup() {
  size (720, 480);
  smooth();
  Title = loadFont("ComicSansMS-48.vlw");
  textFont(Title);
  Gooner = loadImage("Picture of Garner.jpg");
  
}
void draw() {
  background(0);
  textSize(40);
  fill(255);
 text(quote, 20,60);
 text("Play", 330, 240);
 text("Info", 325, 310);
 noFill();
 stroke(255, 0, 0);
 rect(320, 200, 90, 50);
 rect(320, 270, 90, 50);
 if ((330 < mouseX) && (mouseX < 400) && (210 < mouseY) && (mouseY < 240) && (mousePressed)) {
   game = true;
 }
 if (( 320 < mouseX) && (mouseX < 410) && (270 < mouseY) && (mouseY < 320) && (mousePressed)) {
   info = true;
 }
 
 if (info == true) {
   textSize(60);
   fill(255, 0, 0);
   background(255);
   text("A GAME FIT FOR A GOD", 10, 50);
   textSize(30);
   text("Made by child prodigy Jacob Risch in 1954, this game is the original pong that was created in honor of Mr. Garner, an engineering God. After its mechanics were copied by PONG, it recieved international acclaim. Anyways, move the left paddle with W and S and move the right paddle with the mouse. Everytime the ball hits a paddle, Mr. Garner bestows extra kinetic energy upon the ball, making it go faster. Praise Garner", 20, 60, 650,420);
   rect(642, 430, 80, 80);
   fill(0);
   text("Back", 642, 440, 80, 80);
   if ((mouseX < 722) && (mouseX > 642) && (mouseY < 480) && (mouseY > 440) && (mousePressed)) {
     info = false;
   }
 }
 
 if (game == true) {
   background(0);
   int Timer = millis();
   int ACTUALTimer = 120000 - Timer;
   image(Gooner, 0, 0, 720, 480);
   textSize(50);
   text("IN HIS NAME WE PLAY", 50, 50);
   text(LeftScore, 50, 270);
   text(RightScore, 650, 270);
   text(ACTUALTimer, 300, 460);
   
   
   if (keyPressed) {
     if (key == 'w') {
       LeftPaddleY -= 15;
     } else if (key == 's') {
       LeftPaddleY += 15;
     }} 
     
     if (((ballX > 600) && (ballX < 650) && (ballY > (mouseY - 30)) && (ballY < (mouseY + 30))) || ((ballX < 120) && (ballX > 70) && (ballY > (LeftPaddleY - 5)) && (ballY < (LeftPaddleY + 60)))) {
        Flip = -Flip;
        Flip = 1.05*Flip;
        }
     if (((ballX > 600) && (ballX < 620) && (ballY > (mouseY - 30) && (ballY < (mouseY + 30))))){
       VERTICALSPEED = (ballY -(mouseY))/5;
     }
    
     if ((ballX < 120) && (ballX > 80) && (ballY > (LeftPaddleY - 5)) && (ballY < (60 + LeftPaddleY))){
       VERTICALSPEED = ((ballY - (LeftPaddleY + 25) )/5);
     }
     
     if (ballX > 720) {
       ballX = 360;
       ballY = 240;
       RESET = true;
       LeftScore ++;
       }
       if (ballX < 0) {
          ballX = 360;
       ballY = 240;
       RESET = true;
       RightScore ++;
       }
       fill (255);
       stroke(255);
       ellipse((ballX), ballY , 20, 20);
       if (RESET == true) {
         LeftPaddleY = 215;
         VERTICALSPEED = 0;
         Flip = 7;
         delay(1000);
         RESET = false;
       }
       if ((ballY < 0) || (ballY > 480)) {
         VERTICALSPEED = -VERTICALSPEED;
       }
     fill(255, 0, 0);
       rect (620, mouseY - 25 , 10, 50);
      fill(0, 0, 255);
      rect (100, LeftPaddleY, 10, 50);
      ballX += Flip;
      ballY = ballY + VERTICALSPEED;
      if (ACTUALTimer < 0) {
        image(Gooner, 0, 0, 720, 480);
        VERTICALSPEED = 0;
        Flip = 0;
        if (LeftScore > RightScore) {
          text("BLUE GARNER WINS", 0, 200);
        }
        if(RightScore > LeftScore) {
          fill(255, 0, 0);
          text("RED GARNER WINS", 240, 200);
        }
    
       
      }
    }}