Timer startTimer;
ball[] balls = new ball[8];
int ballsize = 80;
int life = 100; // players life
float score = 0; // players score
int speed = 8; // initial speed for each ball object
int level = 1; // test to see if i can increase difficulty over time
boolean front = true; //making a start page 
boolean clickit = false; 


void setup() {
  size(1200, 800);
  startTimer = new Timer(0); // instantiating Timer class
  for (int i=0; i< balls.length; i++) { 
    balls[i] = new ball(int(random(50, 1150)), int(random(50, 750)), ballsize, speed, speed); // a for loop creating all 8 ball objects.
  }
}
void draw() {
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
    text("YOUR SCORE IS "+int(score), 600, 400);
  }
  if (front == true && mouseX >=400 && mouseX <=800 && mouseY >= 200 && mouseY <= 300) {

   clickit = true;
}
  
}


void mouseClicked() {
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
