import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class FinalV0_1 extends PApplet {

Timer startTimer;
ball[] balls = new ball[8];
int ballsize = 80;
int life = 100; // players life
float score = 0; // players score
int speed = 8; // initial speed for each ball object
int level = 1; // test to see if i can increase difficulty over time
boolean front = true; //making a start page
boolean clickit = false;


public void setup() {
  
  startTimer = new Timer(0); // instantiating Timer class
  for (int i=0; i< balls.length; i++) {
    balls[i] = new ball(PApplet.parseInt(random(50, 1150)), PApplet.parseInt(random(50, 750)), ballsize, speed, speed); // a for loop creating all 8 ball objects.
  }
}
public void draw() {
  background(200);
  if (life > 0) { // ending game when player dies - displaying players score
    if (front == false) {
    score = startTimer.getTime();
    startTimer.countUp();

  }
  }

if (front == true) {
  noFill();
  rect(400,200,400,100);
  fill(0);
  text("NEW GAME",510,260);

}


  textSize(32);
  // text(score, 50, 40);

  fill(255, 0, 0);
  if (front == false) {
    for (int i=0; i< balls.length; i++) {
      balls[i].display();
      balls[i].move();
      balls[i].checkIfCollision();
      balls[i].increase();
    }
    fill(0);
    text(startTimer.getTime(), 50, 60);
    println(life);
    text(life, 1100, 40);
    fill(0);
   // noStroke();
    ellipse(mouseX, mouseY, ballsize/2, ballsize/2);
  }

  if (life <= 0) {
    textAlign(CENTER);
    textSize(50);
    text("Game Over", 600, 300);
    textSize(75);
    text("YOUR SCORE IS "+PApplet.parseInt(score), 600, 400);
  }
  if (front == true && mouseX >=400 && mouseX <=800 && mouseY >= 200 && mouseY <= 300) {

   clickit = true;
}

}


public void mouseClicked() {
  if (front == true && clickit == true) {
    front = false;
  }
}


/*
Todo;  ?
increment speed with an if statement setting the max speed?

lvl modus?

The requirements for the miniproject are:

 Design and implement your own application which fulfills the following requirements:

 •  Use object-oriented programming with at least two self-defined classes YAS

 •   Include self-defined functions, loops, and arrays. YAS

 •   Use keyboard and/or mouse input from a user YAS

 •    Play a sound when some event happens ONGOING

 •     Implement feedback to the user on the current state of the application, represented on the screen YAS

 For the idea and rules of the application you can take inspiration from existing applications, but you must implement all parts of the applications yourself.

 Remember to put comments in your code and write a short “readme” (text) file to introduce the user to the functionalities of your program.
 */
class Timer
{

  float Time;

  Timer(float set)//constructor for creating a new timer
  {
    Time = set;
  }
  public float getTime()// this returns the current time
  {
    return (Time);
  }
  public void setTime(float set)// set the timer as what ever you put as your temp variable ie. 10 or 20 seconds
  {
    Time = set;
  }
  public void countUp()//updating timer to count up. This is called within draw() loop.
  {
    Time += 1/frameRate;
  }
}
class ball {
  int ballx = 200;
  int bally = 100;
  int speedX= 3;
  int speedY= 3;
  int ballsize = 50;
  int ballincrement = 100;

  ball(int tempx, int tempy, int tempsize, int tempspeedX, int tempspeedY) {
    ballx = tempx;
    bally = tempy;
    ballsize = tempsize;
    speedX = tempspeedX;
    speedY = tempspeedY;
  }

public void checkIfCollision () {
   if (dist(mouseX, mouseY, ballx, bally) < 80) {
      life-=1;
   }
}

  public void increase () {
    if (score >= 500) {
     ballsize = ballincrement;
    }
  }

  public void move() {
    bally += speedY;
    ballx += speedX;
  }
  public void display() { 
    ellipse(ballx, bally, ballsize, ballsize); 

    if (ballx+(ballsize/2) > width || ballx-(ballsize/2) < 0) {
      speedX *= -1;
    }
    if (bally+(ballsize/2) > height || bally-(ballsize/2) < 0) {
      speedY *= -1;
    }
  }
}

  public void settings() {  size(1200, 800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "FinalV0_1" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
