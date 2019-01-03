Timer startTimer;
import processing.sound.*;
SoundFile deadSound;
ball[] balls = new ball[9];
hblock[] hb = new hblock[2];

//hblock hb = new hblock(100,100,50,50,2,2);
int ballsize = 80;
float life = 100; // players life
float score = 0; // players score

int speed = 4; // initial speed for each ball object
//int whatLevel = 1; // test to see if i can increase difficulty over time
boolean front = true; //making a start page
boolean clickit = false; //checking if mouse is at "new game" button position
boolean end = false;
boolean clickitend = false;

void setup() {
  
  size(1200, 800);

  deadSound = new SoundFile(this, "nice.wav");//creating sound file

  startTimer = new Timer(0); // instantiating Timer class

  for (int i=0; i< balls.length; i++) {
    balls[i] = new ball(int(random(40, 1160)), int(random(40, 760)), ballsize, speed, speed); // a for loop creating all 8 ball objects.
  }
  for (int i=0; i< hb.length; i++) {
    hb[i] = new hblock(int(random(50, 1150)), int(random(50, 750)), 50, 50, 4, 4); //creating the block object.
  }
}
void draw() {
  
  background(#3D51B2);
  //creatig the front page where players click new game
  if (front == true) {
    noFill();
    rect(400, 200, 400, 100);
    fill(0);
    text("NEW GAME", 510, 260);
  }
  //Making and displaying the healthblocks
  if (score >= 5) {
    for (int i = 0; i<hb.length; i++) {
      fill(0, 255, 0);
      hb[i].display();
      hb[i].move();
      hb[i].ifCollision();
    }
  }
  textSize(32);
  fill(255, 0, 0);
  if (front == false && end == false) {
     score = startTimer.Time;
     startTimer.countUp();
    for (int i=0; i< balls.length; i++) {
      balls[i].display();
      balls[i].move();
      balls[i].checkIfCollision();
      balls[i].increaseBall();
      balls[i].increaseSpeed();
    }
    
    fill(0);
    text(startTimer.getTime(), 50, 60);
    text(life, 1000, 50);
    fill(0);
    // noStroke();
    ellipse(mouseX, mouseY, ballsize/2, ballsize/2); //creating the player ball which is controlled with the mouse.
  }
  
  if (life <= 0) {
   end = true; 
  }

  if (end == true) {
    background(#F74646);
    deadSound.play();
    textAlign(CENTER);
    textSize(50);
    text("Game Over", 600, 300);
    textSize(75);
    text("YOUR SCORE IS "+int(score), 600, 400);
    noFill();
    rect(400, 600, 400, 100);
    fill(0);
    textSize(50);
    text("Try Again", 610, 660);
    noLoop();
  }
  //if statement checking when mouse is hovering over the "New Game" button
  if (front == true && mouseX >=400 && mouseX <=800 && mouseY >= 200 && mouseY <= 300) {

    clickit = true;
  }
  
  
 
}


void mouseClicked() {
  if (front == true && clickit == true) {
    front = false;
  }
  if (front == true && clickitend == true) {
    front = false;
}


  
}  


/*
Todo;  ?
 increment speed with an if statement setting the max speed? seems to wooork however,
 needed to remove the +ballsize/2 on if statement, 
 making  half the circles go outside screen before going the opposite way.  
 
 lvl lvlup?
 
 The requirements for the miniproject are:
 
 Design and implement your own application which fulfills the following requirements:
 
 •  Use object-oriented programming with at least two self-defined classes YAS
 
 •   Include self-defined functions, loops, and arrays. YAS
 
 •   Use keyboard and/or mouse input from a user YAS
 
 •    Play a sound when some event happens ONGOING
 
 •     Implement feedback to the user on the current state of the application, represented on the screen YAS
 
 For the idea and rules of the application you can take inspiration from existing applications, but you must implement all parts of the applications yourself.
 
 Remember to put comments in your code and write a short “readme” (text) file to introduce the user to the functionalities of your program.
 
end game screen?
Use green blocks correctly

 */
