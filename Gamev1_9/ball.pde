class ball {
  int ballx = 200;
  int bally = 100;
  int speedX= 3;
  int speedY= 3;
  int ballsize = 50;

  ball(int tempx, int tempy, int tempsize, int tempspeedX, int tempspeedY) {
    ballx = tempx;
    bally = tempy;
    ballsize = tempsize;
    speedX = tempspeedX;
    speedY = tempspeedY;
  }

void checkIfCollision () {
   if (dist(mouseX, mouseY, ballx, bally) < 80) {
      life-=1;
   }
}

  void move() {
    bally += speedY;
    ballx += speedX;
  }
  void display() { 
    ellipse(ballx, bally, ballsize, ballsize); 

    if (ballx+(ballsize/2) > width || ballx-(ballsize/2) < 0) {
      speedX *= -1;
    }
    if (bally+(ballsize/2) > height || bally-(ballsize/2) < 0) {
      speedY *= -1;
    }
  }
}
