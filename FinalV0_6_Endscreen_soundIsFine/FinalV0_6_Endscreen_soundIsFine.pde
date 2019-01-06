PImage img;
Timer startTimer;
import processing.sound.*;
SoundFile deadSound;
ball[] balls = new ball[9];
hblock[] hb = new hblock[3];

int ballsize = 80; //size of balls
float life = 100; // players life
float score = 0; // players score
int speed = 4; // initial speed for each ball object
boolean front = true; //making a start page
boolean clickit = false; //checking if mouse is at "new game" button position
boolean end = false;
boolean clickitend = false;


void setup() {

  size(1200, 800);
  img = loadImage("sky.jpg"); //loading sky background
  deadSound = new SoundFile(this, "nice.wav");//creating sound file

  startTimer = new Timer(0); // instantiating Timer class

  //Creating ball and block objects
  int blockspeed = 3;
  int blocksize = 50;
  for (int i=0; i< balls.length; i++) {
    balls[i] = new ball(int(random(width)), int(random(height)), ballsize, speed, speed); // a for loop creating all 8 ball objects.
  }
  int blockstart = 100;
  for (int i=0; i< hb.length; i++) {
    hb[i] = new hblock(blockstart, int(random(height)), blocksize, blocksize, blockspeed, blockspeed); //creating the block object.
  }
}
void draw() {

  background(#3D51B2);
  //creatig the front page where players click new game
  if (front == true) {
    int xw = 400;
    int y = 200;
    int h = 100;
    int bx = 510;
    int by = 260;
    noFill();
    rect(xw, y, xw, h);
    fill(0);
    text("NEW GAME", bx, by);
  }
  //Making and displaying the bouncing balls
  textSize(32);
  fill(255, 0, 0);
  if (front == false && end == false) {
    score = startTimer.Time;
    startTimer.countUp();
    image(img, 0, 0);
    for (int i=0; i< balls.length; i++) {
      balls[i].display();
      balls[i].move();
      balls[i].checkIfCollision();
      balls[i].increaseBall();
      balls[i].increaseSpeed();
    }

    fill(0);
    int tx = 50;
    int ty = 60;
    int lx = 1000;
    int ly = 50;
    text(startTimer.getTime(), tx, ty); // placing the timer
    text(life, lx, ly);
    //Making and displaying the healthblocks
    if (score >= 20) {
      for (int i = 0; i<hb.length; i++) {
        fill(0, 255, 0);
        hb[i].display();
        hb[i].move();
        hb[i].ifCollision();
      }
    }
    fill(0);
    noStroke();
    ellipse(mouseX, mouseY, ballsize/2, ballsize/2); //creating the player ball which is controlled with the mouse.
  }

  if (life <= 0) {
    end = true;
  }
  //creating the end screen and playing sound
  if (end == true) {
    background(#F74646);
    deadSound.play();
    textAlign(CENTER);
    textSize(50);
    int GOx = 600;
    int GOy = 300; //"Game Over" variables for posistion of text
    text("Game Over", GOx, GOy);
    textSize(75);
    int Sy = 400; // Score position
    text("YOUR SCORE IS "+int(score), GOx, Sy);
    //  noFill();
    // rect(400, 600, 400, 100);
    // fill(0);
    //  textSize(50);
    // text("Try Again", 610, 660);
    //delay(800);
    noLoop();
  }
  //if statement checking when mouse is hovering over the "New Game" button
  //prob magic numbers here
  int buttonx = 400;
  int buttonxl = 800; //x length
  int buttony = 200;
  int buttonyl = 300; //y length

  int newbuttonyl = 700;
  int newbuttonx = 600;

  if (front == true && mouseX >=buttonx && mouseX <=buttonxl && mouseY >= buttony && mouseY <= buttonyl) {

    clickit = true;
  }
  if (end == true && mouseX >=buttonx && mouseX <=buttony && mouseY >= newbuttonx && mouseY <= newbuttonyl) {
    clickitend = true;
    //background(0);
  }
}

//mouseclicked function that makes buttons clickable
void mouseClicked() {
  if (front == true && clickit == true) {
    front = false;
  }
  if (front == true && clickitend == true) {
    front = false;
  }
  if (clickitend == true && end == true) {
    life = 100;
    end = false;
    front = false;
    startTimer.setTime(0.0);
  }
}  
