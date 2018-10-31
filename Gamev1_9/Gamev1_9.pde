ball[] balls = new ball[8];
int ballsize = 80;
int life = 100;
int score = 0;

void setup() {
  size(1200, 800);

  for (int i=0; i< balls.length; i++) {
    balls[i] = new ball(int(random(50, 200)), int(random(50, 400)), int(random(40, 100)), int(random(5, 15)), int(random(5, 15)));
  }
}
void draw() {
  background(200);
  if (life > 0) {
    score = frameCount;
  }
  fill(0);
  textSize(32);
   text(score, 50, 40);
  text(life, 1100, 40);
  if (life <= 0) {
    textAlign(CENTER);  
    textSize(100);
    text("Game Over", 600, 300);
    textSize(75);
    text("YOUR SCORE IS "+score, 600, 400);
  }

  fill(255, 0, 0);
  for (int i=0; i< balls.length; i++) {
    balls[i].display();
    balls[i].move();
    balls[i].checkIfCollision();
    println(life);
  }
  fill(0);
  noStroke();
  ellipse(mouseX,mouseY,ballsize/2,ballsize/2);
}
