class ball {
  int ballx = 200;
  int bally = 100;
  float speedX= 3;
  float speedY= 3;
  float ballsize = 50;
  int ballincrement = 100;
  float ballspeedIncrement = 4;

  ball(int tempx, int tempy, float tempsize, int tempspeedX, int tempspeedY) {
    ballx = tempx;
    bally = tempy;
    ballsize = tempsize;
    speedX = tempspeedX;
    speedY = tempspeedY;
  }

  void checkIfCollision () {
    if (dist(mouseX, mouseY, ballx, bally) < 80) {
      life-=0.4;
    }
  }


  void increaseSpeed () {
   // if (whatLevel == 2) {
      if (speedX <= ballspeedIncrement && speedX >= -ballspeedIncrement) {
        speedX *=1.1;
        if (speedY <= ballspeedIncrement && speedY >= -ballspeedIncrement) {
          speedY *=1.1;
        }
      }
   // }
  }

  void increaseBall () {
    if ((int)(score % 10) == 0 && score > 1) {
      ballspeedIncrement +=0.05;
      ballsize +=0.25;
      println(ballsize);
      
      //println(ballspeedIncrement);
      //ballsize increment??
    }
  }


  void move() {
    bally += speedY;
    ballx += speedX;
  }
  void display() { 
    ellipse(ballx, bally, ballsize, ballsize); 

    // if (ballx+(ballsize/2) > width || ballx-(ballsize/2) < 0) {
    // speedX *= -1;
    // }
    //if (bally+(ballsize/2) > height || bally-(ballsize/2) < 0) {
    // speedY *= -1;
    // }
    if (ballx > width || ballx < 0) {
      speedX *= -1;
    }
    if (bally > height || bally < 0) {
      speedY *= -1;
    }
  }
}
